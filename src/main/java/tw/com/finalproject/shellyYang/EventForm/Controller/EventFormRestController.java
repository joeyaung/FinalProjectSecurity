package tw.com.finalproject.shellyYang.EventForm.Controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
		
		response.setContentType("application/json;charset=utf-8");
		return eventFormService.createEventForm(json);
		
	}
	
	@GetMapping("/getAllEventForm")
	public List<EventForm> findAllEventForm() {
		return eventFormService.findAllEventForm();
	}
	


}
