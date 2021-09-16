package tw.com.finalproject.yumyu.Initial;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.Cart.CartItem;
import tw.com.finalproject.yumyu.Enums.OrderStages;
import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.Service.ApplicationUserService;
import tw.com.finalproject.yumyu.MemberOrder.MemberOrder;
import tw.com.finalproject.yumyu.MemberOrder.OrderDetail;
import tw.com.finalproject.yumyu.MemberOrder.Service.MemberOrderService;
import tw.com.finalproject.yumyu.Products.Product;
import tw.com.finalproject.yumyu.Products.Service.ProductService;
import tw.com.finalproject.yumyu.Utils.Utils;

@Service
@Transactional
public class DefaultOrder {

	@Autowired
	private ApplicationUserService applicationUserService;
	@Autowired
	private ProductService productService;
	@Autowired
	private MemberOrderService memberOrderService;
	@Autowired
	private Utils utils;
	
	public boolean create() {
		
		List<ApplicationUser> members = applicationUserService.findAll();
		for (ApplicationUser member: members) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String now = df.format(new Date());
			
			MemberOrder order = MemberOrder.builder().createDate(now).member(member).method("paypal").paypalOrderId(utils.generateRandomString(8)).build();
			
			int cartItemCount = 3;
			List<CartItem> items = new ArrayList<>();
			for (int i = 0; i < cartItemCount;i++) {
				int randomProductId = ThreadLocalRandom.current().nextInt(1, 25);
				Product product = productService.findById(randomProductId);
				CartItem cartItem = CartItem.builder()
					.member(member)
					.product(product)
					.quantityInCart(1)
					.build();
				items.add(cartItem);				
			}
			List<OrderDetail> details = new ArrayList<>();
			for (CartItem item: items) {
				OrderDetail detail = OrderDetail.builder()
					.order(order)
					.pricePerUnit(item.getProduct().getCurPrice())
					.product(item.getProduct())
					.quantity(item.getQuantityInCart())
					.build();
				details.add(detail);
			}
			order.setOrderDetail(details);
			int totalAmount = 0;
			int totalQuantity = 0;
			for (OrderDetail detail: details) {
				totalAmount += (detail.getPricePerUnit()*detail.getQuantity());
				totalQuantity += detail.getQuantity();
			}
			order.setTotalAmount(totalAmount);
			order.setTotalQuantity(totalQuantity);
			
			int randomStageIndex = ThreadLocalRandom.current().nextInt(0, 4);
			String stage = "";
			if (randomStageIndex == 0) {
				stage = OrderStages.PREPARED.value();
			}
			if (randomStageIndex == 1) {
				stage = OrderStages.SHIPPING.value();
			}
			if (randomStageIndex == 2) {
				stage = OrderStages.CANCEL.value();
			}
			if (randomStageIndex == 3) {
				stage = OrderStages.COMPLETED.value();
			}
			order.setStage(stage);
			
			memberOrderService.save(order);
		}
		
		return true;
	}
}
