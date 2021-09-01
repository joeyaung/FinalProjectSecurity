package tw.com.finalproject.yumyu.Products.API;

import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import tw.com.finalproject.yumyu.Products.Product;
import tw.com.finalproject.yumyu.Products.Service.ProductService;

@RestController
public class ProductAPIController {

	@Autowired
	private ProductService productService;

	@GetMapping(path = "/api/v1/product/{id}", produces = "application/json;charset=UTF-8")
	public Product queryByID(@PathVariable(name = "id") String id) {
		long idLong;
		try {
			idLong = Long.parseLong(id);
		} catch (Exception e) {
			System.out.println("id can only be number.");
			return null;
		}
		Product result = productService.findById(idLong);
		return result;
	}
	
	@GetMapping(path = "/api/v1/product", produces = "application/json;charset=UTF-8")
	public List<Product> queryAll(){
		List<Product> result = productService.findAll();
		return result;
	}
	
	@DeleteMapping(path = "api/v1/product/{id}", produces = "application/json;charset=UTF-8")	
	public String deleteProduct(@PathParam(value = "id")String id) {
		long idLong;
		try {
			idLong = Long.valueOf(id);
		} catch (Exception e) {
			System.out.println("id can only be number.");
			return "fail";
		}
		Product product = productService.findById(idLong);
		boolean result = productService.delete(product);
		if (result) {
			System.out.println(String.format("Product id: %l is now been deleted.", idLong));
			return "ok";
		} else {
			System.out.println(String.format("Error: Product id: %l is not found.", idLong));
			return "fail";
		}
	}
	
}
