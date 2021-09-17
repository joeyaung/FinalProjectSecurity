package tw.com.finalproject.naiChuan.Model.API;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.finalproject.naiChuan.Model.Model;
import tw.com.finalproject.naiChuan.Model.Service.ModelService;

@RestController
public class ModelAPIController {
	
	@Autowired
	private ModelService modelService;
	
	// 找全部
	@GetMapping("/getAllModel")
	public List<Model> findAllModel() {
		return modelService.findAllModel();
	}
	
	// 找單一筆
	@GetMapping("/findByIdModelAPI/{modelType}")
	public Model findByIdModelAPI(@PathVariable String modelType) throws Exception {
		return modelService.findByIdModel(modelType);
	}

	// 新增
	@PostMapping(path = "/addModel", produces = "text/plain;charset=UTF-8")
	public String addModel(Model model) throws IOException {
		modelService.createModel(model);
		return "success";
	}

	// 修改
	@PostMapping(path = "/updateModel", produces = "text/plain;charset=UTF-8")
	public String updateModel(Model model) throws Exception {
		boolean flag = modelService.updateModel(model);
		System.out.println(flag);
		return "success";
	}

	// 刪除
	@PostMapping("/deleteByIdModel/{modelType}")
	public Map<String, String> deleteByIdModel(@PathVariable String modelType) {
		Map<String, String> map = new HashMap<String, String>();
		boolean result = modelService.deleteByIdModel(modelType);
		if (result) {
			map.put("msg", "成功刪除id:" + modelType);
		} else {
			System.err.println("刪除失敗");
		}
		return map;
	}

	
}
