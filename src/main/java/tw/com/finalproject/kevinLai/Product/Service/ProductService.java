package tw.com.finalproject.kevinLai.Product.Service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.finalproject.kevinLai.Product.Product;
import tw.com.finalproject.kevinLai.Product.Repository.ProductRepositoy;
import tw.com.finalproject.yumyu.Utils.ImgConverter;

@Service
@Transactional
public class ProductService {

	@Autowired
	private ProductRepositoy productRepository;

	// 顯示全部
	public List<Product> findAll() {
		List<Product> productList = productRepository.findAll();
		for (int i = 0; i < productList.size(); i++) {
			try {
				String base64str = ImgConverter.ByteConvertToBase64(productList.get(i).getImage());
				productList.get(i).setBase64Image(base64str);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return productList;

	}

	// 新增
	public Product addProduct(Product product) {
		if (!product.getFile().isEmpty()) {
			product.setImage(ImgConverter.convertToBytesArrays(product.getFile()));
		}
		Product result = productRepository.save(product);

		return result;

	}

	// 刪除
	public Integer deleteById(Integer id) {
		productRepository.deleteById(id);
		return id;

	}

	// 用ID查詢
	public Product findById(Integer id) throws Exception {

		Optional<Product> result = productRepository.findById(id);
		if (!result.isPresent()) {
			throw new Exception();

		}
		byte[] bytes = result.get().getImage();
		String base64str = ImgConverter.ByteConvertToBase64(bytes);
		result.get().setBase64Image(base64str);
		return result.get();
	}

	// 修改
	public Product updateProduct(Product product) throws IOException {
		if (!product.getFile().isEmpty()) {
			byte[] bytes = ImgConverter.convertToBytesArrays(product.getFile());
			product.setImage(bytes);
			String base64 = ImgConverter.ByteConvertToBase64(bytes);
			product.setBase64Image(base64);
		}

		Product result = productRepository.save(product);

		return result;

	}

	// 分頁查詢
//	public Page<Product> findAllByPage(Pageable pageable){
//		return productRepository.findAll(pageable);
//	}

//	//新增
//	public Product insertProduct(Product product) {
//		return productRepository.save(product);
//	}

//	//修改
//	public Product updateProduct(Product product) {
//		return productRepository.save(product);
//	}

}
