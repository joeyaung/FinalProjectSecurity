package tw.com.finalproject.shellyYang.EventForm.Controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.EmployeeService;

@Controller
public class EventFormController {
	
		@Autowired
		private EmployeeService employeeService;
		
		@GetMapping("/inner/admin/AllEventForm")
		public String allEventForm(HttpServletRequest request, Principal principal) {
			String name = principal.getName();
			Employee emp = employeeService.findbyUsername(name);
			request.setAttribute("empName", emp.getFullName());
			return "Event/adminAllEventForm";
		}
		
		@GetMapping("/inner/admin/EventDashboard")
		public String eventDashboard(HttpServletRequest request, Principal principal) {
			String name = principal.getName();
			Employee emp = employeeService.findbyUsername(name);
			request.setAttribute("empName", emp.getFullName());
			return "Event/adminEventChart";
			
		}
		
		@GetMapping("/account/BookEventConfirmation")
		public String bookEventConfirm()  {
			return "Event/eventRegisConfirm";
		}
		
		@GetMapping("/account/event")
		public String userEventDashboard() {
			return "Event/userEventDashboard";
		}
}
	