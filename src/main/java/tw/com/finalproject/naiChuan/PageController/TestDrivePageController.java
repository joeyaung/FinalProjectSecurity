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
import tw.com.finalproject.yumyu.Enums.SalesStages;
import tw.com.finalproject.yumyu.InternalUse.Client;
import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.InternalUse.Service.ClientService;
import tw.com.finalproject.yumyu.InternalUse.Service.EmployeeService;

@Controller
@SessionAttributes
public class TestDrivePageController {

	@Autowired
	private TestDriveApointmentService tdriveService;

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private ClientService clientService;

	@Autowired
	private MailService mailService;

	@GetMapping("/PrivacyPolicy")
	public String privacyPolicies() {
		return "TestDrive/PrivacyPolicy";
	}

	@PostMapping("/TestDrive")
	public String reEnterTestdrive() {
		return "TestDrive/BookForm";
	}
	
	
	// admin 進入 testdrive
	@GetMapping("/admin/edit/testdrive")
	public String enterInnerTestdrive(HttpServletRequest request, HttpServletResponse response, Model m, Principal principal) {

		String empName = principal.getName();
		Employee emp = employeeService.findbyUsername(empName);
		request.setAttribute("empName", emp.getFullName());
		return "TestDrive/adminAllTestdrive";
	}

	// 查詢單筆
	@PostMapping("/findByIdTestdrive")
	public String findByIdTestdrive(@RequestParam("findById") String formId, Model m) {
		
		TestDriveApointment oneTestdrive = tdriveService.findByIdTestdrive(formId);
		m.addAttribute("oneTestdrive", oneTestdrive);
		return "TestDrive/BookUpdate";
	}

	// 暫時 adminTD導向日曆檢視
	@GetMapping("/admin/edit/adminAllTestdriveCal")
	public String tempRetailer(HttpServletRequest request, HttpServletResponse response, Model m) {
		return "TestDrive/adminAllTestdriveCal";
	}

//	// 刪除 改由APIcontroller處理
//	@PostMapping("/admin/edit/delCarFormById")
//	public String deleteByIdTestdrive(@RequestParam("formId") String formId) {
//		tdriveService.deleteByIdTestdrive(formId);
//
//		return "TestDrive/QueryDelComplete";
//	}
	

	// 修改_初步顯示

	@PostMapping("/updateTestdrive")
	public String findByIdTestdrive(@RequestParam("formId") String formId, HttpServletRequest request) {
		// 找單一筆
		TestDriveApointment tesdrive = tdriveService.findByIdTestdrive(formId);

		request.setAttribute("oneTestdrive", tesdrive);
		request.setAttribute("carMod", tesdrive.getCarMod());
		request.setAttribute("driveLoc", tesdrive.getDriveLoc());
		request.setAttribute("driveLocSit", tesdrive.getDriveLocSit());
		request.setAttribute("gendCli", tesdrive.getGendCli());
		request.setAttribute("timCli", tesdrive.getTimCli());

		return "TestDrive/BookUpdSub";
	}

	// 修改_確認儲存
	@PostMapping("/updateTestdriveConfirm")
	public String updateCarFormConfirm(
//			HttpServletRequest request, 
			@RequestParam("formId") String formId,@RequestParam("driveDate") String driveDate,
			@RequestParam("driveTime") String driveTime, @RequestParam("carMod") String carMod, 
			@RequestParam("driveLoc") String driveLoc, @RequestParam("driveLocSit") String driveLocSit, 
			@RequestParam("sales") String sales, @RequestParam("formTime") String formTime, 
			@RequestParam("nameCli") String nameCli, @RequestParam("gendCli") String gendCli, 
			@RequestParam("timCli") String[] timCliArr, @RequestParam("mailCli") String mailCli, 
			@RequestParam("telCli") String telCli, @RequestParam("remark") String remark, Model m) {

		String timCli;
		StringBuffer strbuf = new StringBuffer();
		for (int i = 0; i < timCliArr.length; i++) {
			strbuf.append(timCliArr[i]);
		}
		timCli = strbuf.toString();

		tdriveService.updateTestdrive(new TestDriveApointment(formId, driveDate, driveTime, carMod,
				driveLoc, driveLocSit, sales, formTime, nameCli, gendCli, timCli, mailCli, telCli, remark));
		
		// 將預約試駕者的資料 儲存為 Client
		try {
			// 查email是否已存在
			Client client = clientService.findByEmail(mailCli);
			// 若不存在，新增Client
			if(client==null) {
				Client newClient = Client.builder().fullName(nameCli).email(mailCli).phone(telCli)
						.city(driveLoc).build();			
				clientService.save(newClient);
			// 若存在，更新Client
			} else {
				// 更新資訊
				client.setFullName(nameCli);
				client.setEmail(mailCli);
				client.setPhone(telCli);
				client.setCity(driveLoc);
				boolean updateResult = clientService.update(client);
				if (updateResult) {
					System.out.println("email已存在於DB，以新試駕表單資料更新DB客戶資料");
				} else {
					System.out.println("Update client Fail!");
				}
			}
		} catch (Exception e1) {
				System.out.println("儲存為 Client失敗，檢查是否為PK error");
		}
		
		
		// 寄送E-mail給使用者。MailService
		try {
			String textString = "<h2>親愛的貴賓 " + nameCli + " 您好:</h2>"
				+ "您於今日修改了先前送出的試駕體驗表單，我們已經收到"
				+ "<br/>您的 表單ID 是: <span style='font:bold 18px sans-serif;color:red;'>" + formId
				+ "</span><br/>您的修改後的預約資訊如下:<br/>"
				+ "<br/><div style='text-align: center'><table width=550 ; style='font-size:18px; border-collapse:collapse;border:2px solid #7DCEA0'>"
				+ "<tr style='background-color:#D4EFDF'><td>試駕日期</td><td>試駕車種</td><td>試駕地區</td><td>試駕據點</td></tr>"
				+ "<tr style='background-color:#EBF5FB;padding:12px;'><td>" + driveDate +", " + driveTime + "點</td><td>" + carMod
				+ "</td><td>" + driveLoc + "</td><td>" + driveLocSit + "</td></tr></table></div>"
				+ "您可以以您的表單ID，至以下網址查詢或修改您的完整表單資訊"
				+ "<br/><a style='font-size:20px' href=\'http://localhost:8080/FinalProject/TestDrive'>Audi AG 於此檢查預約詳情</a>"
				+ "<br/>期待您的蒞臨~";
				// 暫時comment 避免一直送email。不要不小心刪了
//			mailService.prepareAndSendImg(mailCli, "[奧迪車業]試駕體驗預約 修改 通知", textString);
		} catch (Exception e) {
			System.out.println("Send Mail Fail.");
			e.printStackTrace();
		}
		
		return "redirect:/TestDrive";
	}

	// 新增_初步輸入
	@PostMapping("/addForm")
	public String addForm(@RequestParam("driveDate") String driveDate,
			@RequestParam("driveTime") String driveTime, @RequestParam("carMod") String carMod,
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
		TestDriveApointment testdrive = new TestDriveApointment(formId, driveDate.trim(), driveTime, carMod.trim(),
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
	// reCAP驗證方法

	// 新增_確認儲存
	@PostMapping("/addFormConfirm")
	public String addFormConfirm(@RequestParam("formId") String formId, @RequestParam("driveDate") String driveDate,
			@RequestParam("driveTime") String driveTime, @RequestParam("carMod") String carMod, 
			@RequestParam("driveLoc") String driveLoc, @RequestParam("driveLocSit") String driveLocSit, 
			@RequestParam("sales") String sales, @RequestParam("formTime") String formTime, 
			@RequestParam("nameCli") String nameCli, @RequestParam("gendCli") String gendCli, 
			@RequestParam("timCli") String timCli, @RequestParam("mailCli") String mailCli, 
			@RequestParam("telCli") String telCli, @RequestParam("remark") String remark, 
			@RequestParam("g-recaptcha-response") String gRecaptchaResponse, Model m) {

		// reCAP
		if (!verifyReCAPTCHA(gRecaptchaResponse)) {
			return "errorPage/404";
		}
		// reCAP

		TestDriveApointment testdrive = new TestDriveApointment(formId, driveDate, driveTime, carMod, driveLoc, driveLocSit, sales,
				formTime, nameCli, gendCli, timCli, mailCli, telCli, remark);
		tdriveService.createTestdrive(testdrive);
		
		// 將預約試駕者的資料 儲存為 Client
		try {
			// 查email是否已存在
			Client client = clientService.findByEmail(mailCli);
			// 若不存在，新增Client
			if(client==null) {
				Client newClient = Client.builder().fullName(nameCli).email(mailCli).phone(telCli)
						.city(driveLoc).build();			
				clientService.save(newClient);
			// 若存在，更新Client
			} else {
				// 更新資訊
				client.setFullName(nameCli);
				client.setEmail(mailCli);
				client.setPhone(telCli);
				client.setCity(driveLoc);
				boolean updateResult = clientService.update(client);
				if (updateResult) {
					System.out.println("email已存在於DB，以新試駕表單資料更新DB客戶資料");
				} else {
					System.out.println("Update client Fail!");
				}
			}
		} catch (Exception e1) {
				System.out.println("儲存為 Client失敗，檢查是否為PK error");
		}
		
		
		
		// 寄送E-mail給使用者。MailService
		try {
			String textString = "<h2>親愛的貴賓 " + nameCli + " 您好:</h2>"
					+ "我們已經收到您的試駕體驗表單"
					+ "<br/>您的 表單ID 是: <span style='font:bold 18px sans-serif;color:red;'>" + formId
					+ "</span><br/>您的預約資訊如下:<br/>"
					+ "<br/><div style='text-align: center'><table width=550 ; style='font-size:18px; border-collapse:collapse;border:2px solid #7DCEA0'>"
					+ "<tr style='background-color:#D4EFDF'><td>試駕日期</td><td>試駕車種</td><td>試駕地區</td><td>試駕據點</td></tr>"
					+ "<tr style='background-color:#EBF5FB;padding:12px;'><td>"+driveDate+", "+driveTime+"點</td><td>" + carMod
					+ "</td><td>" + driveLoc + "</td><td>" + driveLocSit + "</td></tr></table></div>"
					+ "您可以以您的表單ID，至以下網址查詢或修改您的完整表單資訊"
					+ "<br/><a style='font-size:20px' href=\'http://localhost:8080/FinalProject/TestDrive'>Audi AG 於此檢查預約詳情</a>"
					+ "<br/>期待您的蒞臨~";
			// 暫時comment 避免一直送email。不要不小心刪了
//			mailService.prepareAndSendImg(mailCli, "[奧迪車業]試駕體驗預約 成功 通知", textString);
		} catch (Exception e2) {
			System.out.println("Send Mail Fail.");
			e2.printStackTrace();
		}
		
		m.addAttribute("formId", formId);
		return "TestDrive/BookComplete";
	}
}
