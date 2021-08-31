package tw.com.finalproject.shellyYang.EventForm.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.finalproject.shellyYang.EventForm.EventForm;
import tw.com.finalproject.shellyYang.EventForm.Service.EventFormService;

@RestController
public class EventFormRestController {
	
	@Autowired
	private EventFormService eventRegisService;
	
	@PostMapping("Events/addEventForm")
	public EventForm addEventForm(EventForm eventForm) {
		return eventRegisService.createEventForm(eventForm);
	}

}
