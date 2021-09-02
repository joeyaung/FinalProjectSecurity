package tw.com.finalproject.yumyu.PayPal.API;

import java.io.IOException;
import java.security.Principal;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.paypal.orders.Order;

import tw.com.finalproject.yumyu.Cart.CartItem;
import tw.com.finalproject.yumyu.Cart.Service.CartService;
import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.Service.ApplicationUserService;
import tw.com.finalproject.yumyu.MemberOrder.MemberOrder;
import tw.com.finalproject.yumyu.MemberOrder.OrderDetail;
import tw.com.finalproject.yumyu.MemberOrder.Service.MemberOrderService;
import tw.com.finalproject.yumyu.PayPal.Service.PaypalService;

@RestController
public class PaypalAPIController {

	@Autowired
	private PaypalService paypalService;
	@Autowired
	private CartService cartService;
	@Autowired
	private ApplicationUserService applicationUserService;
	@Autowired
	private MemberOrderService memberOrderService;

	@PostMapping(path = "api/v1/paypal/create_order", produces = "application/json;charset=UTF-8")
	public Map<String, String> createOrderWithPaypal(@RequestBody Map<String, String> data, Principal principal) {
		String orderID = data.get("id");
		Order order = null;
		try {
			order = paypalService.getOrder(orderID);
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (!orderID.equals(order.id())) {
			return null;
		}

		String username = principal.getName();
		ApplicationUser member = applicationUserService.findByUsername(username);
		
		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.ENGLISH);
		DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss", Locale.TAIWAN);
		ZonedDateTime date = LocalDateTime.parse(order.createTime(), inputFormatter).atZone(ZoneId.of("Asia/Shanghai"));
		ZonedDateTime dateFormate = date.plusHours(8L);
		String formattedDate = outputFormatter.format(dateFormate);

		MemberOrder newOrder = MemberOrder.builder().method("paypal").paypalOrderId(order.id()).member(member)
				.createDate(formattedDate).build();

		List<CartItem> cartItems = cartService.findByMember(member);
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		for (CartItem cartItem : cartItems) {
			OrderDetail newOrderDetail = OrderDetail.builder().order(newOrder).product(cartItem.getProduct())
					.quantity(cartItem.getQuantityInCart()).pricePerUnit(cartItem.getProduct().getCurPrice()).build();
			orderDetails.add(newOrderDetail);
		}
		int totalAmount = 0;
		int totalQuantity = 0;
		for (OrderDetail detail : orderDetails) {
			totalAmount += detail.getQuantity() * detail.getPricePerUnit();
			totalQuantity += detail.getQuantity();
		}
		newOrder.setOrderDetail(orderDetails);
		newOrder.setTotalAmount(totalAmount);
		newOrder.setTotalQuantity(totalQuantity);

		memberOrderService.save(newOrder);

		cartService.deleteAllCartItemByMember(member);

		Map<String, String> result = new HashMap<String, String>();
		result.put("order_id", "" + newOrder.getId());
		result.put("paypal_id", newOrder.getPaypalOrderId());

		return result;
	}
}
