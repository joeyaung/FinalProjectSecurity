package tw.com.finalproject.yumyu.InternalUse.API;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tw.com.finalproject.yumyu.InternalUse.Client;
import tw.com.finalproject.yumyu.InternalUse.ClientActivity;
import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.ClientActivityService;
import tw.com.finalproject.yumyu.InternalUse.Service.ClientService;
import tw.com.finalproject.yumyu.InternalUse.Service.EmployeeService;
import tw.com.finalproject.yumyu.Utils.Utils;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/inner/sales/api/v1")
public class SalesAPIController {

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private ClientService clientService;

	@Autowired
	private ClientActivityService clientActivityService;
	@Autowired
	private PasswordEncoder passwordEncoder;

	@GetMapping(path = "/clients/query", produces = "application/json;charset=UTF-8")
	public Map<String, ArrayList<ArrayList<String>>> queryClientWithStage(@RequestParam("stage") String stage,
			HttpServletRequest request, Principal principal) {

		HashMap<String, ArrayList<ArrayList<String>>> dataMap = new HashMap<>();
		String empUsername = principal.getName();
		Employee curEmployee = employeeService.findbyUsername(empUsername);
		List<Client> clientForEmp = clientService.findByEmployee(curEmployee);
		ArrayList<ArrayList<String>> datasetLists = new ArrayList<>();
		for (Client curClientInner : clientForEmp) {
			if (!stage.equalsIgnoreCase("all") && !curClientInner.getSalesStage().equals(stage)) {
				continue;
			}
			ArrayList<String> clientData = new ArrayList<>();
			clientData.add(curClientInner.getSalesStage());
			clientData.add(curClientInner.getFullName());
			clientData.add(curClientInner.getEmail());
			clientData.add(curClientInner.getPhone());
			clientData.add(curClientInner.getCity() + curClientInner.getTown());
			if (curClientInner.getUpdateTime() != null) {
				clientData.add(curClientInner.getUpdateTime());
			} else {
				clientData.add(curClientInner.getCreateDate());
			}
			clientData.add("" + curClientInner.getId());
			datasetLists.add(clientData);
		}

		dataMap.put("data", datasetLists);

		return dataMap;
	}

	@GetMapping(path = "/client/{cid}", produces = "application/json;charset=UTF-8")
	public Client getClientInfo(@PathVariable(name = "cid") String clientID) {
		Client result = clientService.findById(Long.valueOf(clientID));
		return result;
	}

	@PostMapping(path = "/client/update/{cid}", produces = "plain/text;charset=UTF-8")
	public String updateClientInnerStageAction(@PathVariable(name = "cid") String clientID,
			@RequestBody Map<String, String> data) {
		Client client = clientService.findById(Long.valueOf(clientID));
//		fullName
		if (data.get("fullName") != null) {
			client.setFullName(data.get("fullName"));
		}
//		phone
		if (data.get("phone") != null) {
			client.setPhone(data.get("phone"));
		}
//		city
		if (data.get("city") != null) {
			client.setCity(data.get("city"));
			Utils util = new Utils();
			String formatAddress = String.format("%s%s%s", client.getCity(), client.getTown(), client.getFullAddress());
			String zipCode = util.findPostCode(formatAddress);
			client.setZipCode(zipCode);
		}
//		town
		if (data.get("town") != null) {
			client.setTown(data.get("town"));
			Utils util = new Utils();
			String formatAddress = String.format("%s%s%s", client.getCity(), client.getTown(), client.getFullAddress());
			String zipCode = util.findPostCode(formatAddress);
			client.setZipCode(zipCode);
		}
//		fullAddress
		if (data.get("fullAddress") != null) {
			client.setFullAddress(data.get("fullAddress"));
			Utils util = new Utils();
			String formatAddress = String.format("%s%s%s", client.getCity(), client.getTown(), client.getFullAddress());
			String zipCode = util.findPostCode(formatAddress);
			client.setZipCode(zipCode);
		}
//		inchargeEmployee
		if (data.get("inchargeEmployeeID") != null) {
			Employee employee = employeeService.findById(Long.valueOf(data.get("inchargeEmployeeID")));
			client.setInchargedEmployee(employee);
		}
//		stage
		if (data.get("stage") != null) {
			client.setSalesStage(data.get("stage"));
		}

		boolean result = clientService.save(client);
		if (result) {
			return "ok";
		}
		return "fail";
	}

	@PostMapping(path = "/clientActivity/query", produces = "application/json;charset=UTF-8")
	public List<ClientActivity> queryAllClientActivities(@RequestBody Map<String, String> data) {
		String clientID = data.get("id");

		Client client = clientService.findById(Long.valueOf(clientID));
		List<ClientActivity> result = clientActivityService.queryActivitiesByClient(client);
		return result;
	}

	@PostMapping(path = "/clientActivity/insert", produces = "plain/text;charset-UTF-8")
	public String insertNewActivity(Principal principal, @RequestBody Map<String, String> data) {
		String clientID = data.get("id");
		String title = data.get("title");
		String type = data.get("type");
		String content = data.get("content");
		String empUsername = principal.getName();
		Employee employee = employeeService.findbyUsername(empUsername);
		Client client = clientService.findById(Long.valueOf(clientID));
		List<ClientActivity> activites = client.getActivities();

		ClientActivity activity = ClientActivity.builder().client(client).employee(employee).title(title)
				.activityType(type).content(content).build();
		activites.add(activity);
		client.setActivities(activites);
		boolean result = clientService.save(client);
		if (result) {
			return "ok";
		}
		return "fail";
	}

	@GetMapping(path = "/employee/query/{role}", produces = "application/json;charset=UTF-8")
	public List<Employee> queryAllEmployeeIsSales(@PathVariable(name = "role") String role) {
		List<Employee> resultList = employeeService.findbyRole(role);
		return resultList;
	}

	@GetMapping(path = "/profile", produces = "application/json;charset=UTF-8")
	public Map<String, Object> queryProfileInfo(Principal principal) {
		Map<String, Object> resultMap = new HashMap<>();
		String name = principal.getName();
		Employee employee = employeeService.findbyUsername(name);
		if (employee != null) {
			resultMap.put("status", "ok");
			resultMap.put("data", employee);
		} else {
			resultMap.put("status", "fail");
			resultMap.put("error", "Opps, something went wrong.");
		}

		return resultMap;

	}

	@PutMapping(path = "/profile", produces = "application/json; charset=UTF-8")
	public Map<String, Object> updateEmployeeProfile(@RequestBody Map<String, String> data, Principal principal) {
		Map<String, Object> resultMap = new HashMap<>();

		String name = principal.getName();
		Employee employee = employeeService.findbyUsername(name);
		employee.setFullName(data.get("fullName"));
		employee.setLocation(data.get("location"));
		employee.setPhone(data.get("phone"));
		employee.setTitle(data.get("title"));
		if (data.get("password") != null) {
			employee.setPassword(passwordEncoder.encode(data.get("password")));
		}
		boolean result = employeeService.save(employee);
		if (result) {
			resultMap.put("status", "ok");
		} else {
			resultMap.put("status", "fail");
		}

		return resultMap;

	}

	@PostMapping(path = "/query/client", produces = "application/json;charset=UTF-8")
	public Map<String, Object> queryClietnSearch(@RequestBody Map<String, String> data) {
		Map<String, Object> resultMap = new HashMap<>();

		String queryString = data.get("queryString");
		List<Client> clients = clientService.queryClientsByfullName(queryString);
		List<Map<String, Object>> resultList = new ArrayList<>();
		if (clients != null) {
			if (clients.size() >= 5) {
				for (int i = 0; i < 5; i++) {
					Client client = clients.get(i);
					Map<String, Object> tempMap = new HashMap<>();
					tempMap.put("name", client.getFullName());
					tempMap.put("id", client.getId());
					resultList.add(tempMap);
				}
			} else {
				for (int i = 0; i < clients.size(); i++) {
					Client client = clients.get(i);
					Map<String, Object> tempMap = new HashMap<>();
					tempMap.put("name", client.getFullName());
					tempMap.put("id", client.getId());
					resultList.add(tempMap);
				}
			}
		}

		if (resultList != null) {
			resultMap.put("status", "ok");
			resultMap.put("data", resultList);
		}

		return resultMap;
	}
}
