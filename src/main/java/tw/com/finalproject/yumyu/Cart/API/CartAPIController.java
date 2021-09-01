package tw.com.finalproject.yumyu.Cart.API;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.finalproject.yumyu.Cart.CartItem;
import tw.com.finalproject.yumyu.Cart.Service.CartService;
import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.Service.ApplicationUserService;
import tw.com.finalproject.yumyu.Products.Product;
import tw.com.finalproject.yumyu.Products.Service.ProductService;

@RestController
public class CartAPIController {

	@Autowired
	private CartService cartService;

	@Autowired
	private ApplicationUserService applicationUserService;

	@Autowired
	private ProductService productService;

	@PostMapping(path = "/api/v1/cart/add_to_cart/{id}", produces = "application/json;charset=UTF-8")
	public String addCartItem(Principal principal, @PathVariable(name = "id") String product_id,
			HttpServletRequest request) throws IOException {
		if (principal == null) {
			request.getSession().setAttribute("from", "/FinalProject/products");
			return "unauthorized";
		}
		String username = principal.getName();
		ApplicationUser member = applicationUserService.findByUsername(username);
		List<CartItem> cartItems = cartService.findByMember(member);
		long productId;
		try {
			productId = Long.parseLong(product_id);
		} catch (Exception e) {
			System.out.println("id can only be number.");
			return null;
		}
		Product product = productService.findById(productId);

		CartItem exitsCartItem = new CartItem();
		for (CartItem curCart : cartItems) {
			if (curCart.getProduct().getId() == productId) {
				exitsCartItem = curCart;
			}
		}
		if (exitsCartItem.getId() == null) {
			exitsCartItem.setMember(member);
			exitsCartItem.setProduct(product);
			exitsCartItem.setQuantityInCart(1);
		} else {
			exitsCartItem.setQuantityInCart(exitsCartItem.getQuantityInCart() + 1);
		}
		boolean saveResult = cartService.save(exitsCartItem);
		if (saveResult) {
			return "ok";
		} else {
			return "fail";
		}
	}

	@PostMapping(path = "/api/v1/cart/remove_to_cart/{id}", produces = "application/json;charset=UTF-8")
	public String removeCartItem(Principal principal, @PathVariable(name = "id") String cartIdString,
			HttpServletRequest request) throws IOException {
		if (principal == null) {
			request.getSession().setAttribute("from", "/FinalProject/products");
			return "unauthorized";
		}
		long cartId;
		try {
			cartId = Long.parseLong(cartIdString);
		} catch (Exception e) {
			System.out.println("id can only be number.");
			return null;
		}
		CartItem cartTarget = cartService.findById(cartId);
		int newQuantity = cartTarget.getQuantityInCart() - 1;
		cartTarget.setQuantityInCart(newQuantity);
		cartService.updateCartItem(cartTarget);
		System.out.println(cartTarget.getQuantityInCart());
		if (cartTarget.getQuantityInCart() <= 0) {
			cartService.deleteCartItem(cartTarget);
		}
		return "ok";

	}

	@GetMapping(path = "/api/v1/cart/member", produces = "application/json;charset=UTF-8")
	public List<CartItem> queryCartItemByMember(Principal principal) {
		if (principal == null) {
			return null;
		}
		String username = principal.getName();
		ApplicationUser member = applicationUserService.findByUsername(username);
		List<CartItem> resultList = cartService.findByMember(member);
		return resultList;
	}
}
