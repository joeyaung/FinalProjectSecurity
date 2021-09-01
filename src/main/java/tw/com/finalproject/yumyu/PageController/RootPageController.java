package tw.com.finalproject.yumyu.PageController;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RootPageController {

//	Index Page
	@GetMapping("/")
	public String IndexViewController() {
		return "index";
	}

//	Login Page
	@GetMapping("/login")
	public String logingViewController(HttpServletRequest request) {
		
		return "login";
	}
	
//	Register Page
	@GetMapping("/register")
	public String registerViewController() {
		return "register";
	}
	
//	Account Page
	@GetMapping("/account")
	public String accountViewController() {
		return "account";
	}
	
//	Product Page
	@GetMapping("/products")
	public String productViewController() {
		return "Product/ProductMainPage";
	}

//	Test Drive Page
	@GetMapping("/TestDrive")
	public String testDriveViewController() {
		return "TestDrive/BookForm";
	}
	
//	Shopping Cart Page
	@GetMapping("/product/cart")
	public String shoppingCartPageController() {
		return "Product/ShoppingCartPage";
	}
//	
////	TODO
////	News Page
//	@GetMapping("/News")
//	public String newsViewController() {
//		return null;
//	}
//	
	
}
