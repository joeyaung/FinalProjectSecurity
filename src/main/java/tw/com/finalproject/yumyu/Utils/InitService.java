package tw.com.finalproject.yumyu.Utils;

import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.MEMBER;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import tw.com.finalproject.yumyu.Enums.ApplicationRoles;
import tw.com.finalproject.yumyu.Enums.OfficeLocations;
import tw.com.finalproject.yumyu.Enums.SalesStages;
import tw.com.finalproject.yumyu.InternalUse.Client;
import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.ClientService;
import tw.com.finalproject.yumyu.InternalUse.Service.EmployeeService;
import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.Service.ApplicationUserService;

@Component
@Transactional
public class InitService {

	@Autowired
	private ApplicationUserService applicationuserService;

	@Autowired
	private ClientService clientService;

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@EventListener(ApplicationReadyEvent.class)
	public void doSomethingAfterStartup() {
		// Create an default Member
		System.out.println("Init Start!");
		ApplicationUser defaultApplicationUser = ApplicationUser.builder().username("joe120106@gmail.com")
				.password(passwordEncoder.encode("asd")).roles(MEMBER.name()).city("桃園市").town("大園區")
				.fullAddress("中正東路438巷15號").zipCode("337").fullName("游聿民").phone("0917922177").build();

		applicationuserService.save(defaultApplicationUser);

//		Create an default Sales Employee
		Client defaultClient = Client.builder().fullName("王小明").email("wongmin@gmail.com").phone("0985466955")
				.city("台北市").town("松山區").fullAddress("寶清街105巷13號").zipCode("105").member(defaultApplicationUser)
				.salesStage(SalesStages.NEW).build();
		Employee defaultAdmin = Employee.builder().username("admin@demo.com").password(passwordEncoder.encode("asd"))
				.roles(ApplicationRoles.ADMIN.name()).fullName("Joe Yu").phone("09179220177").title("CEO")
				.department("Admin Office").location(OfficeLocations.TAIPEI).salary(1).build();
		Employee defaultSales = Employee.builder().username("sales@demo.com").password(passwordEncoder.encode("asd"))
				.roles(ApplicationRoles.SALES.name()).fullName("Andy Chen").phone("0987987987").title("CES")
				.department("Sales").location(OfficeLocations.TAICHUNG).salary(50000)
				.manager(defaultAdmin).build();
		defaultClient.setInchargedEmployee(defaultSales);
		clientService.save(defaultClient);
		employeeService.save(defaultSales);
		System.out.println("Init Completed!");
		
	}
}
