package tw.com.finalproject.yumyu.PayPal.Service;


import java.io.IOException;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.paypal.http.HttpResponse;
import com.paypal.http.serializer.Json;
import com.paypal.orders.Order;
import com.paypal.orders.OrdersGetRequest;

import tw.com.finalproject.yumyu.PayPal.Config.Credentials;

@Service
public class PaypalService {
	
	public Order getOrder(String orderID) throws IOException {
		OrdersGetRequest request = new OrdersGetRequest(orderID);
		HttpResponse<Order> response = Credentials.client.execute(request);
//		System.out.println("Full response body:");
//		System.out.println(new JSONObject(new Json().serialize(response.result())).toString(4));
		return response.result();
	}

}
