package tw.com.finalproject.naiChuan.Retailer.API;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.finalproject.naiChuan.Retailer.Retailer;
import tw.com.finalproject.naiChuan.Retailer.Service.RetailerService;

@RestController
public class RetailerAPIController {

	@Autowired
	private RetailerService retailerService;

	// 找全部
	@GetMapping("/getAllRetailer")
	public List<Retailer> getAllRetailer() {
		return retailerService.findAllRetailer();
	}

	// 找單一筆
	@GetMapping("/findByIdRetailerAPI/{retailerId}")
	public Retailer findByIdRetailerAPI(@PathVariable String retailerId) throws Exception {
		return retailerService.findByIdRetailer(retailerId);
	}

	// 新增
	@PostMapping(path = "/addRetailer", produces = "text/plain;charset=UTF-8")
	public String addRetailer(Retailer retailer) throws IOException {
		// 抓系統時間做為retailerId
		String retailerId = new SimpleDateFormat("yyyyMMddHHmm").format(Calendar.getInstance().getTime());
		retailer.setRetailerId(retailerId);
		retailerService.createRetailer(retailer);
		return "success";
	}

	// 修改
	@PostMapping(path = "/updateRetailerAPI", produces = "text/plain;charset=UTF-8")
	public String updateRetailerAPI(Retailer retailer) throws Exception {
		retailerService.updateRetailer(retailer);
		return "success";
	}

	// 刪除
	@PostMapping("/deleteByIdRetailerAPI/{retailerId}")
	public Map<String, String> deleteByIdRetailerAPI(@PathVariable String retailerId) {
		Map<String, String> map = new HashMap<String, String>();
		boolean result = retailerService.deleteByIdRetailer(retailerId);
		if (result) {
			map.put("msg", "成功刪除id:" + retailerId);
		} else {
			System.err.println("刪除失敗");
		}
		return map;
	}

}
