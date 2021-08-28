package tw.com.finalproject.naiChuan.TestDrive.API;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.finalproject.naiChuan.TestDrive.TestDriveApointment;
import tw.com.finalproject.naiChuan.TestDrive.Service.TestDriveApointmentService;

@RestController
public class ApointmentAPIController {

	@Autowired
	private TestDriveApointmentService tdriveService;

	// 找全部
	@GetMapping("/getAllTestdrive")
	public List<TestDriveApointment> getAllTestdrive() {
		return tdriveService.findAllTestdrive();
	}

	// 找單一筆
	@GetMapping("/findByIdTestdriveAPI/{formId}")
	public TestDriveApointment findByIdTestdriveAPI(@PathVariable String formId) throws Exception {
		return tdriveService.findByIdTestdrive(formId);
	}

	// 新增
	@PostMapping(path = "/addTestdrive", produces = "text/plain;charset=UTF-8")
	public String addTestdrive(TestDriveApointment testdrive) throws IOException {

		String formId;
		String sales;
		String formTime;

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
		formTime = new SimpleDateFormat("yyyy/MM/dd H:mm:ss").format(Calendar.getInstance().getTime());

		// 把TimCli得到的 checkbox 轉成 無逗號字串
		testdrive.setTimCli(testdrive.getTimCli().replace(",", ""));
		testdrive.setFormId(formId);
		testdrive.setSales(sales);
		testdrive.setFormTime(formTime);
		testdrive.setNameCli(testdrive.getNameCli().trim());
		testdrive.setMailCli(testdrive.getMailCli().trim());
		testdrive.setTelCli(testdrive.getTelCli().trim());
		testdrive.setRemark(testdrive.getRemark().trim());

		tdriveService.createTestdrive(testdrive);
		return "success";
	}

	// 修改
	@PostMapping(path = "/updateTestdriveAPI", produces = "text/plain;charset=UTF-8")
	public String updateTestdriveAPI(TestDriveApointment testdrive) throws Exception {

		testdrive.setTimCli(testdrive.getTimCli().replace(",", ""));
		testdrive.setNameCli(testdrive.getNameCli().trim());
		testdrive.setMailCli(testdrive.getMailCli().trim());
		testdrive.setTelCli(testdrive.getTelCli().trim());
		testdrive.setRemark(testdrive.getRemark().trim());

		tdriveService.updateTestdrive(testdrive);

		return "success";
	}

	// 刪除
	@PostMapping("/deleteByIdTestdriveAPI/{formId}")
	public Map<String, String> deleteByIdTestdriveAPI(@PathVariable String formId) {
		Map<String, String> map = new HashMap<String, String>();
		boolean result = tdriveService.deleteByIdTestdrive(formId);
		if (result) {
			map.put("msg", "成功刪除id:" + formId);
		} else {
			System.err.println("刪除失敗");
		}
		return map;
	}

}
