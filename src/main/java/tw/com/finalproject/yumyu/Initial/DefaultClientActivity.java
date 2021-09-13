package tw.com.finalproject.yumyu.Initial;

import static tw.com.finalproject.yumyu.Enums.ClientActivityType.WALK_IN;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.InternalUse.Client;
import tw.com.finalproject.yumyu.InternalUse.ClientActivity;
import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.ClientActivityService;
import tw.com.finalproject.yumyu.InternalUse.Service.ClientService;
import tw.com.finalproject.yumyu.InternalUse.Service.EmployeeService;

@Service
@Transactional
public class DefaultClientActivity {

	@Autowired
	private ClientActivityService clientActivityService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private ClientService clientService;

	public boolean create() {
		List<Client> findAll = clientService.findAll();
		Employee employee = employeeService.findbyUsername("sales@demo.com");
		List<ClientActivity> activities = new ArrayList<>();
		for (Client client : findAll) {
			ClientActivity newActivity = ClientActivity.builder().client(client).employee(employee)
					.title("First time walk in Taipei showroom").activityType(WALK_IN.name())
					.content(
							"Walk in with his family. driving BMW x5, interested in Q5, would prefer discount. might be chossing rental financial method.")
					.build();
			activities.add(newActivity);
		}
		boolean result = clientActivityService.saveAll(activities);
		return result;
	}
}
