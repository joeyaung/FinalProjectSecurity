package tw.com.finalproject.shellyYang.Event.Controller;

import java.security.Principal;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.EmployeeService;
import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.Service.ApplicationUserService;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper; 
import com.fasterxml.jackson.databind.ObjectWriter; 



@Controller
public class EventController {

	@Autowired
	private EmployeeService employeeService;
	
	

	@GetMapping("/inner/admin/AllEventsPage")
	public String allEvents(HttpServletRequest request, Principal principal) {
		String name = principal.getName();
		Employee emp = employeeService.findbyUsername(name);
		request.setAttribute("empName", emp.getFullName());
		return "adminAllEvents";
	}

	@GetMapping("/Events")
	public String allEventsForUser() {
		return "eventForUser";
	}

	@GetMapping("/Events/OneEvent")
	public String displayOneEventForUser() {
		return "displayOneEvent";
	}

	/**
	 * 取得會員ID，direct to eventBookForm.jsp
	 
	 */
	@GetMapping("/Events/BookEvent")
	public String bookEvent()  {
		
		return "eventBookForm";
	}

}