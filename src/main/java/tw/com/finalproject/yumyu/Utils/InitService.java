package tw.com.finalproject.yumyu.Utils;

import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.MEMBER;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import tw.com.finalproject.kevinLai.Product.Product;
import tw.com.finalproject.kevinLai.Product.Service.ProductService;
import tw.com.finalproject.naiChuan.Retailer.Retailer;
import tw.com.finalproject.naiChuan.Retailer.Service.RetailerService;
import tw.com.finalproject.naiChuan.TestDrive.TestDriveApointment;
import tw.com.finalproject.naiChuan.TestDrive.Service.TestDriveApointmentService;
import tw.com.finalproject.yumyu.Enums.ApplicationRoles;
import tw.com.finalproject.yumyu.Enums.ClientActivityType;
import tw.com.finalproject.yumyu.Enums.OfficeLocations;
import tw.com.finalproject.yumyu.Enums.SalesStages;
import tw.com.finalproject.yumyu.InternalUse.Client;
import tw.com.finalproject.yumyu.InternalUse.ClientActivity;
import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.ClientActivityService;
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
	private ClientActivityService clientActivityService;
	@Autowired
	private TestDriveApointmentService testdriveApointmentService;
	@Autowired
	private RetailerService retailerService;
	@Autowired
	private ProductService productService;
	@Autowired
	private PasswordEncoder passwordEncoder;

	@EventListener(ApplicationReadyEvent.class)
	public void doSomethingAfterStartup() {
		System.out.println("Init Start!");

//		Create default Member		
		ApplicationUser defaultApplicationUser = ApplicationUser.builder().username("joe120106@gmail.com")
				.password(passwordEncoder.encode("asd")).roles(MEMBER.name()).city("桃園市").town("大園區")
				.fullAddress("中正東路438巷15號").zipCode("337").fullName("游聿民").phone("0917922177").build();

		applicationuserService.save(defaultApplicationUser);

//		Create default Sales and Admin Employee

		Client defaultClient = Client.builder().fullName("王小明").email("wongmin@gmail.com").phone("0985466955")
				.city("台北市").town("松山區").fullAddress("寶清街105巷13號").zipCode("105").member(defaultApplicationUser)
				.salesStage(SalesStages.NEW.name()).build();
		Employee defaultAdmin = Employee.builder().username("admin@demo.com").password(passwordEncoder.encode("asd"))
				.roles(ApplicationRoles.ADMIN.name()).fullName("Joe Yu").phone("09179220177").title("CEO")
				.department("Admin Office").location(OfficeLocations.TAIPEI.name()).salary(1).build();
		Employee defaultSales = Employee.builder().username("sales@demo.com").password(passwordEncoder.encode("asd"))
				.roles(ApplicationRoles.SALES.name()).fullName("Andy Chen").phone("0987987987").title("CES")
				.department("Sales").location(OfficeLocations.TAICHUNG.name()).salary(50000).manager(defaultAdmin)
				.build();
		defaultClient.setInchargedEmployee(defaultSales);
		clientService.save(defaultClient);
		employeeService.save(defaultSales);

//		Create default Client Activity

		ClientActivity defaultClientActivity = ClientActivity.builder().client(defaultClient).employee(defaultSales)
				.title("First time walk in Taipsi showroom").activityType(ClientActivityType.WALK_IN.name())
				.content(
						"Walk in with his family. driving BMW x5, interested in Q5, would prefer discount. might be chossing rental financial method.")
				.build();
		clientActivityService.save(defaultClientActivity);

//		Create default Test Drive Apointment

		TestDriveApointment defaulTestdrive1 = TestDriveApointment.builder().formId("Xx111111").driveDate("2021-10-07")
				.carMod("A6").driveLoc("台北").driveLocSit("內湖").sales("Alex").formTime("2021/08/22 14:16:35")
				.nameCli("王大大").gendCli("先生").timCli("早").mailCli("aaa@gmail.com").telCli("0912345678").remark("")
				.build();
		TestDriveApointment defaulTestdrive2 = TestDriveApointment.builder().formId("Xx222222").driveDate("2021-10-12")
				.carMod("A7").driveLoc("台北").driveLocSit("大安").sales("Beth").formTime("2021/07/21 10:22:53")
				.nameCli("陳美美").gendCli("小姐").timCli("早午").mailCli("bbbb@gmail.com").telCli("0923456789").remark("")
				.build();
		testdriveApointmentService.createTestdrive(defaulTestdrive1);
		testdriveApointmentService.createTestdrive(defaulTestdrive2);

//		Create default Retailer
		Retailer defaultRetailer1 = Retailer.builder().retailerId("201605050000").retailerName("內湖展示中心")
				.tel("02-27939191").email("carmotorcomp@gmail.com").location("台北市內湖區新湖三路288號").workday("09:00 - 21:00")
				.weekend("10:00 - 20:00").build();
		Retailer defaultRetailer2 = Retailer.builder().retailerId("201606010000").retailerName("大安展示中心")
				.tel("02-27361899").email("carmotorcomp@gmail.com").location("台北市大安區敦化南路二段319號1樓")
				.workday("09:00 - 21:00").weekend("10:00 - 20:00").build();
		retailerService.createRetailer(defaultRetailer1);
		retailerService.createRetailer(defaultRetailer2);

//		Create default Products
		Product defaultProduct1 = Product.builder().productname("Audi rings x LAMY 限定版聯名銀灰色鋼筆").price(2250).quantity(28)
				.build();

		Product defaultProduct2 = Product.builder().productname("Audi 駕駛證行駛證皮套").price(1800).quantity(57).build();

		productService.addProduct(defaultProduct1);
		productService.addProduct(defaultProduct2);

//		END
		System.out.println("Init Completed!");

	}
}
