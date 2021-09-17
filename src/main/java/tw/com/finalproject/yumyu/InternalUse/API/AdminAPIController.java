package tw.com.finalproject.yumyu.InternalUse.API;

import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.ADMIN;
import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.DELIVER;
import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.SALES;
import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.SERVICE;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tw.com.finalproject.Mail.MailService;
import tw.com.finalproject.yumyu.Enums.SalesStages;
import tw.com.finalproject.yumyu.InternalUse.Client;
import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.ClientService;
import tw.com.finalproject.yumyu.InternalUse.Service.EmployeeService;
import tw.com.finalproject.yumyu.MemberOrder.MemberOrder;
import tw.com.finalproject.yumyu.MemberOrder.OrderDetail;
import tw.com.finalproject.yumyu.MemberOrder.Service.MemberOrderService;
import tw.com.finalproject.yumyu.Products.Product;
import tw.com.finalproject.yumyu.Products.Service.ProductService;
import tw.com.finalproject.yumyu.Utils.Utils;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/inner/admin/api/v1")
public class AdminAPIController {

	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private ClientService clientService;
	@Autowired
	private MemberOrderService memberOrderService;
	@Autowired
	private ProductService productService;

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
			resultMap.put("uuid", "" + curEmp.getId());
			resultList.add(resultMap);
		}

		if (allEmployeeName != null) {
			return resultList;
		} else {
			return null;
		}
	}

//	Admin Dashboard topcard info
	@GetMapping(path = "/dashboard/topcard", produces = "application/json; charset=UTF-8")
	public Map<String, Object> getTopCardInfo() {
		Map<String, Object> resultMap = new HashMap<>();
		int totalEmployee = -1;
		int totalClients = -1;
		int totalProfits = -1;
		int efficientClient = -1;

//		Get total Employee
		List<Employee> employees = employeeService.findAll();
		totalEmployee = employees.size();

//		Get total Client
		List<Client> clients = clientService.findAll();
		totalClients = clients.size();

//		Get total profits
		List<MemberOrder> orders = memberOrderService.findAllOrders();
		totalProfits = 0;
		for (MemberOrder order : orders) {
			totalProfits += order.getTotalAmount();
		}

//		Get Efficient client
		efficientClient = 0;
		for (Client client : clients) {
			if (!client.getSalesStage().equalsIgnoreCase(SalesStages.CLOSED_LOST.name())) {
				efficientClient += 1;
			}
		}
		if (totalEmployee == -1 || totalClients == -1 || totalProfits == -1 || efficientClient == -1) {
			resultMap.put("err", "oops, something went wrong.");
		} else {
			resultMap.put("status", "ok");
			resultMap.put("totalEmployee", totalEmployee);
			resultMap.put("totalClients", totalClients);
			resultMap.put("totalProfits", totalProfits);
			resultMap.put("efficientClient", efficientClient);
		}

		return resultMap;
	}

//	Admin Client Stage info
	@GetMapping(path = "/dashboard/client_stage", produces = "application/json;charset=UTF-8")
	public Map<String, Object> getClientStageForAdmin() {
		Map<String, Object> resultMap = new HashMap<>();

		List<Client> clients = clientService.findAll();
		int newCount = 0;
		int ateCount = 0;
		int engagedCount = 0;
		int testDriveCount = 0;
		int followUpCount = 0;
		int longTermCount = 0;
		int orderedCount = 0;
		int closedLostCount = 0;

		for (Client client : clients) {
			String stage = client.getSalesStage();
			if (stage.equals(SalesStages.NEW.name())) {
				newCount += 1;
			}
			if (stage.equals(SalesStages.ATTEMPT_TO_ENGAGE.name())) {
				ateCount += 1;
			}
			if (stage.equals(SalesStages.ENGAGED.name())) {
				engagedCount += 1;
			}
			if (stage.equals(SalesStages.TEST_DRIVE.name())) {
				testDriveCount += 1;
			}
			if (stage.equals(SalesStages.FOLLOW_UP.name())) {
				followUpCount += 1;
			}
			if (stage.equals(SalesStages.LONG_TERM.name())) {
				longTermCount += 1;
			}
			if (stage.equals(SalesStages.ORDERED.name())) {
				orderedCount += 1;
			}
			if (stage.equals(SalesStages.CLOSED_LOST.name())) {
				closedLostCount += 1;
			}
		}

		List<Integer> stageList = new ArrayList<>();
		stageList.add(newCount);
		stageList.add(ateCount);
		stageList.add(engagedCount);
		stageList.add(testDriveCount);
		stageList.add(followUpCount);
		stageList.add(longTermCount);
		stageList.add(orderedCount);
		stageList.add(closedLostCount);

		if (stageList.size() != 0 && newCount != 0 && ateCount != 0 && engagedCount != 0 && testDriveCount != 0
				&& followUpCount != 0 && longTermCount != 0 && orderedCount != 0 && closedLostCount != 0) {
			resultMap.put("status", "ok");
			resultMap.put("data", stageList);
		} else {
			resultMap.put("status", "fail");
			resultMap.put("error", "Opps, something went wrong.");
		}

		return resultMap;
	}

//	Admin dashboard Top Sale Products
	@GetMapping(path = "/dashboard/top_sale_products", produces = "application/json;charset=UTF-8")
	public Map<String, Object> getTopSaleProducts() {
		Map<String, Object> resultMap = new HashMap<>();
		List<MemberOrder> orders = memberOrderService.findAllOrders();
		Map<String, Integer> productMap = new HashMap<>();
		List<Product> products = productService.findAll();
		for (Product product : products) {
			productMap.put(product.getName(), 0);
		}
		for (MemberOrder order : orders) {
			List<OrderDetail> details = order.getOrderDetail();
			for (OrderDetail detail : details) {
				Product product = detail.getProduct();
				int count = productMap.get(product.getName()) + detail.getQuantity();
				productMap.put(product.getName(), count);
			}
		}
		List<Map<String, Integer>> sortedList = findTop5(productMap);
		List<Map<String, Object>> resultList = new ArrayList<>();
		for (Map<String, Integer> map : sortedList) {
			Set<String> keySet = map.keySet();
			for (String key : keySet) {
				Map<String, Object> tempMap = new HashMap<>();
				tempMap.put("name", key);
				tempMap.put("quantity", map.get(key));
				resultList.add(tempMap);
			}
		}

		resultMap.put("status", "ok");
		resultMap.put("data", resultList);

		return resultMap;
	}

	private List<Map<String, Integer>> findTop5(Map<String, Integer> data) {

		List<Map<String, Integer>> resultList = new ArrayList<>();
		int top = 5;
		for (int i = 0; i < top; i++) {
			Map<String, Integer> maxMap = new HashMap<>();
			Set<String> keySet = data.keySet();
			int maxCount = 0;
			String maxName = "";
			for (String item : keySet) {
				int count = data.get(item);
				if (count > maxCount) {
					maxCount = count;
					maxName = item;
				}
			}
			maxMap.put(maxName, maxCount);
			resultList.add(maxMap);
			data.remove(maxName);
		}

		return resultList;
	}

}
