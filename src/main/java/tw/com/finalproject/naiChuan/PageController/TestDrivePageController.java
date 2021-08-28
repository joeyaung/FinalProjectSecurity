package tw.com.finalproject.naiChuan.PageController;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;

import tw.com.finalproject.Mail.MailService;
import tw.com.finalproject.naiChuan.TestDrive.ReCaptchaResponse;
import tw.com.finalproject.naiChuan.TestDrive.TestDriveApointment;
import tw.com.finalproject.naiChuan.TestDrive.Service.TestDriveApointmentService;
import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.EmployeeService;

@Controller
@SessionAttributes
public class TestDrivePageController {

	@Autowired
	private TestDriveApointmentService tdriveService;

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private MailService mailService;

	@GetMapping("/PrivacyPolicy")
	public String privacyPolicies() {
		return "TestDrive/PrivacyPolicy";
	}

	@PostMapping("/TestDrive")
	public String reEntryTestdrive() {
		return "TestDrive/BookForm";
	}

	// TODO: 所有 redirectToBookForm 改 /TestDrive
	// 回到 BookForm
//	@PostMapping("/redirectToBookForm")
//	public String redirectToBookForm() {
//		return "redirect:/TestDrive";
//	}

	// TODO: 所有 redirectToQueryForm 改 /TestDrive
	// 回到 QueryForm
	@PostMapping("/admin/edit/redirectToQueryForm")
	public String redirectToQueryForm() {
		return "redirect:/admin/edit/testdrive";
	}

	//////////////////////
//	@GetMapping("/admin/edit/testdrive")
//	public String entryInner(HttpServletRequest request, HttpServletResponse response) {
//		System.out.println("11111");
//		String title = Util.getCookieValueByName(request, "empDep");
//		System.out.println(title);
//		if (title == null) {
//			return "redirect:/inner";
//		}
//		if (title.equalsIgnoreCase("admin") || title.equalsIgnoreCase("boss")) {
//			return "TestDrive/QueryForm";
//		}
//		return "redirect:/inner";
//	}
	//////////////////////

	// 查詢_全部
	@PostMapping("/admin/edit/queryCarForms")
	public String findAllTestdrive(Model m, HttpServletRequest request, Principal principal) {

		String empName = principal.getName();
		Employee emp = employeeService.findbyUsername(empName);
		request.setAttribute("empName", emp.getFullName());
		return "TestDrive/QueryDisplay";
	}

	// admin進入testdrive，查詢全部
	@GetMapping("/admin/edit/testdrive")
	public String entryInner(HttpServletRequest request, HttpServletResponse response, Model m, Principal principal) {

		List<TestDriveApointment> testdrives = (List<TestDriveApointment>) tdriveService.findAllTestdrive();

		m.addAttribute("testdrives", testdrives);
		String empName = principal.getName();
		Employee emp = employeeService.findbyUsername(empName);
		request.setAttribute("empName", emp.getFullName());
		return "TestDrive/QueryDisplay";

	}

	// 暫時 展示中心
	@GetMapping("/admin/edit/tempRetailer")
	public String tempRetailer(HttpServletRequest request, HttpServletResponse response, Model m) {
		return "TestDrive/adminAllRetailer";
	}

	// 刪除
	@PostMapping("/admin/edit/delCarFormById")
	public String deleteByIdTestdrive(@RequestParam("formId") String formId) {
		tdriveService.deleteByIdTestdrive(formId);

		return "TestDrive/QueryDelComplete";
	}

	@PostMapping("/findByIdTestdrive")

	public String findByIdTestdrive(@RequestParam("findById") String formId, Model m) {

		TestDriveApointment oneTestdrive = tdriveService.findByIdTestdrive(formId);
		// TODO: 沒查詢到資料的話?

		m.addAttribute("oneTestdrive", oneTestdrive);
		return "TestDrive/BookUpdate";
	}

	// 修改_初步輸入

	@PostMapping("/updateTestdrive")
	public String findByIdTestdrive(@RequestParam("formId") String formId, HttpServletRequest request) {
		// 找單一筆
		TestDriveApointment tesdrive = tdriveService.findByIdTestdrive(formId);

		request.setAttribute("oneTestdrive", tesdrive);
		////// 測試
		request.setAttribute("carMod", tesdrive.getCarMod());

		request.setAttribute("driveLoc", tesdrive.getDriveLoc());

		request.setAttribute("driveLocSit", tesdrive.getDriveLocSit());

		request.setAttribute("gendCli", tesdrive.getGendCli());

		request.setAttribute("timCli", tesdrive.getTimCli());

		////// 測試
		return "TestDrive/BookUpdSub";
	}

	// 修改_確認儲存
	@PostMapping("/updateCarFormConfirm")
	public String updateCarFormConfirm(HttpServletRequest request, @RequestParam("driveDate") String driveDate,
			@RequestParam("carMod") String carMod, @RequestParam("driveLoc") String driveLoc,
			@RequestParam("driveLocSit") String driveLocSit, @RequestParam("sales") String sales,
			@RequestParam("formTime") String formTime, @RequestParam("nameCli") String nameCli,
			@RequestParam("gendCli") String gendCli, @RequestParam("timCli") String[] timCliArr,
			@RequestParam("mailCli") String mailCli, @RequestParam("telCli") String telCli,
			@RequestParam("remark") String remark, Model m) {

		String timCli;
		StringBuffer strbuf = new StringBuffer();
		for (int i = 0; i < timCliArr.length; i++) {
			strbuf.append(timCliArr[i]);
		}
		timCli = strbuf.toString();

		tdriveService.updateTestdrive(new TestDriveApointment(request.getParameter("formId"), driveDate, carMod,
				driveLoc, driveLocSit, sales, formTime, nameCli, gendCli, timCli, mailCli, telCli, remark));

		return "redirect:/TestDrive";
	}

	// 新增_初步輸入
	@PostMapping("/addForm")
	public String addForm(@RequestParam("driveDate") String driveDate, @RequestParam("carMod") String carMod,
			@RequestParam("driveLoc") String driveLoc, @RequestParam("driveLocSit") String driveLocSit,

			@RequestParam("nameCli") String nameCli, @RequestParam("gendCli") String gendCli,
			@RequestParam("timCli") String[] timCliArr, @RequestParam("mailCli") String mailCli,
			@RequestParam("telCli") String telCli, @RequestParam("remark") String remark, Model m) {

		String formId;
		String sales;
		String formTime;
		String timCli;

		// 製造亂數做為formId
		String formIdSuffix = new SimpleDateFormat("mmddss").format(Calendar.getInstance().getTime());
		formId = RandomStringUtils.random(5, true, true) + formIdSuffix;

		// 系統分配sales
		// TODO: 系統分配sales
		// 先暫時以隨機 // shuffle 打亂順序
		List<String> salesList = Arrays.asList("Dylan", "Cara", "Beth");
		Collections.shuffle(salesList);

		sales = salesList.get(0);

		// 抓系統時間做為formTime
		formTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());

		// 迴圈抓取selected的checkbox
		StringBuffer strbuf = new StringBuffer();
		for (int i = 0; i < timCliArr.length; i++) {
			strbuf.append(timCliArr[i]);
		}
		timCli = strbuf.toString();

		// 以有參數建構子，新增 Testdrive
		TestDriveApointment testdrive = new TestDriveApointment(formId, driveDate.trim(), carMod.trim(),
				driveLoc.trim(), driveLocSit.trim(), sales, formTime, nameCli.trim(), gendCli.trim(), timCli,
				mailCli.trim(), telCli.trim(), remark.trim());
		// 放到Session
		m.addAttribute("newTestdrive", testdrive);
		// 跳到確認新增頁面
		return "TestDrive/BookDisplay";
	}

	// reCAP
	@Value("${recaptcha.secret}")
	private String recaptchaSecret;

	@Value("${recaptcha.url}")
	private String recaptchaServerURL;

	@Bean
	public RestTemplate restTemplate(RestTemplateBuilder builder) {
		return builder.build();
	}

	@Autowired
	private RestTemplate restTemplate;

	// reCAP
	// reCAP驗證方法
	private boolean verifyReCAPTCHA(String gRecaptchaResponse) {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		// 比對前端給的
		MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
		map.add("secret", recaptchaSecret);
		map.add("response", gRecaptchaResponse);

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map, headers);

		ReCaptchaResponse response = restTemplate.postForObject(recaptchaServerURL, request, ReCaptchaResponse.class);
		// ReCaptchac回應的Json必含三項屬性
		System.out.println("Sucess: " + response.isSuccess());
		System.out.println("Hostname: " + response.getHostname());
		System.out.println("Challenge Timestamp: " + response.getChalleng_ts());
		// 若為錯誤，ReCaptchac回應才會含有這項屬性
		if (response.getErrorCodes() != null) {
			for (String error : response.getErrorCodes()) {
				System.out.println("\t" + error);
			}
		}
		return response.isSuccess();
	}
	// reCAP

	// 新增_確認儲存
	@PostMapping("/addFormConfirm")
	public String addFormConfirm(@RequestParam("formId") String formId, @RequestParam("driveDate") String driveDate,
			@RequestParam("carMod") String carMod, @RequestParam("driveLoc") String driveLoc,
			@RequestParam("driveLocSit") String driveLocSit, @RequestParam("sales") String sales,
			@RequestParam("formTime") String formTime, @RequestParam("nameCli") String nameCli,
			@RequestParam("gendCli") String gendCli, @RequestParam("timCli") String timCli,
			@RequestParam("mailCli") String mailCli, @RequestParam("telCli") String telCli,
			@RequestParam("remark") String remark, @RequestParam("g-recaptcha-response") String gRecaptchaResponse,
			Model m) {

		// 抓出來都是物件型態，但我知道那是個bean所以做強迫轉型
		// reCAP

		if (!verifyReCAPTCHA(gRecaptchaResponse)) {
			// TODO:未來若有error page可用error page
			return "TestDrive/BookDisplay";
		}
		// reCAP

		TestDriveApointment testdrive = new TestDriveApointment(formId, driveDate, carMod, driveLoc, driveLocSit, sales,
				formTime, nameCli, gendCli, timCli, mailCli, telCli, remark);
		tdriveService.createTestdrive(testdrive);

		// 寄送E-mail給使用者。MailService
		// TODO: createTestdrive 設個回傳，給個if判斷成功，再send email

		try {
			String textString = "<h2>Dear " + nameCli + "  " + gendCli + ":</h2>"
					+ "We've received your test drive appointment"
					+ "<br/>Your appointment ID is: <span style='font:bold 18px sans-serif'>" + formId
					+ "</span><br/>The appointment information is as followed.<br/>"
					+ "<br/><div style='text-align: center'><table width=550 ; style='font-size:18px; border-collapse:collapse;border:2px solid #7DCEA0'>"
					+ "<tr style='background-color:#D4EFDF'><td>試駕日期</td><td>試駕車種</td><td>試駕地區</td><td>試駕據點</td></tr>"
					+ "<tr style='background-color:#EBF5FB;padding:12px;'><td>" + driveDate + "</td><td>" + carMod
					+ "</td><td>" + driveLoc + "</td><td>" + driveLocSit + "</td></tr></table></div>"
					+ "You can check more details and edit it on the link below with your ID"
					+ "<br/><a style='font-size:20px' href=\'http://localhost:8080/FinalProject/TestDrive'>Audi AG Check Appointment Details HERE</a>"
					+ "<br/>We look forward to your visit!";
			mailService.prepareAndSendImg(mailCli, "Test Drive Appointment", textString);
		} catch (Exception e) {
			System.out.println("Send Mail Fail.");
			e.printStackTrace();
		}

		m.addAttribute("formId", formId);

		return "TestDrive/BookComplete";
	}
}
