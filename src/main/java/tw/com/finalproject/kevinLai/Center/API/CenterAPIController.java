package tw.com.finalproject.kevinLai.Center.API;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import tw.com.finalproject.kevinLai.Center.Center;
import tw.com.finalproject.kevinLai.Center.Service.CenterService;

@RestController
public class CenterAPIController {
	
	@Autowired
	private CenterService centerService;
	
	//找全部 (v)
	@GetMapping("/getAllCneter")
	@ResponseBody
	public List<Center> findAllCenterAction(){
		return centerService.queryCenterAll();
	}
	
	//用id找單筆資料(V)
	@GetMapping("/findCenterById/{centerId}")
	public Center findCenterByIdAction(@PathVariable Integer centerId) {
		return centerService.findCenterById(centerId);
		
	}
	
	//新增資料 (不知道如何用postman測)
	@PostMapping(path = "/addCenter", produces = "text/plain;charset=UTF-8")
	public String addCenterAction(Center center) {
		centerService.addCenter(center);
		return "success";
	}
	
	//刪除資料 (V)
	@PostMapping(path = "/deleteCenterById/{centerId}")
	public Map<String,String> deleteCenterByIdAction(@PathVariable Integer centerId){
		Map<String, String> centerMap = new HashMap<String,String>();
		boolean result = centerService.deleteCenterById(centerId);
		if(result) {
			centerMap.put("msg","成功刪除id:" + centerId);
		}else {
			System.out.println("刪除失敗");
		}
		return centerMap;
	
	}
	
	//修改資料 (不知道如何用postman測)
	@PostMapping(path = "/updateCenter", produces = "text/plain;charset=UTF-8")
	public String updateCenterAction(Center center) {
		centerService.updateCenter(center);
//		System.out.println("Controller資料123123123132");
		return "success";
	}
	

}
