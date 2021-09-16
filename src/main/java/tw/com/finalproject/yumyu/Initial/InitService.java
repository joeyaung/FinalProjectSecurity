package tw.com.finalproject.yumyu.Initial;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

import javax.transaction.Transactional;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import tw.com.finalproject.kevinLai.Center.Center;
import tw.com.finalproject.kevinLai.Center.Repository.CenterRepository;
import tw.com.finalproject.naiChuan.Model.Model;
import tw.com.finalproject.naiChuan.Model.Service.ModelService;
import tw.com.finalproject.naiChuan.TestDrive.TestDriveApointment;
import tw.com.finalproject.naiChuan.TestDrive.Service.TestDriveApointmentService;
import tw.com.finalproject.shellyYang.Event.Event;
import tw.com.finalproject.shellyYang.Event.Service.EventService;
import tw.com.finalproject.shellyYang.EventForm.EventForm;
import tw.com.finalproject.shellyYang.EventForm.Repository.EventFormRepository;
import tw.com.finalproject.shellyYang.News.News;
import tw.com.finalproject.shellyYang.News.Service.NewsService;

import tw.com.finalproject.yumyu.Products.Product;
import tw.com.finalproject.yumyu.Products.ProductImage;
import tw.com.finalproject.yumyu.Products.Repository.ProductRepository;
import tw.com.finalproject.yumyu.Products.Service.ProductImageService;
import tw.com.finalproject.yumyu.Products.Service.ProductService;

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
import tw.com.finalproject.yumyu.Member.Repository.ApplicationUserRepository;
import tw.com.finalproject.yumyu.Member.Service.ApplicationUserService;

@Component
@Transactional
public class InitService {

	@Autowired
	private TestDriveApointmentService testdriveApointmentService;
	@Autowired
	private ModelService modelService;


	@Autowired
	private CenterRepository centerRepository; 
	@Autowired
	private NewsService newsService;
	@Autowired
	private EventService eventService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductImageService productImageService;
	@Autowired
	private DefaultMember member;
	@Autowired
	private DefaultEmployee employee;
	@Autowired
	private DefaultClient client;
	@Autowired
	private DefaultClientActivity clientActivity;
	@Autowired
	private DefaultProduct defaultProduct;
	@Autowired
	private DefaultEvent event;
	@Autowired
	private DefaultEventForm eventForm;
	@Autowired
	private DefaultNews news;
	@Autowired
	private EventFormRepository eFormRepository;
	@Autowired
	private ApplicationUserService applicationUserService;
	@Autowired
	private PasswordEncoder passwordEncoder;


	@EventListener(ApplicationReadyEvent.class)
	public void doSomethingAfterStartup() throws IOException {
		System.out.println("Init Start!");

//		Create default Member			
		boolean resultMember = member.create();
		if (resultMember) {
			System.out.printf("-- Created default Member ---\r\n");
		} else {
			System.out.printf("-- ERROR: Failed to created Member ---\r\n");
		}

//		Create default Sales and ADMIN Employee
		int employeeCount = 10;
		boolean resultEmployee = employee.create(employeeCount);
		if (resultEmployee) {
			System.out.printf("-- Created %d default Employee ---\r\n", employeeCount);
		} else {
			System.out.printf("-- ERROR: Failed to created %d Employee ---\r\n", employeeCount);
		}

//		Create default Client
		int memberCount = 101;
		boolean resultClient = client.create();
		if (resultClient) {
			System.out.printf("-- Created %d default Client ---\r\n", memberCount);
		} else {
			System.out.printf("-- ERROR: Failed to created %i Client ---\r\n", memberCount);
		}

//		Create default Client Activity
		boolean resultActivity = clientActivity.create();
		if (resultActivity) {
			System.out.printf("-- Created %d default Client Activity ---\r\n", memberCount);
		} else {
			System.out.printf("-- ERROR: Failed to created %i Client Activity ---\r\n", memberCount);
		}
    
//		Create default Products
		boolean resultProduct = defaultProduct.create();
		int productCount = 30;
		if (resultProduct) {
			System.out.printf("-- Created %d default Products ---\r\n", productCount);
		} else {
			System.out.printf("-- ERROR: Failed to created %d Products ---\r\n", productCount);
	
		}
		

//	    Create default Event 
		event.createDefaultEventData();
		System.out.printf("-- Created default Event ---\r\n");
		
//		Create default EventForm data and default application user for event registration Chart.js
		eventForm.createDefaultApplicationUser();
		System.out.println("-- Created default Application User ---\r\n");
		eventForm.createDefaultEventFormData();
		System.out.println("-- Created default Event Form ---\r\n");
//		Create default News
		news.createDefaultNewsData();
		System.out.println("-- Created default News ---\r\n");


//		Create default Test Drive Apointment

		TestDriveApointment defaulTestdrive1 = TestDriveApointment.builder().formId("Xx111111111").driveDate("2021-10-07")
				.driveTime("10").carMod("A3").driveLoc("臺北市").driveLocSit("內湖").sales("Alex").formTime("2021/08/22 14:16:35")
				.nameCli("王大大").gendCli("先生").timCli("早").mailCli("aaa@gmail.com").telCli("0912345678").remark("").build();
		TestDriveApointment defaulTestdrive2 = TestDriveApointment.builder().formId("Xx222222222").driveDate("2021-10-07")
				.driveTime("16").carMod("A4").driveLoc("臺北市").driveLocSit("大安").sales("Beth").formTime("2021/07/21 10:22:53")
				.nameCli("陳美美").gendCli("小姐").timCli("早午").mailCli("bbbb@gmail.com").telCli("0923456789").remark("").build();
		TestDriveApointment defaulTestdrive3 = TestDriveApointment.builder().formId("PxAfyu22222").driveDate("2021-10-11")
				.driveTime("12").carMod("A3").driveLoc("臺中市").driveLocSit("北屯").sales("Andy Chen").formTime("2021/08/28 10:24:23")
				.nameCli("陳綱政").gendCli("先生").timCli("午").mailCli("cccc@gmail.com").telCli("0923456789").remark("").build();
		TestDriveApointment defaulTestdrive4 = TestDriveApointment.builder().formId("Yufhg252872").driveDate("2021-09-25")
				.driveTime("16").carMod("A5").driveLoc("臺北市").driveLocSit("大安").sales("Cath Liu").formTime("2021/09/21 10:32:51")
				.nameCli("林梅芳").gendCli("小姐").timCli("早午").mailCli("jbjb@gmail.com").telCli("0923456789").remark("").build();
		TestDriveApointment defaulTestdrive5 = TestDriveApointment.builder().formId("Hugq2182625").driveDate("2021-10-18")
				.driveTime("10").carMod("Q3").driveLoc("高雄市").driveLocSit("左營").sales("Eric Yu").formTime("2021/09/29 11:22:50")
				.nameCli("陳雅芳").gendCli("小姐").timCli("早午晚").mailCli("bqbq@gmail.com").telCli("0923456789").remark("").build();
		
		testdriveApointmentService.createTestdrive(defaulTestdrive1);
		testdriveApointmentService.createTestdrive(defaulTestdrive2);
		testdriveApointmentService.createTestdrive(defaulTestdrive3);
		testdriveApointmentService.createTestdrive(defaulTestdrive4);
		testdriveApointmentService.createTestdrive(defaulTestdrive5);

//		Create default Model
		File a3_1jpg = new File("src/main/resources/static/images/model/A3_1.jpg"); FileInputStream a3_1fis = new FileInputStream(a3_1jpg);
		byte[] byteA3outer = IOUtils.toByteArray(a3_1fis);		
		File a3_2jpg = new File("src/main/resources/static/images/model/A3_2.jpg"); FileInputStream a3_2fis = new FileInputStream(a3_2jpg);
		byte[] byteA3inner = IOUtils.toByteArray(a3_2fis);		
		File a3_bgjpg = new File("src/main/resources/static/images/model/A3_bg.jpg"); FileInputStream a3_bgfis = new FileInputStream(a3_bgjpg);
		byte[] byteA3bg = IOUtils.toByteArray(a3_bgfis);		
		File a3_an1jpg = new File("src/main/resources/static/images/model/A3_angle1.png"); FileInputStream a3_an1fis = new FileInputStream(a3_an1jpg);
		byte[] byteA3an1 = IOUtils.toByteArray(a3_an1fis);		
		File a3_an4jpg = new File("src/main/resources/static/images/model/A3_angle4.png"); FileInputStream a3_an4fis = new FileInputStream(a3_an4jpg);
		byte[] byteA3an4 = IOUtils.toByteArray(a3_an4fis);		
		File a3_an7jpg = new File("src/main/resources/static/images/model/A3_angle7.png"); FileInputStream a3_an7fis = new FileInputStream(a3_an7jpg);
		byte[] byteA3an7 = IOUtils.toByteArray(a3_an7fis);		
		File a3_an10jpg = new File("src/main/resources/static/images/model/A3_angle10.png"); FileInputStream a3_an10fis = new FileInputStream(a3_an10jpg);
		byte[] byteA3an10 = IOUtils.toByteArray(a3_an10fis);		
		File a3_an13jpg = new File("src/main/resources/static/images/model/A3_angle13.png"); FileInputStream a3_an13fis = new FileInputStream(a3_an13jpg);
		byte[] byteA3an13 = IOUtils.toByteArray(a3_an13fis);	
		File a3_an16jpg = new File("src/main/resources/static/images/model/A3_angle16.png"); FileInputStream a3_an16fis = new FileInputStream(a3_an16jpg);
		byte[] byteA3an16 = IOUtils.toByteArray(a3_an16fis);		
		File a3_an19jpg = new File("src/main/resources/static/images/model/A3_angle19.png"); FileInputStream a3_an19fis = new FileInputStream(a3_an19jpg);
		byte[] byteA3an19 = IOUtils.toByteArray(a3_an19fis);		
		
		Model defaultModel1 = Model.builder().modelType("A3").price(1410000).engineType("汽油").engineDisplacement("999").power("110").torque("200").consumption("20.1").seat("4").subtitle("Audi A3 搶眼外型玩轉風潮，新世代運動美學，兼容優雅、動感於一身")
				.description("Audi A3 各項前衛智能，每處細節，只為給您難以忘懷的駕馭體驗！內裝鋪陳專為豐富多采的生活形態所設計，搭配 Audi 新世代蜂巢型水箱護罩，綻放十足運動氣息！配備 Audi drive select 可程式車身動態系統，可依路況選擇最適合的駕馭模式，恣性縱橫每個所到之處")
				.exterior(byteA3outer).interior(byteA3inner).background(byteA3bg).angle1(byteA3an1).angle4(byteA3an4).angle7(byteA3an7).angle10(byteA3an10).angle13(byteA3an13).angle16(byteA3an16).angle19(byteA3an19).build();
				
		
		File a4_1jpg = new File("src/main/resources/static/images/model/A4_1.jpg");	FileInputStream a4_1fis = new FileInputStream(a4_1jpg);
		byte[] byteA4outer = IOUtils.toByteArray(a4_1fis);		
		File a4_2jpg = new File("src/main/resources/static/images/model/A4_2.jpg");	FileInputStream a4_2fis = new FileInputStream(a4_2jpg);
		byte[] byteA4inner = IOUtils.toByteArray(a4_2fis);		
		File a4_bgjpg = new File("src/main/resources/static/images/model/A4_bg.jpg"); FileInputStream a4_bgfis = new FileInputStream(a4_bgjpg);
		byte[] byteA4bg = IOUtils.toByteArray(a4_bgfis);		
		File a4_an1jpg = new File("src/main/resources/static/images/model/A4_angle1.png"); FileInputStream a4_an1fis = new FileInputStream(a4_an1jpg);
		byte[] byteA4an1 = IOUtils.toByteArray(a4_an1fis);		
		File a4_an4jpg = new File("src/main/resources/static/images/model/A4_angle4.png"); FileInputStream a4_an4fis = new FileInputStream(a4_an4jpg);
		byte[] byteA4an4 = IOUtils.toByteArray(a4_an4fis);		
		File a4_an7jpg = new File("src/main/resources/static/images/model/A4_angle7.png"); FileInputStream a4_an7fis = new FileInputStream(a4_an7jpg);
		byte[] byteA4an7 = IOUtils.toByteArray(a4_an7fis);		
		File a4_an10jpg = new File("src/main/resources/static/images/model/A4_angle10.png"); FileInputStream a4_an10fis = new FileInputStream(a4_an10jpg);
		byte[] byteA4an10 = IOUtils.toByteArray(a4_an10fis);		
		File a4_an13jpg = new File("src/main/resources/static/images/model/A4_angle13.png"); FileInputStream a4_an13fis = new FileInputStream(a4_an13jpg);
		byte[] byteA4an13 = IOUtils.toByteArray(a4_an13fis);	
		File a4_an16jpg = new File("src/main/resources/static/images/model/A4_angle16.png"); FileInputStream a4_an16fis = new FileInputStream(a4_an16jpg);
		byte[] byteA4an16 = IOUtils.toByteArray(a4_an16fis);		
		File a4_an19jpg = new File("src/main/resources/static/images/model/A4_angle19.png"); FileInputStream a4_an19fis = new FileInputStream(a4_an19jpg);
		byte[] byteA4an19 = IOUtils.toByteArray(a4_an19fis);
		
		Model defaultModel2 = Model.builder().modelType("A4").price(1240000).engineType("汽油").engineDisplacement("999").power("110").torque("200").consumption("17.6").seat("4").subtitle("Audi A4 截然不同的車身設計，外觀彰顯動感，強勁且優美。")
				.description("The Audi A4 Sportback 兼具動感美學與前衛科技。全車系搭載 ACC 主動式定速巡航控制系統，完美體態與聰明才智，如你一般！新世代 Audi A4 恢弘氣勢的經典盾型水箱護罩，搭配極富設計感的側邊進氣孔，一入眼，就過目不忘！搭載 S line 外觀套件，更顯動感活力，讓街頭成為你攫取眾人目光的伸展舞台！")
				.exterior(byteA4outer).interior(byteA4inner).background(byteA4bg).angle1(byteA4an1).angle4(byteA4an4).angle7(byteA4an7).angle10(byteA4an10).angle13(byteA4an13).angle16(byteA4an16).angle19(byteA4an19).build();
		
		
		File a5_1jpg = new File("src/main/resources/static/images/model/A5_1.jpg");	FileInputStream a5_1fis = new FileInputStream(a5_1jpg);
		byte[] byteA5outer = IOUtils.toByteArray(a5_1fis);		
		File a5_2jpg = new File("src/main/resources/static/images/model/A5_2.jpg");	FileInputStream a5_2fis = new FileInputStream(a5_2jpg);
		byte[] byteA5inner = IOUtils.toByteArray(a5_2fis);		
		File a5_bgjpg = new File("src/main/resources/static/images/model/A5_bg.jpg"); FileInputStream a5_bgfis = new FileInputStream(a5_bgjpg);
		byte[] byteA5bg = IOUtils.toByteArray(a5_bgfis);		
		File a5_an1jpg = new File("src/main/resources/static/images/model/A5_angle1.png"); FileInputStream a5_an1fis = new FileInputStream(a5_an1jpg);
		byte[] byteA5an1 = IOUtils.toByteArray(a5_an1fis);		
		File a5_an4jpg = new File("src/main/resources/static/images/model/A5_angle4.png"); FileInputStream a5_an4fis = new FileInputStream(a5_an4jpg);
		byte[] byteA5an4 = IOUtils.toByteArray(a5_an4fis);		
		File a5_an7jpg = new File("src/main/resources/static/images/model/A5_angle7.png"); FileInputStream a5_an7fis = new FileInputStream(a5_an7jpg);
		byte[] byteA5an7 = IOUtils.toByteArray(a5_an7fis);		
		File a5_an10jpg = new File("src/main/resources/static/images/model/A5_angle10.png"); FileInputStream a5_an10fis = new FileInputStream(a5_an10jpg);
		byte[] byteA5an10 = IOUtils.toByteArray(a5_an10fis);		
		File a5_an13jpg = new File("src/main/resources/static/images/model/A5_angle13.png"); FileInputStream a5_an13fis = new FileInputStream(a5_an13jpg);
		byte[] byteA5an13 = IOUtils.toByteArray(a5_an13fis);	
		File a5_an16jpg = new File("src/main/resources/static/images/model/A5_angle16.png"); FileInputStream a5_an16fis = new FileInputStream(a5_an16jpg);
		byte[] byteA5an16 = IOUtils.toByteArray(a5_an16fis);		
		File a5_an19jpg = new File("src/main/resources/static/images/model/A5_angle19.png"); FileInputStream a5_an19fis = new FileInputStream(a5_an19jpg);
		byte[] byteA5an19 = IOUtils.toByteArray(a5_an19fis);
		
		Model defaultModel3 = Model.builder().modelType("A5").price(1680000).engineType("汽油").engineDisplacement("999").power("140").torque("200").consumption("21.22").seat("4").subtitle("Audi A5 以全新元素融入設計語彙，為車頭、車側與車尾造型增添更多深度和氣度，開啟全新美學境界")
				.description("The Audi A5 全新設計語彙，勾勒出這款動感 5 門車型出眾卓越的外型，無論從何種角度欣賞，您皆能充分感受到令人印象深刻的運動性格。全數位虛擬座艙的 3 種顯示界面之一，內裝呈現毫不妥協的前衛豪華氛圍！")
				.exterior(byteA5outer).interior(byteA5inner).background(byteA5bg).angle1(byteA5an1).angle4(byteA5an4).angle7(byteA5an7).angle10(byteA5an10).angle13(byteA5an13).angle16(byteA5an16).angle19(byteA5an19).build();

		
		modelService.createModel(defaultModel1);
		modelService.createModel(defaultModel2);
		modelService.createModel(defaultModel3);

		//		Create default Center
		File Neihujpg = new File("src\\main\\resources\\static\\images\\center\\01.jpg");
		FileInputStream Neihujpgg = new FileInputStream(Neihujpg);
		byte[] byteNeihu = IOUtils.toByteArray(Neihujpgg);
		Center defaultCenter1 = Center.builder().centerName("內湖展示中心").centerPhone("02-27939191").centerEmail("NeihuCenter@gmail.com").centerLoc("臺北市").centerLocSit("內湖區").centerAddress("台北市內湖區新湖三路288號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteNeihu).centerLatitude("25.066693320651687").centerLongitude("121.58241079480605").build();
 
		File Daanjpg = new File("src\\main\\resources\\static\\images\\center\\02.jpg");
		FileInputStream Daanjpgg = new FileInputStream(Daanjpg);
		byte[] byteDaan = IOUtils.toByteArray(Daanjpgg);
		Center defaultCenter2 = Center.builder().centerName("大安展示中心").centerPhone("02-82443207").centerEmail("DaanCenter@gmail.com").centerLoc("臺北市").centerLocSit("大安區").centerAddress("台北市大安區四維路208巷10號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteDaan).centerLatitude("25.026287234825105").centerLongitude("121.5474338543234").build();
		
		File Pingzhenjpg = new File("src\\main\\resources\\static\\images\\center\\03.jpg");
		FileInputStream Pingzhenjpgg = new FileInputStream(Pingzhenjpg);
		byte[] bytePingzhen = IOUtils.toByteArray(Pingzhenjpgg);
		Center defaultCenter3 = Center.builder().centerName("平鎮展示中心").centerPhone("03-4158259").centerEmail("PingzhenCenter@gmail.com").centerLoc("桃園市").centerLocSit("平鎮區").centerAddress("桃園市平鎮區南豐路2號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(bytePingzhen).centerLatitude("24.900391473028883").centerLongitude("121.21014419664988").build();
		
		File Taoyuanjpg = new File("src\\main\\resources\\static\\images\\center\\04.jpg");
		FileInputStream Taoyuanjpgg = new FileInputStream(Taoyuanjpg);
		byte[] byteTaoyuan = IOUtils.toByteArray(Taoyuanjpgg);
		Center defaultCenter4 = Center.builder().centerName("桃園展示中心").centerPhone("03-3394095").centerEmail("TaoyuanCenter@gmail.com").centerLoc("桃園市").centerLocSit("桃園區").centerAddress("桃園市桃園區樹仁三街28號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteTaoyuan).centerLatitude("24.974947886449666").centerLongitude("121.32264789665159").build();
		
		File Beitunjpg = new File("src\\main\\resources\\static\\images\\center\\05.jpg");
		FileInputStream Beitunjpgg = new FileInputStream(Beitunjpg);
		byte[] byteBeitun = IOUtils.toByteArray(Beitunjpgg);
		Center defaultCenter5 = Center.builder().centerName("北屯展示中心").centerPhone("04-94698572").centerEmail("BeitunCenter@gmail.com").centerLoc("台中市").centerLocSit("北屯區").centerAddress("台中市北屯區山西路29號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteBeitun).centerLatitude("24.16925613777969").centerLongitude("120.67552299663411").build();
		File Nantunjpg = new File("src\\main\\resources\\static\\images\\center\\06.jpg");
		FileInputStream Nantunjpgg = new FileInputStream(Nantunjpg);
		byte[] byteNantun = IOUtils.toByteArray(Nantunjpgg);
		Center defaultCenter6 = Center.builder().centerName("南屯展示中心").centerPhone("04-91549841").centerEmail("NantunCenter@gmail.com").centerLoc("台中市").centerLocSit("南屯區").centerAddress("台中市南屯區精科中路18號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteNantun).centerLatitude("24.149299332609868").centerLongitude("120.59763739663363").build();

		File Zuoyingjpg = new File("src\\main\\resources\\static\\images\\center\\07.jpg");
		FileInputStream Zuoyingjpgg = new FileInputStream(Zuoyingjpg);
		byte[] byteZuoying = IOUtils.toByteArray(Zuoyingjpgg);
		Center defaultCenter7 = Center.builder().centerName("左營展示中心").centerPhone("07-8344778").centerEmail("ZuoyingCenter@gmail.com").centerLoc("高雄市").centerLocSit("左營區").centerAddress("高雄市左營區新莊一路306號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteZuoying).centerLatitude("22.670738986446395").centerLongitude("120.3008856407799").build();
		
		File Gushanjpg = new File("src\\main\\resources\\static\\images\\center\\08.jpg");
		FileInputStream Gushanjpgg = new FileInputStream(Gushanjpg);
		byte[] byteGushan = IOUtils.toByteArray(Gushanjpgg);
		Center defaultCenter8 = Center.builder().centerName("鼓山展示中心").centerPhone("07-8015406").centerEmail("GushanCenter@gmail.com").centerLoc("高雄市").centerLocSit("鼓山區").centerAddress("高雄市鼓山區龍水一街21號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteGushan).centerLatitude("22.648716879310285").centerLongitude("120.28309893523691").build();
		
		File Wujiejpg = new File("src\\main\\resources\\static\\images\\center\\09.jpg");
		FileInputStream Wujiejpgg = new FileInputStream(Wujiejpg);
		byte[] byteWujie = IOUtils.toByteArray(Wujiejpgg);
		Center defaultCenter9 = Center.builder().centerName("五結展示中心").centerPhone("03-9571691").centerEmail("WujieCenter@gmail.com").centerLoc("宜蘭縣").centerLocSit("五結鄉").centerAddress("宜蘭縣五結鄉三吉中路34號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteWujie).centerLatitude("24.70818759094591").centerLongitude("121.79173311568226").build();
		
		File Luodongjpg = new File("src\\main\\resources\\static\\images\\center\\10.jpg");
		FileInputStream Luodongjpgg = new FileInputStream(Luodongjpg);
		byte[] byteLuodong = IOUtils.toByteArray(Luodongjpgg);
		Center defaultCenter10 = Center.builder().centerName("羅東展示中心").centerPhone("03-9571691").centerEmail("LuodongCenter@gmail.com").centerLoc("宜蘭縣").centerLocSit("羅動鎮").centerAddress("宜蘭縣羅東鎮公正路188號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteLuodong).centerLatitude("24.67920227506594").centerLongitude("121.76794948925482").build();
		
		centerRepository.save(defaultCenter1);
		centerRepository.save(defaultCenter2);
		centerRepository.save(defaultCenter3);
		centerRepository.save(defaultCenter4);
		centerRepository.save(defaultCenter5);
		centerRepository.save(defaultCenter6);
		centerRepository.save(defaultCenter7);
		centerRepository.save(defaultCenter8);
		centerRepository.save(defaultCenter9);
		centerRepository.save(defaultCenter10);

		System.out.println("Init Completed!");
}
	
}
