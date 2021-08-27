package tw.com.finalproject.yumyu.InternalUse.API;

import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.ADMIN;
import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.DELIVER;
import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.SALES;
import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.SERVICE;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tw.com.finalproject.Mail.MailService;
import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.EmployeeService;
import tw.com.finalproject.yumyu.Utils.Utils;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/inner/admin/api/v1")
public class AdminAPIController {

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private MailService mailService;

	// Admin Adding Employee into DB
	@PostMapping(path = "/employee/create", produces = "application/json;charset=UTF-8")
	public Employee adminCreateEmployee(@RequestBody Map<String, String> data) {
		String username = data.get("username");
		boolean usernameExits = employeeService.isUsernameExits(username);
		if (usernameExits) {
			return null;
		}
		Employee newEmployee = new Employee();
		Utils util = new Utils();
		newEmployee.setUsername(data.get("username"));
		String rawPassword = util.generateRandomString(6);
		newEmployee.setPassword(passwordEncoder.encode(rawPassword));
		String department = data.get("department");
		if (department.equals("ADMIN")) {
			newEmployee.setRoles(ADMIN.name());
		}
		if (department.equals("SALES")) {
			newEmployee.setRoles(SALES.name());
		}
		if (department.equals("DELIVER")) {
			newEmployee.setRoles(DELIVER.name());
		}
		if (department.equals("SERVICE")) {
			newEmployee.setRoles(SERVICE.name());
		}
		newEmployee.setFullName(data.get("fullName"));
		newEmployee.setPhone(data.get("phone"));
		newEmployee.setTitle(data.get("title"));
		newEmployee.setDepartment(data.get("department"));
		newEmployee.setLocation(data.get("location"));
		newEmployee.setSalary(Integer.valueOf(data.get("salary")));
		newEmployee.setManager(employeeService.findById(Long.valueOf(data.get("manager"))));

		boolean save = employeeService.save(newEmployee);

		if (save) {
			mailService.sendEmployeeRegisterMail(newEmployee, rawPassword);
			return newEmployee;
		}
		return null;
	}

	// SearchBar API get query result Employee
	@PostMapping(path = "/employee/queryByName", produces = "application/json; charset= UTF-8")
	public List<Map<String, String>> getQueryEmployeeName(@RequestParam("q") String queryString) {

		List<Employee> allEmployeeName = employeeService.getQueryEmpName(queryString);
		List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
		for (Employee curEmp : allEmployeeName) {
			Map<String, String> resultMap = new HashMap<String, String>();
			resultMap.put("name", curEmp.getFullName());
			resultMap.put("uuid", ""+curEmp.getId());
			resultList.add(resultMap);
		}

		if (allEmployeeName != null) {
			return resultList;
		} else {
			return null;
		}
	}


}
