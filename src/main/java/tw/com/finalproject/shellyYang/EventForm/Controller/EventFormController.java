package tw.com.finalproject.shellyYang.EventForm.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EventFormController {
	
		
		@GetMapping("/Events/BookEventConfirmation")
		public String bookEvent() {
			return "eventRegisConfirm";
		}
}
	