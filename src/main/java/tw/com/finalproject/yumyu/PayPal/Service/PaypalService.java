package tw.com.finalproject.yumyu.PayPal.Service;

import java.io.IOException;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.paypal.http.HttpResponse;
import com.paypal.http.serializer.Json;
import com.paypal.orders.Order;
import com.paypal.orders.OrderRequest;
import com.paypal.orders.OrdersGetRequest;
import com.paypal.payments.AuthorizationsCaptureRequest;
import com.paypal.payments.Capture;
import com.paypal.payments.CapturesRefundRequest;
import com.paypal.payments.LinkDescription;
import com.paypal.payments.Money;
import com.paypal.payments.Refund;
import com.paypal.payments.RefundRequest;

import tw.com.finalproject.yumyu.PayPal.Config.Credentials;

@Service
public class PaypalService {

//	Get Order
	public Order getOrder(String orderID) throws IOException {
		OrdersGetRequest request = new OrdersGetRequest(orderID);
		HttpResponse<Order> response = Credentials.client.execute(request);
		System.out.println("Full response body:");
		System.out.println(new JSONObject(new Json().serialize(response.result())).toString(4));
//		System.out.println(response.result().purchaseUnits().get(0).payments().authorizations().get(0).id());
		System.out.println(response.result().purchaseUnits().get(0).payments().captures().get(0).id());
		return response.result();
	}

//	Refund
	public boolean refundOrder(String capId, int value, boolean debug) throws IOException {
//		orderID = "23W148899R492633Y";
		RefundRequest refundRequest = new RefundRequest();
		Money money = new Money();
		money.currencyCode("TWD");
		money.value("" + value);
		refundRequest.amount(money);
		CapturesRefundRequest request = new CapturesRefundRequest(capId);
		request.prefer("return=representation");
		request.requestBody(refundRequest);
		HttpResponse<Refund> response = Credentials.client.execute(request);

		if (debug) {
			System.out.println("Status Code: " + response.statusCode());
			System.out.println("Status: " + response.result().status());
			System.out.println("Refund Id: " + response.result().id());
			System.out.println("Links: ");
			for (LinkDescription link : response.result().links()) {
				System.out.println("\t" + link.rel() + ": " + link.href() + "\tCall Type: " + link.method());
			}
			System.out.println("Full response body:");
			System.out.println(new JSONObject(new Json().serialize(response.result())).toString(4));
		}
		if (response.statusCode() == 201) {
			return true;
		}
		return false;
	}

//	Capturing authorized order
	public String capturingAuthOrder(String orderId, boolean debug) throws IOException {
		AuthorizationsCaptureRequest request = new AuthorizationsCaptureRequest(orderId);
		request.requestBody(new OrderRequest());
		HttpResponse<Capture> response = Credentials.client.execute(request);
		if (debug) {
			System.out.println("Status Code: " + response.statusCode());
			System.out.println("Status: " + response.result().status());
			System.out.println("Capture ID: " + response.result().id());
			System.out.println("Links: ");
			for (LinkDescription link : response.result().links()) {
				System.out.println("\t" + link.rel() + ": " + link.href() + "\tCall Type: " + link.method());
			}
			System.out.println("Full response body:");
			System.out.println(new JSONObject(new Json().serialize(response.result())).toString(4));
		}
		return response.result().id();
	}

}
