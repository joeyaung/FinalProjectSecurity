package tw.com.finalproject.shellyYang.Event.Controller;

import java.security.Principal;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.EmployeeService; 



@Controller
public class EventController {

	@Autowired
	private EmployeeService employeeService;
	
	

	@GetMapping("/inner/admin/AllEventsPage")
	public String allEvents(HttpServletRequest request, Principal principal) {
		String name = principal.getName();
		Employee emp = employeeService.findbyUsername(name);
		request.setAttribute("empName", emp.getFullName());
		return "Event/adminAllEvents";
	}

	@GetMapping("/Events")
	public String allEventsForUser() {
		return "Event/eventForUser";
	}

	@GetMapping("/Events/OneEvent")
	public String displayOneEventForUser() {
		return "Event/displayOneEvent";
	}

	/**
	 * 取得會員ID，direct to eventBookForm.jsp
	 
	 */
	@GetMapping("/account/BookEvent")
	public String bookEvent()  {
		return "Event/eventBookForm";
	}

}