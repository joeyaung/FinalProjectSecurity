package tw.com.finalproject.yumyu.PageController.Account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/account")
public class AccountPageController {
	
	@GetMapping(path = "/setting")
	public String accountSettingViewController() {
		return "account/userSetting";
	}
}
