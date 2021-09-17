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

//		Create default Test Drive Apointment

		TestDriveApointment defaulTestdrive1 = TestDriveApointment.builder().formId("Xx111111111").driveDate("2021-10-07")
				.driveTime("10").carMod("A3").driveLoc("臺北市").driveLocSit("內湖").sales("Alex").formTime("2021/08/22 14:16:35")
				.nameCli("王大大").gendCli("先生").timCli("早").mailCli("aaa@gmail.com").telCli("0912345678").remark("").build();
		TestDriveApointment defaulTestdrive2 = TestDriveApointment.builder().formId("Xx222222222").driveDate("2021-10-07")
				.driveTime("16").carMod("A4").driveLoc("臺北市").driveLocSit("大安").sales("Beth").formTime("2021/07/21 10:22:53")
				.nameCli("陳美美").gendCli("小姐").timCli("早午").mailCli("bbbb@gmail.com").telCli("0923456789").remark("").build();
		TestDriveApointment defaulTestdrive3 = TestDriveApointment.builder().formId("PxAfyu22222").driveDate("2021-10-11")
				.driveTime("12").carMod("A3").driveLoc("臺中市").driveLocSit("北屯").sales("Andy Chen").formTime("2021/08/28 10:24:23")
				.nameCli("陳國政").gendCli("先生").timCli("午").mailCli("cccc@gmail.com").telCli("0923456789").remark("").build();
		TestDriveApointment defaulTestdrive4 = TestDriveApointment.builder().formId("Yufhg252872").driveDate("2021-09-25")
				.driveTime("16").carMod("A5").driveLoc("臺北市").driveLocSit("大安").sales("Cath Liu").formTime("2021/09/01 10:32:51")
				.nameCli("林梅芳").gendCli("小姐").timCli("早午").mailCli("jbjb@gmail.com").telCli("0923456789").remark("").build();
		TestDriveApointment defaulTestdrive5 = TestDriveApointment.builder().formId("Hugq2182625").driveDate("2021-10-18")
				.driveTime("10").carMod("Q3").driveLoc("高雄市").driveLocSit("左營").sales("Eric Yu").formTime("2021/09/09 11:22:50")
				.nameCli("陳雅芳").gendCli("小姐").timCli("早午晚").mailCli("bqbq@gmail.com").telCli("0923456789").remark("").build();
		TestDriveApointment defaulTestdrive6 = TestDriveApointment.builder().formId("RWgq2G82695").driveDate("2021-09-28")
				.driveTime("13").carMod("A3").driveLoc("高雄市").driveLocSit("左營").sales("Eric Yu").formTime("2021/09/14 11:12:42")
				.nameCli("林婉柔").gendCli("小姐").timCli("晚").mailCli("jjwwo@gmail.com").telCli("0923456987").remark("").build();
		
		testdriveApointmentService.createTestdrive(defaulTestdrive1);
		testdriveApointmentService.createTestdrive(defaulTestdrive2);
		testdriveApointmentService.createTestdrive(defaulTestdrive3);
		testdriveApointmentService.createTestdrive(defaulTestdrive4);
		testdriveApointmentService.createTestdrive(defaulTestdrive5);
		testdriveApointmentService.createTestdrive(defaulTestdrive6);

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
		
		Model defaultModel1 = Model.builder().modelType("A3").price(1410000).engineType("L3 缸內直噴渦輪增壓引擎").engineDisplacement("999").power("110").torque("200").consumption("20.1").seat("4").subtitle("Audi A3 搶眼外型玩轉風潮，新世代運動美學，兼容優雅、動感於一身")
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
		
		Model defaultModel2 = Model.builder().modelType("A4").price(1240000).engineType("L4 汽油渦輪增壓引擎").engineDisplacement("999").power("110").torque("200").consumption("17.6").seat("4").subtitle("Audi A4 截然不同的車身設計，外觀彰顯動感，強勁且優美。")
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
		
		Model defaultModel3 = Model.builder().modelType("A5").price(1680000).engineType("L4 汽油渦輪增壓引擎").engineDisplacement("999").power("140").torque("200").consumption("21.22").seat("4").subtitle("Audi A5 以全新元素融入設計語彙，為車頭、車側與車尾造型增添更多深度和氣度，開啟全新美學境界")
				.description("The Audi A5 全新設計語彙，勾勒出這款動感 5 門車型出眾卓越的外型，無論從何種角度欣賞，您皆能充分感受到令人印象深刻的運動性格。全數位虛擬座艙的 3 種顯示界面之一，內裝呈現毫不妥協的前衛豪華氛圍！")
				.exterior(byteA5outer).interior(byteA5inner).background(byteA5bg).angle1(byteA5an1).angle4(byteA5an4).angle7(byteA5an7).angle10(byteA5an10).angle13(byteA5an13).angle16(byteA5an16).angle19(byteA5an19).build();

		File q3_1jpg = new File("src/main/resources/static/images/model/Q3_1.jpg");	FileInputStream q3_1fis = new FileInputStream(q3_1jpg);
		byte[] byteQ3outer = IOUtils.toByteArray(q3_1fis);		
		File q3_2jpg = new File("src/main/resources/static/images/model/Q3_2.jpg");	FileInputStream q3_2fis = new FileInputStream(q3_2jpg);
		byte[] byteQ3inner = IOUtils.toByteArray(q3_2fis);		
		File q3_bgjpg = new File("src/main/resources/static/images/model/Q3_bg.jpg"); FileInputStream q3_bgfis = new FileInputStream(q3_bgjpg);
		byte[] byteQ3bg = IOUtils.toByteArray(q3_bgfis);		
		File q3_an1jpg = new File("src/main/resources/static/images/model/Q3_angle1.png"); FileInputStream q3_an1fis = new FileInputStream(q3_an1jpg);
		byte[] byteQ3an1 = IOUtils.toByteArray(q3_an1fis);		
		File q3_an4jpg = new File("src/main/resources/static/images/model/Q3_angle4.png"); FileInputStream q3_an4fis = new FileInputStream(q3_an4jpg);
		byte[] byteQ3an4 = IOUtils.toByteArray(q3_an4fis);		
		File q3_an7jpg = new File("src/main/resources/static/images/model/Q3_angle7.png"); FileInputStream q3_an7fis = new FileInputStream(q3_an7jpg);
		byte[] byteQ3an7 = IOUtils.toByteArray(q3_an7fis);		
		File q3_an10jpg = new File("src/main/resources/static/images/model/Q3_angle10.png"); FileInputStream q3_an10fis = new FileInputStream(q3_an10jpg);
		byte[] byteQ3an10 = IOUtils.toByteArray(q3_an10fis);		
		File q3_an13jpg = new File("src/main/resources/static/images/model/Q3_angle13.png"); FileInputStream q3_an13fis = new FileInputStream(q3_an13jpg);
		byte[] byteQ3an13 = IOUtils.toByteArray(q3_an13fis);	
		File q3_an16jpg = new File("src/main/resources/static/images/model/Q3_angle16.png"); FileInputStream q3_an16fis = new FileInputStream(q3_an16jpg);
		byte[] byteQ3an16 = IOUtils.toByteArray(q3_an16fis);		
		File q3_an19jpg = new File("src/main/resources/static/images/model/Q3_angle19.png"); FileInputStream q3_an19fis = new FileInputStream(q3_an19jpg);
		byte[] byteQ3an19 = IOUtils.toByteArray(q3_an19fis);
		
		Model defaultModel4 = Model.builder().modelType("Q3").price(1820000).engineType("L4 汽油渦輪增壓引擎").engineDisplacement("1498").power("150").torque("200").consumption("21.22").seat("5").subtitle("生活是場即興演出，你既是觀眾，也創作故事，跟著全新 Audi Q3，隨性啟動屬於你的精彩生活")
				.description("全新 Audi Q3 的多項特質，突顯其更加越野動感的性格。霸氣車頭與獨特的單體式盾形水箱護罩，展現難以忽視的侵略氣息。頭燈與尾燈的整體設計，在肌理鮮明的肩線襯托下，展現一氣呵成的流暢度，搭配對比強烈的大器輪圈，更添運動化跑格魅力！")
				.exterior(byteQ3outer).interior(byteQ3inner).background(byteQ3bg).angle1(byteQ3an1).angle4(byteQ3an4).angle7(byteQ3an7).angle10(byteQ3an10).angle13(byteQ3an13).angle16(byteQ3an16).angle19(byteQ3an19).build();


		
		
		modelService.createModel(defaultModel1);
		modelService.createModel(defaultModel2);
		modelService.createModel(defaultModel3);
		modelService.createModel(defaultModel4);

		//		Create default Center
		File Neihujpg = new File("src\\main\\resources\\static\\images\\center\\taipei.jpg");
		FileInputStream Neihujpgg = new FileInputStream(Neihujpg);
		byte[] byteNeihu = IOUtils.toByteArray(Neihujpgg);
		Center defaultCenter1 = Center.builder().centerName("內湖展示中心").centerPhone("02-27939191").centerEmail("NeihuCenter@gmail.com").centerLoc("台北市").centerLocSit("內湖區").centerAddress("台北市內湖區新湖三路288號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteNeihu).centerLatitude("25.066693320651687").centerLongitude("121.58241079480605").build();
 
		File Daanjpg = new File("src\\main\\resources\\static\\images\\center\\taoyuan.jpg");
		FileInputStream Daanjpgg = new FileInputStream(Daanjpg);
		byte[] byteDaan = IOUtils.toByteArray(Daanjpgg);
		Center defaultCenter2 = Center.builder().centerName("大安展示中心").centerPhone("02-82443207").centerEmail("DaanCenter@gmail.com").centerLoc("台北市").centerLocSit("大安區").centerAddress("台北市大安區四維路208巷10號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteDaan).centerLatitude("25.026287234825105").centerLongitude("121.5474338543234").build();
		
		File Xinyijpg = new File("src\\main\\resources\\static\\images\\center\\taichung.jpg");
		FileInputStream Xinyijpgg = new FileInputStream(Xinyijpg);
		byte[] byteXinyi = IOUtils.toByteArray(Xinyijpgg);
		Center defaultCenter3 = Center.builder().centerName("信義展示中心").centerPhone("02-67360223").centerEmail("XinyiCenter@gmail.com").centerLoc("台北市").centerLocSit("信義區").centerAddress("台北市信義區松智路1號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteXinyi).centerLatitude("25.0388559895188").centerLongitude("121.56627022548838").build();
		
		File Banqiaojpg = new File("src\\main\\resources\\static\\images\\center\\tainan.jpg");
		FileInputStream Banqiaojpgg = new FileInputStream(Banqiaojpg);
		byte[] byteBanqiao = IOUtils.toByteArray(Banqiaojpgg);
		Center defaultCenter4 = Center.builder().centerName("板橋展示中心").centerPhone("02-59242558").centerEmail("BanqiaoCenter@gmail.com").centerLoc("新北市").centerLocSit("板橋區").centerAddress("新北市板橋區新府路30號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteBanqiao).centerLatitude("25.011155993514862").centerLongitude("121.46503899665238").build();
		
		File Zhonghejpg = new File("src\\main\\resources\\static\\images\\center\\kaohsiung.jpg");
		FileInputStream Zhonghejpgg = new FileInputStream(Zhonghejpg);
		byte[] byteZhonghe = IOUtils.toByteArray(Zhonghejpgg);
		Center defaultCenter5 = Center.builder().centerName("中和展示中心").centerPhone("02-87823688").centerEmail("ZhongheCenter@gmail.com").centerLoc("新北市").centerLocSit("中和區").centerAddress("新北市中和區建八路63號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteZhonghe).centerLatitude("24.999313397163245").centerLongitude("121.48750046966435").build();
		
		File Pingzhenjpg = new File("src\\main\\resources\\static\\images\\center\\kaohsiung.jpg");
		FileInputStream Pingzhenjpgg = new FileInputStream(Pingzhenjpg);
		byte[] bytePingzhen = IOUtils.toByteArray(Pingzhenjpgg);
		Center defaultCenter6 = Center.builder().centerName("平鎮展示中心").centerPhone("03-4158259").centerEmail("PingzhenCenter@gmail.com").centerLoc("桃園市").centerLocSit("平鎮區").centerAddress("桃園市平鎮區南豐路2號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(bytePingzhen).centerLatitude("24.900391473028883").centerLongitude("121.21014419664988").build();
		
		File Taoyuanjpg = new File("src\\main\\resources\\static\\images\\center\\kaohsiung.jpg");
		FileInputStream Taoyuanjpgg = new FileInputStream(Taoyuanjpg);
		byte[] byteTaoyuan = IOUtils.toByteArray(Taoyuanjpgg);
		Center defaultCenter7 = Center.builder().centerName("桃園展示中心").centerPhone("03-3394095").centerEmail("TaoyuanCenter@gmail.com").centerLoc("桃園市").centerLocSit("桃園區").centerAddress("桃園市桃園區樹仁三街28號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteTaoyuan).centerLatitude("24.974947886449666").centerLongitude("121.32264789665159").build();
		
		File Beitunjpg = new File("src\\main\\resources\\static\\images\\center\\kaohsiung.jpg");
		FileInputStream Beitunjpgg = new FileInputStream(Beitunjpg);
		byte[] byteBeitun = IOUtils.toByteArray(Beitunjpgg);
		Center defaultCenter8 = Center.builder().centerName("北屯展示中心").centerPhone("04-94698572").centerEmail("BeitunCenter@gmail.com").centerLoc("台中市").centerLocSit("北屯區").centerAddress("台中市北屯區山西路29號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteBeitun).centerLatitude("24.16925613777969").centerLongitude("120.67552299663411").build();
		File Nantunjpg = new File("src\\main\\resources\\static\\images\\center\\kaohsiung.jpg");
		FileInputStream Nantunjpgg = new FileInputStream(Nantunjpg);
		byte[] byteNantun = IOUtils.toByteArray(Nantunjpgg);
		Center defaultCenter9 = Center.builder().centerName("南屯展示中心").centerPhone("04-91549841").centerEmail("NantunCenter@gmail.com").centerLoc("台中市").centerLocSit("南屯區").centerAddress("台中市南屯區精科中路18號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteNantun).centerLatitude("24.149299332609868").centerLongitude("120.59763739663363").build();
		
		File Anpingjpg = new File("src\\main\\resources\\static\\images\\center\\kaohsiung.jpg");
		FileInputStream Anpingjpgg = new FileInputStream(Anpingjpg);
		byte[] byteAnping = IOUtils.toByteArray(Anpingjpgg);
		Center defaultCenter10 = Center.builder().centerName("安平展示中心").centerPhone("06-2059627").centerEmail("AnpingCenter@gmail.com").centerLoc("台南市").centerLocSit("安平區").centerAddress("台南市安平區文平路9號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteAnping).centerLatitude("22.983811502039387").centerLongitude("120.17736598311556").build();
		
		File Yongkangjpg = new File("src\\main\\resources\\static\\images\\center\\kaohsiung.jpg");
		FileInputStream Yongkangjpgg = new FileInputStream(Yongkangjpg);
		byte[] byteYongkang = IOUtils.toByteArray(Yongkangjpgg);
		Center defaultCenter11 = Center.builder().centerName("永康展示中心").centerPhone("06-6915174").centerEmail("YongkangCenter@gmail.com").centerLoc("台南市").centerLocSit("永康區").centerAddress("台南市永康區廣興街33號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteYongkang).centerLatitude("23.01922608496213").centerLongitude("120.27650034078707").build();
		
		File Zuoyingjpg = new File("src\\main\\resources\\static\\images\\center\\kaohsiung.jpg");
		FileInputStream Zuoyingjpgg = new FileInputStream(Zuoyingjpg);
		byte[] byteZuoying = IOUtils.toByteArray(Zuoyingjpgg);
		Center defaultCenter12 = Center.builder().centerName("左營展示中心").centerPhone("07-8344778").centerEmail("ZuoyingCenter@gmail.com").centerLoc("高雄市").centerLocSit("左營區").centerAddress("高雄市左營區新莊一路306號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteZuoying).centerLatitude("22.670738986446395").centerLongitude("120.3008856407799").build();
		
		File Gushanjpg = new File("src\\main\\resources\\static\\images\\center\\kaohsiung.jpg");
		FileInputStream Gushanjpgg = new FileInputStream(Gushanjpg);
		byte[] byteGushan = IOUtils.toByteArray(Gushanjpgg);
		Center defaultCenter13 = Center.builder().centerName("鼓山展示中心").centerPhone("07-8015406").centerEmail("GushanCenter@gmail.com").centerLoc("高雄市").centerLocSit("鼓山區").centerAddress("高雄市鼓山區龍水一街21號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteGushan).centerLatitude("22.648716879310285").centerLongitude("120.28309893523691").build();
		
		File Wujiejpg = new File("src\\main\\resources\\static\\images\\center\\kaohsiung.jpg");
		FileInputStream Wujiejpgg = new FileInputStream(Wujiejpg);
		byte[] byteWujie = IOUtils.toByteArray(Wujiejpgg);
		Center defaultCenter14 = Center.builder().centerName("五結展示中心").centerPhone("03-9571691").centerEmail("WujieCenter@gmail.com").centerLoc("宜蘭縣").centerLocSit("五結鄉").centerAddress("宜蘭縣五結鄉三吉中路34號").centerOpentime("週一至週日 09:00 - 21:00").centerImage(byteWujie).centerLatitude("24.70818759094591").centerLongitude("121.79173311568226").build();
		
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
		centerRepository.save(defaultCenter11);
		centerRepository.save(defaultCenter12);
		centerRepository.save(defaultCenter13);
		centerRepository.save(defaultCenter14);

		boolean saveProductsResult = createDefaultProducts();
		if (saveProductsResult) {
			System.out.println("Products Init Complete.");
		} else {
			System.out.println("Products Init Error!");
		}


//		Create default News & Events data
		try {
			createDefaultNewsData();
			createDefaultEventData();
			createDefaultApplicationUser();
			createDefaultEventFormData();
//			createDefaultEventFormData();
		} catch (IOException e) {
			e.printStackTrace();
		}

//		END
		System.out.println("Init Completed!");

	}

//	Default News Data
	private void createDefaultNewsData() throws IOException {

		File img1 = new File("src/main/resources/static/images/newsphotos/image1.jpg");

		FileInputStream is1 = new FileInputStream(img1);
		byte[] b1 = IOUtils.toByteArray(is1);

		News defaultNews1 = News.builder().title("絕美電駒 Audi e-tron GT 車系開始預售180kW Audi 極速充電站同步擴點")
				.subtitle("四環品牌持續推動台灣電動車發展，繼純電休旅車後，再度引進絕美電駒 Audi e-tron GT 完整車系陣容來台，以全新純電力作演繹新世代設計精髓，更將純電駕馭樂趣發展至新高度。")
				.uploadDate("2021-06-30")
				.content(
						"Audi 首席設計師 Marc Lichte 提到：「創新就是要跳出框架，挑戰不同以往的形式，設計一款全新純電動車正是如此，需以嶄新思考角度出發，而 Audi e-tron GT 更是我設計生涯中截至目前為止最迷人的作品，沒有之一。」Audi e-tron GT 開啟四環品牌性能純電發展新紀元，Audi 設計團隊將品牌造車精髓如細節工藝、精準操控、設計等面向發揮至新高度，亦刻劃出未來純電車設計發展的走向。好的設計基礎關鍵在於比例，透過和諧的比例設計，Audi e-tron GT 低重心寬扁的蜂巢式盾形護罩設計，讓車頭更顯霸氣張力，俐落的車身線條延伸至車尾，融合優雅與肌力之美的斜背曲線，完美均衡的黃金比例成就 Audi e-tron GT 迷人的魅力。空氣力學是電動車造車的關鍵因素之一，Audi 設計團隊在研發過程中更緊密與空氣力學工程團隊合作，Audi e-tron GT 不僅展現新純電美學巔峰，更創造出 0.24Cd 風阻係數，進一步增進車輛動能輸出與續航力表現。")
				.remarks("續航里程為參考 Audi 德國原廠送測之 WLTP 測試數據。實際道路行駛里程會隨天候、路況、載重、所使用的輪胎 / 輪圈組及駕駛方式和其他非技術性因素影響。").image(b1)
				.build();

		File img2 = new File("src/main/resources/static/images/newsphotos/image2.jpg");

		FileInputStream is2 = new FileInputStream(img2);
		byte[] b2 = IOUtils.toByteArray(is2);

		News defaultNews2 = News.builder().title("Audi 安心措施 雙重把關專人到府取送車與線上安心賞車服務 守護您與愛車的安全")
				.subtitle("台灣奧迪針對展示中心及服務廠全面實施嚴謹防疫措施，守護車主消費者與前線服務人員安全。").uploadDate("2021-06-28")
				.content(
						"共同防疫時期為提供安心無虞的購車及保養維修環境，台灣奧迪針對展示中心及服務廠全面實施嚴謹防疫措施，守護車主消費者與前線服務人員安全，除購車推出「Audi 線上安心賞車服務」，提供專屬線上遠距賞車，讓車主與消費者能安心賞車；針對維修保養部分，亦提供「專人到府取送車服務」，並進行維修時間分流安排，雙重把關，守護您與愛車的健康安全。即日起至 8 月 31 日，凡 Audi 車主預約回廠即可獲得 Audi 乾洗手乙瓶，零件、精品夏季優惠中，消費滿額享好禮亦有機會再抽萬元電動滑板車。面對國內疫情快速變化，台灣奧迪針對購車及保養維修環境，皆實施全面嚴謹防疫措施，全台 Audi 展示中心、服務廠環境與展示及試乘車輛內外之皆進行消毒清潔之外，各經銷商夥伴均配合政府實聯制，前線服務人員每日執行量測額溫、酒精消毒、注意手部清潔等個人防疫工作，並全程配戴口罩為車主與消費者服務。\n"
								+ "防疫期間亦提供貼心服務，購車方面已推出「Audi 線上安心賞車服務」，車主及消費者不必出門即可預約使用專屬線上遠距賞車功能；伴隨夏季來臨，針對車主定期保養部分，亦提供「專人到府取送車服務」，並將車輛維修時間進行分流安排，雙重把關，守護您與愛車的健康安全。',\n")
				.remarks("本優惠不得與其他優惠同時使用。保固案件恕不適用於本活動。").image(b2).build();

		File img3 = new File("src/main/resources/static/images/newsphotos/image3.jpg");

		FileInputStream is3 = new FileInputStream(img3);
		byte[] b3 = IOUtils.toByteArray(is3);

		News defaultNews3 = News.builder().title("美背蹤影現身 Audi Q5 Sportback 預售開跑").subtitle(
				"四環美背新勢力 Audi Q5 Sportback 首次引進台灣市場，台灣奧迪推出 45 TFSI quattro advanced 與限量 Edition One 兩款預售車型，優美外型偕同多項智慧科技，給予全方位的駕馭體驗。")
				.uploadDate("2021-06-21")
				.content(
						"Audi 持續拓展多元休旅陣容，正式推出品牌第三款 Sportback 斜背休旅車款 - Audi Q5 Sportback，Audi 設計團隊賦予其更具前衛、侵略性的動感造型，從車頭視覺望去整體將頭燈位置上移至極限，單體式八角型水箱護罩不只變得更寬幅更將其視覺位置下移，融合銳利的肌肉摺線，打造更外放、更運動感的面貌；從頭燈線條延伸貫穿整體車側流線身形，收尾至 C 柱斜背優美曲線，力與美的結合成就 Audi Q5 Sportback 剛柔兼具的魅力。\n"
								+ "至於四環品牌的靈魂元素「燈光設計」，不僅換上新型照明設計風格，更是對外的溝通媒介，其中 Audi Q5 Sportback 亦可選配新世代 Digital OLED 照明科技，其設有三款個性化燈光造型，車主可依個人喜好於購車時選定屬意的燈光造型，同時 OLED 燈組更具有車輛警示功能，如當車輛於靜止時，系統偵測到後方來車距離低於二公尺，所有 OLED 燈組光源會全數亮起以警示後方人車注意，提升後方辨識度與道路安全性外，並進一步保障周圍用路人的安全。"
								+ "防疫期間亦提供貼心服務，購車方面已推出「Audi 線上安心賞車服務」，車主及消費者不必出門即可預約使用專屬線上遠距賞車功能；伴隨夏季來臨，針對車主定期保養部分，亦提供「專人到府取送車服務」，並將車輛維修時間進行分流安排，雙重把關，守護您與愛車的健康安全。")
				.remarks("注意事項：本媒體新聞資料所提供之原廠車圖僅供介紹參考，實際配備資訊請以 Audi Taiwan 官網說明為準。").image(b3).build();

		File img4 = new File("src/main/resources/static/images/newsphotos/image4.jpg");

		FileInputStream is4 = new FileInputStream(img4);
		byte[] b4 = IOUtils.toByteArray(is4);
		News defaultNews4 = News.builder().title("Audi 領先業界提前施行修正版「汽車買賣定型化契約」\n" + "偕同台灣福斯集團全品牌自 6 月 1 日起同步實施")
				.subtitle(
						"Audi 作為國內豪華車市場的指標性品牌，向來高度重視車主服務體驗與消費者權益，將領先同級並偕同集團旗下全品牌提前自 6 月 1 日起正式實施修正版定型化契約，展現對消費者負責任的態度並提供完善的購車保障。',\n")
				.uploadDate("2021-07-01")
				.content(
						"作為國內前三大的進口車業者，台灣福斯集團 (VOLKSWAGEN GROUP TAIWAN) 確定將於法律明文規定之生效日的前一個月，自 2021 年 6 月 1 日起領先國內汽車同業，率先實施這項攸關消費者購車權益的重要法案，Audi 將偕同集團旗下包括 Volkswagen、ŠKODA 及福斯商旅全品牌同步施行，進一步保障車主與消費者權益。\n"
								+ "台灣福斯集團暨台灣奧迪總裁 Matthias Schepers 表示：「這項法案通過施行後，意味著政府對於保障消費者權益的努力向前邁進一大步，而消費者購車權益更是我們十分重視的，因此我們率先響應政府新政策，並提前施行法律所規範的相關權利義務，致力為台灣消費者提供完善、安心的購車環境。」經濟部於年初修正「汽車買賣定型化契約應記載及不得記載事項」，並訂於 110 年 7 月 1 日生效。新修正版契約規範新車在交付至少 180 日內或行駛至少 1.2 萬公里（兩條件以先到者為準）如果發生重大瑕疵，消費者得請求更換同型（或等值）新車或解除契約。',\n"
								+ "'相關詳細「汽車買賣定型化契約應記載及不得記載事項」請詳見經濟部公告")
				.remarks("相關詳細「汽車買賣定型化契約應記載及不得記載事項」請詳見經濟部公告").image(b4).build();

		File img5 = new File("src/main/resources/static/images/newsphotos/image5.jpg");

		FileInputStream is5 = new FileInputStream(img5);
		byte[] b5 = IOUtils.toByteArray(is5);

		News defaultNews5 = News.builder().title("Audi e-tron 橫跨中橫公路｜台中花蓮越嶺壯遊不充電").subtitle(
				"台灣奧迪特地邀請了 20 家不同分線的媒體，涵蓋汽車線、科技線及生活線的記者朋友，一同駕駛 Audi e-tron 從台中出發前往花蓮路程總長約 225 公里，並路途中完全不充電的狀況下橫跨中部橫貫公路。")
				.uploadDate("2020-12-15")
				.content(
						"作為國內前三大的進口車業者，台灣福斯集團 (VOLKSWAGEN GROUP TAIWAN) 確定將於法律明文規定之生效日的前一個月，自 2021 年 6 月 1 日起領先國內汽車同業，率先實施這項攸關消費者購車權益的重要法案，Audi 將偕同集團旗下包括 Volkswagen、ŠKODA 及福斯商旅全品牌同步施行，進一步保障車主與消費者權益。\n"
								+ "台灣福斯集團暨台灣奧迪總裁 Matthias Schepers 表示：「這項法案通過施行後，意味著政府對於保障消費者權益的努力向前邁進一大步，而消費者購車權益更是我們十分重視的，因此我們率先響應政府新政策，並提前施行法律所規範的相關權利義務，致力為台灣消費者提供完善、安心的購車環境。」經濟部於年初修正「汽車買賣定型化契約應記載及不得記載事項」，並訂於 110 年 7 月 1 日生效。新修正版契約規範新車在交付至少 180 日內或行駛至少 1.2 萬公里（兩條件以先到者為準）如果發生重大瑕疵，消費者得請求更換同型（或等值）新車或解除契約。',\n"
								+ "'相關詳細「汽車買賣定型化契約應記載及不得記載事項」請詳見經濟部公告")
				.remarks("相關詳細「汽車買賣定型化契約應記載及不得記載事項」請詳見經濟部公告").image(b5).build();

		File img6 = new File("src/main/resources/static/images/newsphotos/image6.jpg");

		FileInputStream is6 = new FileInputStream(img6);
		byte[] b6 = IOUtils.toByteArray(is6);

		News defaultNews6 = News.builder().title("四環品牌領先業界 防疫安心措施再升級\n" + "Audi 全台經銷據點 全面啟動「服務團隊快篩行動」")
				.subtitle("Audi 齊心防疫守護你我健康安全，共創安心生活，面對疫情快速變化，台灣奧迪執行全面防疫準備，領先業界安心措施再升級，率先於全台 Audi 授權經銷據點，啟動「服務團隊快篩行動」。")
				.uploadDate("2021-07-08")
				.content(
						"面對國內疫情變化，齊心共同防疫已是常態性的重要環節，台灣奧迪領先業界，防疫安心措施再升級，自 7 月 12 日起率先於全台 Audi 授權經銷據點，啟動「服務團隊快篩行動」，將使用經由衛福部食品藥物管理署所核可的「羅氏家用新冠病毒抗原自我檢測套組 (鼻腔) SARS-CoV-2 Antigen Self Test Nasal 」，於每週一及週四定期為全體服務同仁進行快篩檢測。\n"
								+ "快篩行動將依循中央流行疫情指揮中心制定的相關規範流程，受測人員名單與測試結果進行系統性回報存查；如遇發生人員的快篩結果呈陽性反應，則將立即通報各縣市衛生主管機關，並前往指定醫療院所做更進一步的檢測，同時執行相關場域的全面清潔消毒工作，確保所有團隊同仁與車主消費者的健康安全。\n"
								+ "藉由強化全體服務同仁的自主健康，結合 Audi 展示中心、服務廠等服務環境、展示及試乘車輛內外消毒清潔作業，實施完整個人與服務環境防疫措施，以利提供更安心的服務。未來疫情變化多端，台灣奧迪將持續配合政府相關政策，執行完整的防疫準備，除實體購車環境進行全面防疫把關，亦提供如「專人到府取送車」與「線上安心賞車」多元防疫賞車服務，給予更彈性、更安心的服務，用心守護車主與消費者的健康安全，齊心共創安心生活。")
				.remarks("台灣奧迪領先業界 啟動經銷服務團隊自主快篩檢測").image(b6).build();

		File img7 = new File("src/main/resources/static/images/newsphotos/image7.jpg");

		FileInputStream is7 = new FileInputStream(img7);
		byte[] b7 = IOUtils.toByteArray(is7);

		News defaultNews7 = News.builder()
				.title("四環科技｜人車溝通一手掌握 – 尖端方向盤演進"
						+ "Audi 原廠技術工程團隊不斷進行創新演進，對應每款車型不同個性搭配合適的轉向輔助系統，完美融入動態操控性與舒適性，打造獨特的操控感受。")
				.subtitle("Audi 原廠技術工程團隊不斷進行創新演進，對應每款車型不同個性搭配合適的轉向輔助系統，完美融入動態操控性與舒適性，打造獨特的操控感受。")
				.uploadDate("2021-07-02")
				.content(
						"120 年前即存在，方向盤可謂幾乎和汽車本身一樣古老的零件，其實隱藏許多不為人知的奧秘，Audi 於 1980 年代推出液壓動力轉向系統，讓方向盤開始變得更小巧、更易操控，1991 年引入了第一個操作按鈕，讓方向盤開始能執行更多功能，近幾十年來有了革命性的改變。\n"
								+ "方向盤看似簡單的圓形設計，從直徑的大小乃至對應駕駛人坐姿的角度，皆由設計工程團隊對應不同車型尺碼進行精密的計算，Audi 對於方向盤設計宗旨，其需具有運動型的設計，盤幅直徑約介於 30 ~ 36mm，並採用雙層泡棉包覆，提供良好的標線均衡性和防滑感，同時方向盤上每個控制按鍵所設置的位置，皆須讓駕駛可以任一拇指進行滑動操作，不影響駕駛行駛為最高準則，隨著車載功能日新月異，現今駕駛者於方向盤上即可直接操作 10 多種智慧功能，更能啟動語音聲控，資訊娛樂輕鬆一手掌握。")
				.remarks("頂尖轉向結合 _ Dynamic all-wheel steering 動態全輪轉向系統").image(b7).build();

		File img8 = new File("src/main/resources/static/images/newsphotos/image8.jpg");
		FileInputStream is8 = new FileInputStream(img8);
		byte[] b8 = IOUtils.toByteArray(is8);

		News defaultNews8 = News.builder().title("開啟電創未來的四環純電科技核心\n" + "Audi e-tron 智能充電與熱能管理系統")
				.subtitle("Audi 原廠技術工程團隊不斷進行創新演進，對應每款車型不同個性搭配合適的轉向輔助系統，完美融入動態操控性與舒適性，打造獨特的操控感受。")
				.uploadDate("2020-12-05")
				.content(
						"全能電旅 Audi e-tron 於 12 月初正式在台上市，為四環實現純電生活圈的品牌願景跨出關鍵第一步。如同 Audi 於 2019 年舉辦的科技電動日 (TechDay Insight e-mobility) 中所揭示的品牌發展願景：「未來將是純電移動的時代。Audi 將以頂尖科技引領車壇，持續推動能滿足日常實用性的純電車款。」對於電動車款來說，穩定且可靠的充電系統更是不可或缺的神經中樞，全能電旅 Audi e-tron 如何透過完美運作的先進智能充電與熱能管理系統，提供車輛足夠電能以滿足不同的行駛需求，更是開啟電創未來新時代最重要的基礎。\n"
								+ "對於電動汽車而言，充電過程在日常用車時可說是至關重要，充電所需的時間越短不僅越能滿足客戶的用車需求，也是提升消費者購買意願的關鍵因素。正因如此，當消費者在購買電動車前評估日常的使用便利性時，除了單純考慮最大充電容量之外，充電效率才是另一項關鍵要素。受益於高效的充電速度，Audi e-tron 車主使用最高達 150 kW的 DC 直流充電方式，享受 30 分鐘內即充滿 80% 的高效充電功率，其先進充電系統更可同步對鋰電池模組進行複雜的熱能管理，這正是 Audi e-tron 最引以為傲之處！\n")
				.remarks(
						"Audi e-tron 50 quattro 和 55 quattro 配置的水冷式高容量鋰電池組，可分別儲存 71 kWh (50 quattro) 與 95 kWh (55 quattro) 總電量。")
				.image(b8).build();

		newsService.saveAll(Arrays.asList(defaultNews1, defaultNews2, defaultNews3, defaultNews4, defaultNews5,
				defaultNews6, defaultNews7, defaultNews8));

	}

//	Default Events Data
	private void createDefaultEventData() throws IOException {

		File img1 = new File("src/main/resources/static/images/eventsphotos/event_img1.jpeg");

		FileInputStream is1 = new FileInputStream(img1);
		byte[] b1 = IOUtils.toByteArray(is1);

		Event defaultEvent1 = Event.builder().event_title("Touring Festival").event_subtitle("千名車友參加大展品牌風尚魅力")
				.event_uploaddate("2021-08-20").reserve_start_date("2021-08-31").reserve_end_date("2021-09-20")
				.event_date("2021-10-10").location("台中麗寶落羽松林大草皮").attend_limit(1500).reserved_people(1000)
				.event_content(
						"在Audi的理念中，豐富車主的日常是品牌持續追尋的目標。把握天氣微涼的暮春之際，Audi於10月25日在台中麗寶落羽松林大草皮舉辦「Touring Festival」，集結全台最懂生活的BMW車主們，在Touring車款的陪伴下，愜意徜徉在溫暖微風之中，大啖餐車美食、享受Live搖滾樂、體驗風格DIY手做課程，以車會友、相互交流，現場氣氛熱絡、笑聲不絕於耳，「Touring Festival」年度野遊盛典用風格玩出品味生活新高度。'\n")
				.event_img(b1).build();

		File img2 = new File("src/main/resources/static/images/eventsphotos/event_img2.jpg");

		FileInputStream is2 = new FileInputStream(img2);
		byte[] b2 = IOUtils.toByteArray(is2);

		Event defaultEvent2 = Event.builder().event_title("The Audi e-tron 55 ２天１夜【純電之旅】")
				.event_subtitle("敬邀試駕或線上賞車服務體驗，即有機會獲得 Audi e-tron 2 天 1 夜【純電之旅】。").event_uploaddate("2021-07-31")
				.reserve_start_date("2021-08-10").reserve_end_date("2021-10-01").event_date("2021-11-01")
				.location("台北晶華酒店").attend_limit(200).reserved_people(50)
				.event_content("完成展間試駕或線上賞車服務，即有機會獲得 Audi e-tron 2 天 1 夜豪華飯店【純電之旅】。邀您一起體驗純電生活的魅力！").event_img(b2)
				.build();

		File img3 = new File("src/main/resources/static/images/eventsphotos/event_img4.jpg");

		FileInputStream is3 = new FileInputStream(img3);
		byte[] b3 = IOUtils.toByteArray(is3);

		Event defaultEvent3 = Event.builder().event_title("2021 Audi quattro Cup Taiwan")
				.event_subtitle("台灣奧迪自 2005 年成立以來，連年舉辦 Audi quattro Cup 車主杯高爾夫球賽").event_uploaddate("2021-08-20")
				.reserve_start_date("2021-09-01").reserve_end_date("2021-10-03").event_date("2021-10-15")
				.location("士林高爾夫練習場").attend_limit(30).reserved_people(30)
				.event_content(
						"台灣奧迪自 2005 年成立以來，連年舉辦 Audi quattro Cup 車主杯高爾夫球賽，期望能提供優質的高爾夫球活動以增進 Audi 車主們對 Audi 品牌的喜愛與支持，\n"
								+ "並且以球會友，以服務 Audi 車主為職志。")
				.event_img(b3).build();

		File img4 = new File("src/main/resources/static/images/eventsphotos/event_img5.jpg");

		FileInputStream is4 = new FileInputStream(img4);
		byte[] b4 = IOUtils.toByteArray(is4);

		Event defaultEvent4 = Event.builder().event_title("悅動未來 Inspire the Future設計徵選")
				.event_subtitle("台灣奧迪自創立以來，始終秉持以人為本的設計理念，持續突破、創新，致力於打造人性化的未來移動空間。").event_uploaddate("2021-08-02")
				.reserve_start_date("2021-08-10").reserve_end_date("2021-09-30").event_date("2021-10-10")
				.location("線上活動").attend_limit(500).reserved_people(300)
				.event_content(
						"今年首度發起「Inspire the Future設計徵選」活動，為台灣年輕設計師打造一個嶄露頭角的絕佳舞台，並邀請到跨界國民主持 黃子佼、金曲獎視覺統籌暨設計師 顏伯駿、藝術策展人/演員 丁春誠、金馬獎指定官方造型師暨時尚部落客 不理姬關擔任評審，最終獲選者所創作出的聖誕禮盒將於「兒童福利聯盟文教基金會」平台進行募款，募得款項將全數捐予協會，用於兒童福利相關事務，為需要幫助的孩童創造一個更美好的世界。")
				.event_img(b4).build();

		File img5 = new File("src/main/resources/static/images/eventsphotos/event_img6.jpeg");

		FileInputStream is5 = new FileInputStream(img5);
		byte[] b5 = IOUtils.toByteArray(is5);

		Event defaultEvent5 = Event.builder().event_title("Inspire the Future 2021 Kids Campus")
				.event_subtitle(
						"長久以來致力於推廣兒童交通安全教育的Audi，不僅持續耕耘交通安全教育的推廣與知識傳播，更持續舉辦Audi Kids Campus超過10年以上，落實公益、實踐企業社會責任")
				.event_uploaddate("2021-08-11").reserve_start_date("2021-08-16").reserve_end_date("2021-09-20")
				.event_date("2021-09-30").location("線上活動").attend_limit(400).reserved_people(350)
				.event_content(
						"今年，為降低人群接觸保持最佳安全社交距離，Audi將實體活動轉化為線上形式，自2021年8月20日至8月29日於線上盛大舉辦「2021 Audi Kids Campus」，並自8月11日中午12:00開放網路報名，報名費用將全數捐贈兒童福利聯盟文教基金會，以實際行動展現Audi實踐企業社會責任的熱忱與理念，邀請更多人一同響應公益，讓愛與關懷無遠弗屆。2021 Audi Kids Campus報名網站 9月24日中午12:00正式上線")
				.event_img(b5).build();

		eventService.saveAll(Arrays.asList(defaultEvent1, defaultEvent2, defaultEvent3, defaultEvent4, defaultEvent5));

	}

//	Default Product Data
	private boolean createDefaultProducts() {
		String imageUrl = "/FinalProject/api/v1/product/image/";
		Product product1 = Product.builder().name("男仕圓領T恤(白)").curPrice(300).originalPrice(300).isOnSale(false)
				.quantityInStock(10).imgPath(imageUrl + "1").tags(List.of("服飾", "男")).build();

		Product product2 = Product.builder().name("男仕圓領T恤(深藍)").curPrice(240).originalPrice(300).isOnSale(true)
				.quantityInStock(15).imgPath(imageUrl + "2").tags(List.of("服飾", "男")).build();

		Product product3 = Product.builder().name("男仕POLO衫(深藍)").curPrice(450).originalPrice(450).isOnSale(false)
				.quantityInStock(5).imgPath(imageUrl + "3").tags(List.of("服飾", "男")).build();

		Product product4 = Product.builder().name("男仕外套夾克").curPrice(1750).originalPrice(1750).isOnSale(false)
				.quantityInStock(20).imgPath(imageUrl + "4").tags(List.of("服飾", "男", "外套")).build();

		List<Product> products = List.of(product1, product2, product3, product4);
		boolean saveResult = productService.saveAll(products);
		try {
			saveDefaultProductImage(products);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return saveResult;
	}
	// Use loop to create 30 application user (for event form chart.js統計)
	private void createDefaultApplicationUser() {

		List<ApplicationUser> users = new ArrayList<ApplicationUser>();

		List<String> city = new ArrayList<String>();
		city.add("台北市");
		city.add("新北市");
		city.add("高雄市");
		city.add("新竹市");
		
		List<String> name = new ArrayList<String>();
		name.add("劉美華");
		name.add("陳明華");
		name.add("吳鳳麟");
		name.add("楊曉慧");
		name.add("陳大華");
		name.add("屋重亮");
		name.add("李芳芳");
		name.add("劉婌方");
		name.add("方美珠");
		name.add("張美麗");
		name.add("陳之華");

		for (int i = 0; i < 200; i++) {
			int random = new Random().nextInt(city.size());
			ApplicationUser user = new ApplicationUser();
			user.setUsername("eeit2905_" + i + "@gmail.com");
			if(i<10) {
				user.setPhone("091792217" + i);		
			}else if(i>10 && i<100){
				user.setPhone("09179221" + i);
			}else
				user.setPhone("0917922" + i);
			int randomName = new Random().nextInt(name.size());
			user.setFullName(name.get(randomName));
			user.setRoles(ApplicationRoles.MEMBER.name());
			user.setZipCode("105");
			user.setPassword("asd");
			user.setCity(city.get(random));
			user.setFullAddress("寶清街105巷13號");
			user.setTown("松山區");
			users.add(user);
		}
		applicationUserService.saveAll(users);
	}

	// Defalut EventForm Data
	private void createDefaultEventFormData() {

		List<EventForm> forms = new ArrayList<EventForm>();

		String[] gender = new String[] { "先生", "小姐" };

		for (long i = 2; i < 201; i++) {
			
			

			// 隨機取得一活動
			Random random1 = new Random(); // instance of random class
			List<Event> list = eventService.findAllEvent();
			int eventCount = list.size();
			
			int min = 1;
			int max = eventCount;
			int random_int = (int) Math.floor(Math.random() * (max - min + 1) + min);

			// 取得此活動報名開始＋結束日期
			Event event;
			try {
				event = eventService.findById(random_int);
				String startDate = event.getReserve_start_date();
				String endDate = event.getReserve_end_date();

				int startYear = Integer.parseInt(startDate.substring(0, 4));
				int startMonth = Integer.parseInt(startDate.substring(5, 7));
				int startDay = Integer.parseInt(startDate.substring(8, 10));

				int endYear = Integer.parseInt(endDate.substring(0, 4));
				int endMonth = Integer.parseInt(endDate.substring(5, 7));
				int endDay = Integer.parseInt(endDate.substring(8, 10));

				LocalDate start_date = LocalDate.of(startYear, startMonth, startDay); // start date
				long start = start_date.toEpochDay();

				LocalDate end_date = LocalDate.of(endYear, endMonth, endDay); // end date
				long end = end_date.toEpochDay();

				long randomEpochDay = ThreadLocalRandom.current().longs(start, end).findAny().getAsLong();

				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
				String formattedRandomDate = LocalDate.ofEpochDay(randomEpochDay).format(formatter);

				// 取得隨機時間（時分秒）
				// 取得此活動報名之間隨機日期＋時間
				Random timeRandom = new Random();
				int millisInDay = 24 * 60 * 60 * 1000;
				Time time = new Time((long) timeRandom.nextInt(millisInDay));
				String randomDateTime = formattedRandomDate + " " + time.toString();

				// 取得隨機性別
				Random genderRandom = new Random();
				int n = genderRandom.nextInt(gender.length);
				String randomGender = gender[n];
				

				// 取得隨機身分證字號
				Random r = new Random();
				String s = "";
				// 產生前9碼的同時計算產生驗證碼
				int checknum = 0;
				String checkHead = "ABCDEFGHJKLMNPQRSTUVWXYZIO";

				// 產生第一個英文字母
				int t = (r.nextInt(26) + 65);
				s += (char) t;
				t = checkHead.indexOf((char) t) + 10;
				checknum += t / 10;
				checknum += t % 10 * 9;

				// 產生第2個數字 (1~2)
				s += Integer.toString(t = r.nextInt(2) + 1);
				checknum += t * 8;

				// 產生後8碼
				for (int j = 2; j < 9; j++) {
					s += Integer.toString(t = r.nextInt(10));
					checknum += t * (9 - j);
				}

				// 完成驗證碼計算
				checknum = (10 - ((checknum) % 10)) % 10;
				s += Integer.toString(checknum);

				// set eventform

				EventForm eventForm = new EventForm();
				ApplicationUser appUser = applicationUserService.findById(i);

				eventForm.setApplicationUser(appUser);
				eventForm.setCreation_time(randomDateTime);
				eventForm.setEvent(event);
				eventForm.setGender(randomGender);
				eventForm.setId_number(s);
				eventForm.setStatus("成功");

				forms.add(eventForm);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// Default EvnentForm data Demo專用user_id=1 王小明
		Event event = null;
		ApplicationUser appUser = null;
		try {
			event = eventService.findById(1);
			appUser = applicationUserService.findByUsername("eeit2905@gmail.com");

		} catch (Exception e) {
			e.printStackTrace();
		}
		EventForm defaultEventForm1 = EventForm.builder().event(event).creation_time("2021/09/01 13:57:53").gender("先生")
				.id_number("Z122338754").message("我吃素").status("成功").applicationUser(appUser).build();

		eFormRepository.saveAll(forms);
		eFormRepository.save(defaultEventForm1);

	}

	

	private boolean saveDefaultProductImage(List<Product> products) throws IOException {
		Product product1 = products.get(0);
		FileInputStream inputStream = new FileInputStream(new File("src/main/resources/static/images/products/1.png"));
		byte[] image1 = new byte[inputStream.available()];
		inputStream.read(image1);
		ProductImage productImage1 = ProductImage.builder().product(product1).image(image1).build();
		Product product2 = products.get(1);
		FileInputStream inputStream2 = new FileInputStream(new File("src/main/resources/static/images/products/2.png"));
		byte[] image2 = new byte[inputStream2.available()];
		inputStream2.read(image2);
		ProductImage productImage2 = ProductImage.builder().product(product2).image(image2).build();
		Product product3 = products.get(2);
		FileInputStream inputStream3 = new FileInputStream(new File("src/main/resources/static/images/products/3.png"));
		byte[] image3 = new byte[inputStream3.available()];
		inputStream3.read(image3);
		ProductImage productImage3 = ProductImage.builder().product(product3).image(image3).build();
		Product product4 = products.get(3);
		FileInputStream inputStream4 = new FileInputStream(new File("src/main/resources/static/images/products/4.png"));
		byte[] image4 = new byte[inputStream4.available()];
		inputStream4.read(image4);
		ProductImage productImage4 = ProductImage.builder().product(product4).image(image4).build();

		List<ProductImage> productImages = List.of(productImage1, productImage2, productImage3, productImage4);
		boolean result = productImageService.saveAll(productImages);
		if (result) {
			return true;
		}
		return false;

	}

//	Default Cart Data
//	private boolean createDefaultCartItem(ApplicationUser member) {
//		CartItem cart1 = CartItem.builder().member(member).product(productService.findById(1L)).quantityInCart(2)
//				.build();
//		CartItem cart2 = CartItem.builder().member(member).product(productService.findById(4L)).quantityInCart(1)
//				.build();
//		CartItem cart3 = CartItem.builder().member(member).product(productService.findById(2L)).quantityInCart(2)
//				.build();
//		boolean result = cartService.saveAll(List.of(cart1, cart2, cart3));
//		return result;
//	}

//	Default MemberOrder & OrderDetail
//	private boolean createDefaultOrder(ApplicationUser member) throws IOException {
//		String orderId = "5EK74526RB316204L";
//		Order order = paypalService.getOrder(orderId);
//		if (!orderId.equals(order.id())) {
//			return false;
//		}
//		if (order.updateTime() == null) {
//			return false;
//		}
//
//		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.ENGLISH);
//		DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
//		LocalDateTime date = LocalDateTime.parse(order.updateTime(), inputFormatter);
//		LocalDateTime dateFormate = date.plusHours(8L);
//		String formattedDate = outputFormatter.format(dateFormate);
//
//		MemberOrder newOrder = MemberOrder.builder().method("paypal").paypalOrderId(orderId).member(member).stage(PREPARED.value())
//				.createDate(formattedDate).build();
//		List<CartItem> cartItems = cartService.findByMember(member);
//		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
//		for (CartItem cartItem : cartItems) {
//			OrderDetail newOrderDetail = OrderDetail.builder().order(newOrder).product(cartItem.getProduct())
//					.quantity(cartItem.getQuantityInCart()).pricePerUnit(cartItem.getProduct().getCurPrice()).build();
//			orderDetails.add(newOrderDetail);
//		}
//		int totalAmount = 0;
//		int totalQuantity = 0;
//		for (OrderDetail detail : orderDetails) {
//			totalAmount += detail.getQuantity() * detail.getPricePerUnit();
//			totalQuantity += detail.getQuantity();
//		}
//		newOrder.setOrderDetail(orderDetails);
//		newOrder.setTotalAmount(totalAmount);
//		newOrder.setTotalQuantity(totalQuantity);
//
//		memberOrderService.save(newOrder);
//		return true;
//	}
}
