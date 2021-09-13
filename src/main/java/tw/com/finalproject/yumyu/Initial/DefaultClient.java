package tw.com.finalproject.yumyu.Initial;

import static tw.com.finalproject.yumyu.Enums.SalesStages.ATTEMPT_TO_ENGAGE;
import static tw.com.finalproject.yumyu.Enums.SalesStages.CLOSED_LOST;
import static tw.com.finalproject.yumyu.Enums.SalesStages.ENGAGED;
import static tw.com.finalproject.yumyu.Enums.SalesStages.FOLLOW_UP;
import static tw.com.finalproject.yumyu.Enums.SalesStages.LONG_TERM;
import static tw.com.finalproject.yumyu.Enums.SalesStages.NEW;
import static tw.com.finalproject.yumyu.Enums.SalesStages.ORDERED;
import static tw.com.finalproject.yumyu.Enums.SalesStages.TEST_DRIVE;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.InternalUse.Client;
import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.ClientService;
import tw.com.finalproject.yumyu.InternalUse.Service.EmployeeService;
import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.Service.ApplicationUserService;

@Service
@Transactional
public class DefaultClient {

	@Autowired
	private ApplicationUserService applicationUserService;
	@Autowired
	private ClientService clientService;
	@Autowired
	private EmployeeService employeeService;;

	public boolean create() {
		List<ApplicationUser> queryAll = applicationUserService.queryAll();
		List<Client> defaultClients = new ArrayList<>();
		Employee employee = employeeService.findbyUsername("sales@demo.com");
		for (ApplicationUser member : queryAll) {
			Client newClient = Client.builder().fullName(member.getFullName()).email(member.getUsername())
					.phone(member.getPhone()).city(member.getCity()).town(member.getTown())
					.fullAddress(member.getFullAddress()).zipCode(member.getZipCode()).member(member).salesStage(generateRandomStage())
					.inchargedEmployee(employee).build();
			defaultClients.add(newClient);
		}
		boolean result = clientService.saveAll(defaultClients);
		return result;
	}

	private String generateRandomStage() {
		String base[] = { NEW.name(),NEW.name(),NEW.name(),NEW.name(),NEW.name(),NEW.name(), ATTEMPT_TO_ENGAGE.name(), ENGAGED.name(),
				TEST_DRIVE.name(), FOLLOW_UP.name(), LONG_TERM.name(),
				ORDERED.name(), CLOSED_LOST.name() };
		int index = getNum(0, base.length - 1);
		return base[index];

	}

	private int getNum(int start, int end) {
		return (int) ((Math.random() * (end - start + 1)) + start);
	}
}
