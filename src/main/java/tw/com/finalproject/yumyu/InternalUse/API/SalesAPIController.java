package tw.com.finalproject.yumyu.InternalUse.API;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
			clientData.add("2021-08-01"); // TODO
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
		if (data.get("inchargedEmployee") != null) {
			Employee employee = employeeService.findById(Long.valueOf(data.get("inchargedEmployee")));
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
		System.out.println(String.format("----------------------------------%s-------------------------------", clientID));
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

		ClientActivity activity = ClientActivity.builder().client(client).employee(employee).title(title)
				.activityType(type).content(content).build();
		boolean result = clientActivityService.save(activity);
		if (result) {
			return "ok";
		}
		return "fail";
	}
	
	@GetMapping(path = "/employee/query/{role}", produces = "application/json;charset=UTF-8")
	public List<Employee> queryAllEmployeeIsSales(@PathVariable(name = "role") String role){
		List<Employee> resultList = employeeService.findbyRole(role);
		return resultList;
	}
}
