package tw.com.finalproject.kevinLai.Center.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.com.finalproject.kevinLai.Center.Center;
import tw.com.finalproject.kevinLai.Center.Service.CenterService;

@Controller
@SessionAttributes
public class CenterController {
	
	private CenterService centerService;
	
	// 顯示前台主頁面
	@GetMapping(path = "/center")
	public String centerPage() {
		return "center/centerPage";
	}
	
	//單一中心的頁面
	@GetMapping(path = "/center/location")
	public String centerIdPage() {
		return "center/centerIdPage";
	}
	
//	//單一中心的頁面
//	@GetMapping(path = "/center/location/{centerId}")
//	public String centerIdPage(@PathVariable Integer centerId) {
//		Center center= centerService.findCenterById(centerId);
////		setAttributter(center,center);
//		return "center/centerIdPage";
//	}
	
	
	//後台頁面
	@GetMapping(path = "/inner/admin/edit/center")
	public String centerForAdmin() {
		return "center/centerForAdmin";
	}
	
	

}
