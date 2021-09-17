package tw.com.finalproject.naiChuan.PageController;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.com.finalproject.naiChuan.Model.Service.ModelService;
import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.EmployeeService;

@Controller
@SessionAttributes
public class ModelPageController {
	
	@Autowired
	private ModelService modelService;
	
	@Autowired
	private EmployeeService employeeService;
	
<<<<<<< Updated upstream
	// 訪客端主頁面
=======
	// 訪客端，主頁面
>>>>>>> Stashed changes
	@GetMapping("/Model")
	public String reEnterModel() {
		return "model/modelAllPage";
	}
	
	// 訪客端，單一Model頁面
	@GetMapping("/Model/model")
	public String modelTypePage() {
		return "model/displayOneModel";
	}
	
	// admin 進入 model
	@GetMapping("inner/admin/edit/model")
	public String enterInner(HttpServletRequest request, HttpServletResponse response, Model m, Principal principal) {

		String empName = principal.getName();
		Employee emp = employeeService.findbyUsername(empName);
		request.setAttribute("empName", emp.getFullName());
		return "model/adminAllModel";
	}
	
	
	
}
