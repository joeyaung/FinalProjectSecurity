package tw.com.finalproject.yumyu.Products.API;

import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import tw.com.finalproject.yumyu.Products.Product;
import tw.com.finalproject.yumyu.Products.ProductImage;
import tw.com.finalproject.yumyu.Products.Service.ProductImageService;
import tw.com.finalproject.yumyu.Products.Service.ProductService;

@RestController
public class ProductAPIController {

	@Autowired
	private ProductService productService;
	@Autowired
	private ProductImageService productImageService;

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
	public List<Product> queryAll() {
		List<Product> result = productService.findAll();
		return result;
	}

	@DeleteMapping(path = "api/v1/product/{id}", produces = "application/json;charset=UTF-8")
	public String deleteProduct(@PathParam(value = "id") String id) {
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

	@PostMapping(path = "/api/v1/product/create", produces = "plain/text; charset=UTF-8")
	public String createNewProduct(Principal principal, @RequestBody Map<String, Object> data,
			HttpServletRequest request) {
		String name = (String) data.get("name");
		int originalPrice = Integer.parseInt((String) data.get("origin_price"));
		boolean isOnSale = (boolean) data.get("isOnSale");
		int quantityInStock = Integer.parseInt((String) data.get("quantity_in_stock"));
		int curPrice = 0;
		if (isOnSale) {
			curPrice = Integer.parseInt((String) data.get("sale_price"));
		} else {
			curPrice = originalPrice;
		}
		@SuppressWarnings("unchecked")
		List<String> tags = (List<String>) data.get("tags");
		String imgPath = "/FinalProject/api/v1/product/image/";
		Product newProduct = Product.builder().name(name).originalPrice(originalPrice).isOnSale(isOnSale)
				.curPrice(curPrice).tags(tags).imgPath(imgPath).quantityInStock(quantityInStock).build();

		boolean result = productService.save(newProduct);

		if (result) {
			return "" + newProduct.getId();
		} else {
			return "fail";
		}
	}

	@PostMapping(path = "/api/v1/product/create/image/{id}", produces = "plain/text; charset=UTF-8")
	public String createNewProductImage(@RequestParam("file") MultipartFile file, HttpServletRequest request,
			@PathVariable(name = "id") String id) throws IOException {
		int productId = Integer.parseInt(id);
		Product product = productService.findById(productId);
		InputStream inputStream = file.getInputStream();
		byte[] fileData = new byte[inputStream.available()];
		inputStream.read(fileData);
		ProductImage newImage = ProductImage.builder().product(product).image(fileData).build();
		boolean result = productImageService.save(newImage);
		request.getSession().removeAttribute("newProduct");
		if (result) {
			return "ok";
		} else {
			return "fail";
		}
	}

	@GetMapping(path = "/api/v1/product/image/{id}", produces = MediaType.IMAGE_JPEG_VALUE)
	public byte[] getProductImage(@PathVariable(name = "id") String id) {
		Product product = productService.findById(Long.parseLong(id));
		ProductImage productImage = productImageService.findByProduct(product);
		byte[] image = productImage.getImage();
		return image;
	}

	@PutMapping(path = "/inner/admin/api/v1/product/{id}", produces = "application/json;charset=UTF-8")
	public Product updateProductInfo(@PathVariable(name = "id") String productId, Principal principal,
			@RequestBody Map<String, Object> data) {

		Object newName = data.get("name");
		Object newQuantityInStock = data.get("quantityInStock");
		Object newOriginalPrice = data.get("originalPrice");
		Object newOnSale = data.get("onSale");
		Object newCurPrice = data.get("curPrice");
		Object newTags = data.get("tags");
		Object newImgPath = data.get("imgPath");

		List<String> list = new ArrayList<String>();
		if (newTags.getClass().isArray()) {
			list = Arrays.asList((String[]) newTags);
		} else if (newTags instanceof Collection) {
			list = new ArrayList<String>((Collection<String>) newTags);
		}

		Product product = productService.findById(Long.valueOf(productId));
		product.setName((String) newName);
		product.setQuantityInStock((int) newQuantityInStock);
		product.setOriginalPrice((int) newOriginalPrice);
		product.setOnSale((boolean) newOnSale);
		product.setCurPrice((int) newCurPrice);
		product.setImgPath((String) newImgPath);
		product.setTags(list);

		boolean result = productService.update(product);
		if (result ) {
			return product;
		} else {
			return null;
		}
	}
	
	@PutMapping(path = "/inner/admin/api/v1/product/image/{id}", produces = "plain/text; charset=UTF-8")
	public String updateProductImage(@RequestParam("file") MultipartFile file, HttpServletRequest request,
			@PathVariable(name = "id") String id) throws IOException {
		int productId = Integer.parseInt(id);
		Product product = productService.findById(productId);
		InputStream inputStream = file.getInputStream();
		byte[] fileData = new byte[inputStream.available()];
		inputStream.read(fileData);
		ProductImage updateImage = productImageService.findByProduct(product);
		updateImage.setImage(fileData);
		boolean result = productImageService.update(updateImage);
		request.getSession().removeAttribute("newProduct");
		if (result) {
			return "ok";
		} else {
			return "fail";
		}
	}

}
