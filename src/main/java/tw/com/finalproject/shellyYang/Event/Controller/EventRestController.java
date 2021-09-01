package tw.com.finalproject.shellyYang.Event.Controller;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import tw.com.finalproject.shellyYang.Event.Event;
import tw.com.finalproject.shellyYang.Event.Service.EventService;
import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.Service.ApplicationUserService;




@RestController
public class EventRestController {

	@Autowired
	private EventService eventService;
	
	@Autowired
	private ApplicationUserService appUserService;

	@GetMapping("/getAllEvents")
	public List<Event> getAllEvent() {

		return eventService.findAllEvent();
	}

	@GetMapping("/findEventById/{event_id}")
	public Event findEventById(@PathVariable Integer event_id) throws Exception {

		return eventService.findById(event_id);

	}

	@PostMapping(path = "/addEvent", produces = "text/plain;charset=UTF-8")
	public String addEvent(Event event) throws IOException {
		eventService.addEvent(event);
		return "success";

	}

	@PostMapping("/deleteEventById/{event_id}")
	public Map<String, String> deleteEventById(@PathVariable Integer event_id) {

		Map<String, String> map = new HashMap<String, String>();

		Integer result = eventService.deleteById(event_id);
		map.put("msg", "成功刪除id:" + result);

		return map;

	}

	@PostMapping(path = "/updateEvent", produces = "text/plain;charset=UTF-8")
	public String updateEvent(Event event) throws Exception {
		eventService.updateEvent(event);

		return "success";

	}
	
	@GetMapping("/findUserByUserName")
	public String findUserByUserName(Principal principal) throws JsonProcessingException {
		
		String userName = principal.getName();
		ApplicationUser appUser = appUserService.queryByUsername(userName);
		
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String appUserJson = ow.writeValueAsString(appUser);
		
		return appUserJson;
	}

	

}