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
		
		@GetMapping("/Events/BookEventConfirmation")
		public String bookEvent() {
			return "eventRegisConfirm";
		}
		
		@GetMapping("/inner/admin/AllEventForm")
		public String allEventForm(HttpServletRequest request, Principal principal) {
			String name = principal.getName();
			Employee emp = employeeService.findbyUsername(name);
			request.setAttribute("empName", emp.getFullName());
			return "adminAllEventForm";
		}
}
	