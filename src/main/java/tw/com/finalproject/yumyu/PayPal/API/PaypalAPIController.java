package tw.com.finalproject.yumyu.PayPal.API;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.paypal.orders.Order;

import tw.com.finalproject.yumyu.PayPal.Service.PaypalService;

@RestController
public class PaypalAPIController {
	
	@Autowired
	private PaypalService paypalService;
	
	@PostMapping(path = "api/v1/paypal/create_order", produces = "application/json;charset=UTF-8")
	public Map<String, String> createOrderWithPaypal(@RequestBody Map<String, String> data) {
		String orderID = data.get("id");
		Order order = null;
		try {
			order = paypalService.getOrder(orderID);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("Order ID: " + order.id());
		System.out.println("Total Amount: " + order.purchaseUnits().get(0).amountWithBreakdown().value());
		Map<String, String> result = new HashMap<>();
		result.put("id", order.id());
		result.put("Total_amount", order.purchaseUnits().get(0).amountWithBreakdown().value());
		return result;
	}
}
