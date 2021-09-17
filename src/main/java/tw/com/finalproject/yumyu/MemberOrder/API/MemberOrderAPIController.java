package tw.com.finalproject.yumyu.MemberOrder.API;

import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.paypal.orders.AddressPortable;
import com.paypal.orders.Name;
import com.paypal.orders.Order;
import com.paypal.orders.PurchaseUnit;
import com.paypal.orders.ShippingDetail;

import tw.com.finalproject.Mail.MailService;
import tw.com.finalproject.yumyu.Enums.OrderStages;
import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.Service.ApplicationUserService;
import tw.com.finalproject.yumyu.MemberOrder.MemberOrder;
import tw.com.finalproject.yumyu.MemberOrder.Service.MemberOrderService;
import tw.com.finalproject.yumyu.PayPal.Service.PaypalService;

@RestController
public class MemberOrderAPIController {

	@Autowired
	private MemberOrderService memberOrderService;
	@Autowired
	private ApplicationUserService applicationUserService;
	@Autowired
	private PaypalService paypalService;
	@Autowired
	private MailService mailService;

	@GetMapping(path = "/account/api/v1/order", produces = "application/json;charset=UTF-8")
	public List<MemberOrder> queryMemberOrdersAll(Principal principal) {
		String username = principal.getName();
		ApplicationUser member = applicationUserService.findByUsername(username);
		List<MemberOrder> resultList = memberOrderService.findByMember(member);
		return resultList;
	}

	@GetMapping(path = "/inner/admin/api/v1/order", produces = "application/json; charset=UTF-8")
	public List<MemberOrder> queryAllOrders() {
		List<MemberOrder> result = memberOrderService.findAllOrders();
		return result;
	}

	@GetMapping(path = "/inner/admin/api/v1/order/{id}", produces = "application/json; charset=utf-8")
	public Map<String, Object> queryMemberOrderByID(@PathVariable(name = "id") String orderId) throws IOException {
		long id = 0L;
		try {
			id = Long.parseLong(orderId);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		Map<String, Object> resultMap = new HashMap<>();
		MemberOrder order = memberOrderService.findById(id);
		if (order != null) {
			resultMap.put("backendOrderInfo", order);
		}
		String paypalId = order.getPaypalOrderId();
		Order paypalOrderInfo = paypalService.getOrder(paypalId);
		List<PurchaseUnit> purchaseUnits = paypalOrderInfo.purchaseUnits();
		Map<String, String> shippingInfoMap = new HashMap<>();
		for (PurchaseUnit unit : purchaseUnits) {
			ShippingDetail shippingDetail = unit.shippingDetail();
			AddressPortable address = shippingDetail.addressPortable();
			String country = address.countryCode();
			String addressArea1 = address.adminArea1();
			String addressArea2 = address.adminArea2();
			String addressArea3 = address.adminArea3();
			String addressLine1 = address.addressLine1();
			String addressLine2 = address.addressLine2();
			String addressLine3 = address.addressLine3();
			String postalCode = address.postalCode();
			Name name = shippingDetail.name();
			String fullName = name.fullName();
			shippingInfoMap.put("country", country);
			shippingInfoMap.put("postalCode", postalCode);
			shippingInfoMap.put("addressArea1", addressArea1);
			shippingInfoMap.put("addressArea2", addressArea2);
			shippingInfoMap.put("addressArea3", addressArea3);
			shippingInfoMap.put("addressLine1", addressLine1);
			shippingInfoMap.put("addressLine2", addressLine2);
			shippingInfoMap.put("addressLine3", addressLine3);
			shippingInfoMap.put("fullName", fullName);
		}
		if (paypalOrderInfo != null) {
			resultMap.put("shippingInfo", shippingInfoMap);
		}
		return resultMap;
	}

	@PutMapping(path = "/inner/admin/api/v1/order/{id}", produces = "application/json; charset=UTF-8")
	public Map<String, Object> updateOrderStage(@PathVariable("id") String idString,
			@RequestBody Map<String, String> data) {
		Map<String, Object> resultMap = new HashMap<>();
		String newStage = data.get("stage");
		String stageFinal = null;
		for (OrderStages curStage : OrderStages.values()) {
			if (curStage.value().equals(newStage)) {
				stageFinal = curStage.value();
			}
		}
		if (stageFinal == null) {
			resultMap.put("status", "fail");
			return resultMap;
		}
		long id = -1;
		try {
			id = Long.parseLong(idString);
		} catch (Exception e) {
			resultMap.put("status", "fail");
			return resultMap;
		}
		if (id == -1) {
			resultMap.put("status", "fail");
			return resultMap;
		}
		MemberOrder order = memberOrderService.findById(id);
		order.setStage(stageFinal);
		boolean result = memberOrderService.save(order);
		if (result) {
			if (order.isSub()) {
				boolean sendResult = sendEmailWhenOrderStatusChange(order.getMember().getUsername(), order);
				if (sendResult) {
					resultMap.put("status", "ok");
				}
			} else {
				resultMap.put("status", "ok");
			}
		} else {
			resultMap.put("status", "fail");
		}

		return resultMap;
	}

	@PostMapping(path = "/api/v1/order/cancel/{id}", produces = "application/json;charset=UTF-8")
	public Map<String, Object> cancelOrder(Principal principal, @PathVariable(name = "id") String idString)
			throws IOException {
		Map<String, Object> resultMap = new HashMap<>();

		long id = -1;
		try {
			id = Long.parseLong(idString);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "訂單編號錯誤");
		}
		MemberOrder order = memberOrderService.findById(id);
		Order response = paypalService.getOrder(order.getPaypalOrderId());
		String capId = response.purchaseUnits().get(0).payments().captures().get(0).id();
		boolean refundResult = paypalService.refundOrder(capId, order.getTotalAmount(), true);

		if (refundResult) {
			order.setStage(OrderStages.CANCEL.value());
			memberOrderService.save(order);
			if (order.isSub()) {
				boolean sendResult = sendEmailWhenOrderStatusChange(order.getMember().getUsername(), order);
				if (sendResult) {
					resultMap.put("status", "ok");
					return resultMap;
				}
			}
			resultMap.put("status", "ok");
			return resultMap;
		}
		resultMap.put("status", "fail");
		return resultMap;
	}

	@PostMapping(path = "/api/v1/order/sub/{id}", produces = "application/json;charset=UTF-8")
	public Map<String, Object> updateOrderSubStatus(@PathVariable(name = "id") String idString,
			@RequestBody Map<String, String> data) {
		Map<String, Object> resultMap = new HashMap<>();

		String newStatus = data.get("newStatus");
		boolean newStatusBoolean = false;
		if (newStatus.equals("true")) {
			newStatusBoolean = true;
		} else {
			newStatusBoolean = false;
		}

		long id = -1;
		try {
			id = Long.parseLong(idString);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "訂單編號錯誤");
		}
		MemberOrder order = memberOrderService.findById(id);
		order.setSub(newStatusBoolean);
		boolean result = memberOrderService.save(order);
		if (result) {
			resultMap.put("status", "ok");
		} else {
			resultMap.put("status", "fail");
		}
		return resultMap;
	}

	private boolean sendEmailWhenOrderStatusChange(String email, MemberOrder order) {
		boolean result = mailService.sendOrderStatusChangeMail(email, order);
		return result;
	}

}
