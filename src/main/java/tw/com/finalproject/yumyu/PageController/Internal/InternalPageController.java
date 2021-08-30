package tw.com.finalproject.yumyu.PageController.Internal;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.finalproject.yumyu.Enums.ApplicationRoles;
import tw.com.finalproject.yumyu.Enums.OfficeLocations;
import tw.com.finalproject.yumyu.InternalUse.Client;
import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.ClientService;
import tw.com.finalproject.yumyu.InternalUse.Service.EmployeeService;

@Controller
public class InternalPageController {

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private ClientService clientService;

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
		List<Employee> adminEmployees = employeeService.findbyRole(ApplicationRoles.ADMIN.name());
		request.setAttribute("admins", adminEmployees);
		List<String> locations = List.of(
					OfficeLocations.TAIPEI.name(),
					OfficeLocations.TAOYUAN.name(),
					OfficeLocations.TAICHUNG.name(),
					OfficeLocations.TAINAN.name(),
					OfficeLocations.KAOSHIUNG.name()
				);
		request.setAttribute("locations", locations);
		return "inner/admin";
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
	public String showEmployeeProfilePage(@RequestParam("q") String id, HttpServletRequest request,
			Principal principal) {
		String username = principal.getName();
		Employee emp = employeeService.findbyUsername(username);
		Employee curEmployee = employeeService.findById(Long.valueOf(id));
		request.setAttribute("empName", emp.getFullName());
		request.setAttribute("id", curEmployee.getId());
		request.setAttribute("fullName", curEmployee.getFullName());
		request.setAttribute("email", curEmployee.getUsername());
		request.setAttribute("phone", curEmployee.getPhone());
		request.setAttribute("title", curEmployee.getTitle());
		request.setAttribute("manager", curEmployee.getManager().getFullName());
		request.setAttribute("department", curEmployee.getDepartment());
		request.setAttribute("loc", curEmployee.getLocation());
		request.setAttribute("sal", curEmployee.getSalary());
		return "inner/employeeProfile";
	}

//	Client Profile Page
	@GetMapping("/inner/sales/ClientInfo")
	public String clientInnerViewPageController(@RequestParam("cli") String clientID, HttpServletResponse response,
			Principal principal, HttpServletRequest request) {
		Client curClient = clientService.findById(Long.valueOf(clientID));
		if (curClient == null) {
			return "redirect:inner/sales";
		}

		Cookie idCookie = new Cookie("cliID", "" + curClient.getId());
		response.addCookie(idCookie);
		String username = principal.getName();
		Employee employee = employeeService.findbyUsername(username);
		request.setAttribute("empName", employee.getFullName());

		return "inner/ClientProfilePage";
	}

//	Client Stage Overview Page
	@GetMapping(path = "/inner/sales/Clients/{stage}")
	public String salesStageClientPageViewController(HttpServletRequest request, HttpServletResponse response,
			@PathVariable String stage, Principal principal) {
		request.setAttribute("stage", stage);
		String username = principal.getName();
		Employee employee = employeeService.findbyUsername(username);
		request.setAttribute("empName", employee.getFullName());

		return "inner/SalesAllClientTemplate";
	}
	
	@GetMapping(path = "/inner/admin/addEmployee")
	public String adminAddEmployeePageController(HttpServletRequest request, Principal principal) {
		String name = principal.getName();
		Employee emp = employeeService.findbyUsername(name);
		request.setAttribute("empName", emp.getFullName());
		return "inner/AddEmployeePage";
	}

}
