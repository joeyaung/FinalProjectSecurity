package tw.com.finalproject.shellyYang.News.Controller;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.EmployeeService;

@Controller
public class NewsController {
	

	@Autowired
	private EmployeeService employeeService;

	@GetMapping("/inner/admin/AllNewsPage")
	public String allNews(HttpServletRequest request, Principal principal) {
		String name = principal.getName();
		Employee emp = employeeService.findbyUsername(name);
		request.setAttribute("empName", emp.getFullName());
		return "adminAllNews";
	}

	@GetMapping("/News")
	public String allNewsForUser() {
		return "newsForUser";
	}

	@GetMapping("/News/OneNews")
	public String displayOneNewsForUser() {
		return "displayOneNews";
	}

}
