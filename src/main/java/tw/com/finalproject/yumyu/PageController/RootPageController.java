package tw.com.finalproject.yumyu.PageController;

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
	public String logingViewController() {
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
	
	

//	Test Drive Page
	@GetMapping("/TestDrive")
	public String testDriveViewController() {
		return "TestDrive/BookForm";
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
