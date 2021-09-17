package tw.com.finalproject.shellyYang.EventForm.Controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tw.com.finalproject.shellyYang.EventForm.EventForm;
import tw.com.finalproject.shellyYang.EventForm.Service.EventFormService;

@RestController
public class EventFormRestController {
	
	@Autowired
	private EventFormService eventFormService;
	
	@PostMapping("/addEventForm")
	public String addEventForm(@RequestParam("json") String json, HttpServletResponse response) {
		String result = null;
			
		response.setContentType("application/json;charset=utf-8");
		try {
			
			result = eventFormService.createEventForm(json);
			
			System.out.println("Im result=" + result);
			
		}catch(Exception ex){
		//攔截Violation of Unique Contraints錯誤
				return "您已報名過此活動，請至活動管理確認！";
			
		}
		return result;
		
		
	}
	
	@GetMapping("/getAllEventForm")
	public List<EventForm> findAllEventForm() {
		return eventFormService.findAllEventForm();
	}
	
	@GetMapping("/findEventFormByUserid/{user_id}")
	public List<EventForm> findEventFormByUserid(@PathVariable Long user_id){
		return eventFormService.findEventByUserid(user_id);
	}
	
	@PostMapping("/approveEventForm")
	public boolean approveEventForm(String jsonString) {
		if(eventFormService.approveEventForm(jsonString) == true) {
			return true;
		}else
			return false;		
		
	}
	
	@PostMapping("/cancelEventRegistration")
	public boolean cancelEventRegistration(@RequestParam String formId) {
		if(eventFormService.cancelEventRegistration(formId)==true) {
			return true;
		}else
			return false;
		
	}
	
	@GetMapping("/findEachEventManCount")
	public List<Integer> findEventManCount(){
		return eventFormService.findNumberOfMan();
	}
	
	@GetMapping("/findEachEventWomanCount")
	public List<Integer> findEventWomanCount(){
		return eventFormService.findNumberOfWoman();
	}
	@PostMapping("/findByStatus")
	public List<EventForm> findEventFormByStatus(@RequestParam String status){
		List<EventForm> list = null;
		if(status!="") {
			list = eventFormService.findByStatus(status);
		}else {
			
			System.out.println("狀態為空白");
		}
		
		return list;
	
	}



}
