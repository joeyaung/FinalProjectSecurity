package tw.com.finalproject.yumyu.Utils;

import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.MEMBER;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;

import javax.transaction.Transactional;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import tw.com.finalproject.kevinLai.Center.Center;
import tw.com.finalproject.kevinLai.Center.Repository.CenterRepository;
import tw.com.finalproject.kevinLai.Product.Product;
import tw.com.finalproject.kevinLai.Product.Repository.ProductRepositoy;
import tw.com.finalproject.naiChuan.Retailer.Retailer;
import tw.com.finalproject.naiChuan.Retailer.Service.RetailerService;
import tw.com.finalproject.naiChuan.TestDrive.TestDriveApointment;
import tw.com.finalproject.naiChuan.TestDrive.Service.TestDriveApointmentService;
import tw.com.finalproject.shellyYang.Event.Event;
import tw.com.finalproject.shellyYang.Event.Service.EventService;
import tw.com.finalproject.shellyYang.News.News;
import tw.com.finalproject.shellyYang.News.Service.NewsService;
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
	private ProductRepositoy productRepository;
	@Autowired
	private CenterRepository centerRepository; 
	@Autowired
	private NewsService newsService;
	@Autowired
	private EventService eventService;
	@Autowired
	private PasswordEncoder passwordEncoder;

	@EventListener(ApplicationReadyEvent.class)
	public void doSomethingAfterStartup() throws IOException {
		System.out.println("Init Start!");

//		Create default Member		
		ApplicationUser defaultApplicationUser = ApplicationUser.builder().username("123@123.com")
				.password(passwordEncoder.encode("asd")).roles(MEMBER.name()).city("台北市").town("松山區")
				.fullAddress("寶清街105巷13號").zipCode("105").fullName("王小明").phone("0917922177").build();

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
				.title("First time walk in Taipei showroom").activityType(ClientActivityType.WALK_IN.name())
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
		File penjpg = new File("src\\main\\resources\\static\\images\\product\\pen.jpg");
		FileInputStream penjpgg = new FileInputStream(penjpg);
		byte[] bytepen = IOUtils.toByteArray(penjpgg);		
		Product defaultProduct1 = Product.builder().productname("Audi rings x LAMY 限定版聯名銀灰色鋼筆").price(2250).quantity(28).image(bytepen).build();
		
		File idcardjpg = new File("src\\main\\resources\\static\\images\\product\\idcard.jpg");
		FileInputStream idcardjpgg = new FileInputStream(idcardjpg);
		byte[] byteidcard = IOUtils.toByteArray(idcardjpgg);
		Product defaultProduct2 = Product.builder().productname("Audi 駕駛證行駛證皮套").price(1800).quantity(57).image(byteidcard).build();
		
		File keyCasejpg = new File("src\\main\\resources\\static\\images\\product\\keyCase.jpg");
		FileInputStream keyCasejpgg = new FileInputStream(keyCasejpg);
		byte[] bytekeyCase = IOUtils.toByteArray(keyCasejpgg);
		Product defaultProduct3 = Product.builder().productname("Audi 原廠鑰匙套").price(580).quantity(38).image(bytekeyCase).build();
		
		productRepository.save(defaultProduct1);
		productRepository.save(defaultProduct2);
		productRepository.save(defaultProduct3);
		
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

//		Create default News & Events data
		try {
			createDefaultNewsData();
			createDefaultEventData();
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
				.location("士林高爾夫練習場").attend_limit(30).reserved_people(25)
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

//	Default Client Data
	private void createDefaultClientData(int clientNumber, Employee employee) {
		
	}
}
