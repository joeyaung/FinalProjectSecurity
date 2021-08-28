package tw.com.finalproject.kevinLai.Product.PageController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.com.finalproject.kevinLai.Product.Service.ProductService;

@Controller
@SessionAttributes
public class ProductPageController {

	@Autowired
	private ProductService productService;

	// 顯示商品頁面
	@GetMapping(path = "/products")
	public String processQueryMainPage() {
		return "Product/productPage";
	}

	// 顯示後端商品table
	@GetMapping(path = "/inner/admin/edit/products")
	public String productForServer() {
		return "Product/productForAdmin";
	}

	// 顯示測試商品頁面
//	@GetMapping(path = "/producttest")
//	public String testprocessQueryMainPage() {
//		return "producttest"; 
//	}

	// 顯示cart頁面
//	@GetMapping(path = "/cart")
//	public String cartPage() {
//		return "cart"; 
//	}

//	//顯示增加商品的頁面
//	@GetMapping(path="/productAdd")
//	public String productAdd() {
//		return "productAdd";
//	}

//	//透過id找pName和pPrice產生成cookie
//	@PostMapping(path="/cartitem")
//	public String productController(@RequestParam("productid") Integer productid, HttpServletResponse response) {
////		List<Product> cartItem = productService.findAll();
//		Product curProduct = productService.findById(productid);
//		if (curProduct != null) {
//			Cookie cookiePname = new Cookie("pName", curProduct.getProductname());
//			Cookie cookiePprice = new Cookie("pPrice", ""+curProduct.getPrice());
//			
//	
////		for (Product curProduct: cartItem) {
////			Cookie cookieID = new Cookie("productID", ""+curProduct.getId());
////			
////		}
//		
//		
////		if(cartItem != null) {
////			Cookie cookiePid = new Cookie("productID", ((Product) cartItem).getId());
////			Cookie cookiePname = new Cookie("productName", ((Product) cartItem).getProductname());
////			Cookie cookiePprice = new Cookie("productprice", ((Product) cartItem).getPrice());
////			response.addCookie(cookiePid);
////			response.addCookie(cookiePname);
////			response.addCookie(cookiePprice);
//			
//			return "index";  //回傳到商品頁jsp頁面
//		}
//		
//		return null;
//		
//	}

}
