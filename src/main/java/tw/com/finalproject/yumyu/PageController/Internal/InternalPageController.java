package tw.com.finalproject.yumyu.PageController.Internal;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.finalproject.yumyu.Enums.ApplicationRoles;
import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.EmployeeService;

@Controller
public class InternalPageController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@GetMapping("/login_inner")
	public String innerLoginViewController() {
		return "inner/inner";
	}
	
	@GetMapping("/inner")
	public String loginRedirectController(Principal principal) {
		String name = principal.getName();
		Employee employee = employeeService.findbyUsername(name);
		String roles = employee.getRoles();
		if (roles.equals(ApplicationRoles.ADMIN.name())) {
			return "redirect:inner/admin";
		}
		if (roles.equals(ApplicationRoles.SALES.name())) {
			return "redirect:inner/sales";
		}
		return "/";
	}
	
	@GetMapping("/inner/admin")
	public String adminViewController(HttpServletRequest request, Principal principal) {
		
		String username = principal.getName();
		Employee employee = employeeService.findbyUsername(username);
		String empName = employee.getFullName();
		request.setAttribute("empName", empName);
		return "inner/AddEmployeePage";
	}
	
	@GetMapping("/inner/sales")
	public String salesViewController(HttpServletRequest request, Principal principal) {
		String username = principal.getName();
		Employee employee = employeeService.findbyUsername(username);
		String empName = employee.getFullName();
		request.setAttribute("empName", empName);
		request.setAttribute("stage", "All");
		return "inner/SalesAllClientTemplate";
	}
	
	@GetMapping("/inner/emp")
	public String showEmployeeProfilePage(@RequestParam("q") String id, HttpServletRequest request, Principal principal) {
		String username = principal.getName();
		Employee emp = employeeService.findbyUsername(username);
		request.setAttribute("empName", emp.getFullName());
		request.setAttribute("id", emp.getId());
		request.setAttribute("fullName", emp.getFullName());
		request.setAttribute("email", emp.getUsername());
		request.setAttribute("phone", emp.getPhone());
		request.setAttribute("title", emp.getTitle());
		request.setAttribute("manager", emp.getManager());
		request.setAttribute("department", emp.getDepartment());
		request.setAttribute("loc", emp.getLocation());
		request.setAttribute("sal", emp.getSalary());
		return "inner/employeeProfile";
	}

}
