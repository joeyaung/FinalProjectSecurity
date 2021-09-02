package tw.com.finalproject.kevinLai.Center.PageController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.com.finalproject.kevinLai.Center.Service.CenterService;

@Controller
@SessionAttributes
public class CenterPage {
	
	private CenterService centerService;
	
	// 顯示商品頁面
	@GetMapping(path = "/center")
	public String centerPage() {
		return "center/centerPage";
	}
	
	//後台頁面
	@GetMapping(path = "/inner/admin/edit/center")
	public String centerForAdmin() {
		return "center/centerForAdmin";
	}

}
