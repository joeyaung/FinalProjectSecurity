package tw.com.finalproject.kevinLai.Product.API;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import tw.com.finalproject.kevinLai.Product.Product;
import tw.com.finalproject.kevinLai.Product.Service.ProductService;

@RestController
public class ProductAPIController {

	@Autowired
	private ProductService productService;

	// 列出所有商品V
	@GetMapping(path = "/queryAllProduct")
	@ResponseBody
	public List<Product> QueryAllProduct() {
		return productService.findAll();
	}

	// 增加商品V
	@PostMapping(path = "/addProduct", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String addproduct(Product product) throws IOException {
		productService.addProduct(product);
		return "success";
	}

	// 刪除商品V
	@PostMapping(path = "/deleteProduct/{id}")
	@ResponseBody
	public Map<String, String> deleteById(@PathVariable Integer id) {
		Map<String, String> productMap = new HashMap<String, String>();
		Integer result = productService.deleteById(id);
		productMap.put("msg", "成功刪除id:" + result);
		return productMap;

	}

	// 修改商品
	@PostMapping(path = "/updateProduct", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateProduct(Product product) {
		productService.updateProduct(product);
		return "success";

	}

	// 用id查詢商品
	@GetMapping("/findProductById/{id}")
	@ResponseBody
	public Product findProductById(@PathVariable Integer id) throws Exception {
		return productService.findById(id);
	}

 

//		//透過id找pName和pPrice產生成cookie
//		@PostMapping(path="/cartitem")
//		public String productController(@RequestParam("productid") Integer productid, HttpServletResponse response) throws Exception {
//			Product curProduct = productService.findById(productid);
//			if (curProduct != null) {
//				Cookie cookiePname = new Cookie("pName", curProduct.getProductname());
//				Cookie cookiePprice = new Cookie("pPrice", ""+curProduct.getPrice());
//				
//				return "index";  //回傳到商品頁jsp頁面
//			}
//			
//			return null;
//			
//		}

//		//新增 
//		@PostMapping(path = "/add")
//		@ResponseBody
//		public Product AddGoodAction(@RequestBody Product product) throws IOException {
//			return productService.addProduct(product);
//		}
	//
	//
//		//修改
//		@PostMapping(path="/update")
//		@ResponseBody
//		public Product processActionUpdate(@RequestBody Product product) {
//		return productService.updateProduct(product);
//		}
	//
	//
//		//用id尋找 
//		@PostMapping(path = "/query")
//		@ResponseBody
//		public Product QueryById(@RequestParam("id") int id) {
//			return productService.findById(id);
//		}
	//
	//
//		//刪除
//		@PostMapping(path="/delete")
//		@ResponseBody
//		public void processActionDelete(@RequestBody Product product) {
//			productService.deleteProduct(product);
//		}
	//
	//
////		//新增
//		@PostMapping(path="/addProduct")
//		public String addProuct(@RequestParam("pname") String pname, @RequestParam("pprice") int pprice,@RequestParam("pqty") int pqty, Model model) throws IOException {
//			Product addproduct = new Product(pname.trim(),pprice,pqty);
//			model.addAttribute("addproduct",addproduct);
//			productService.addProduct(addproduct);
//			return "index";
//		}

}
