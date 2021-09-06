package tw.com.finalproject.yumyu.Products.Service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.Products.Product;
import tw.com.finalproject.yumyu.Products.ProductImage;
import tw.com.finalproject.yumyu.Products.Repository.ProductImageRepository;

@Service
@Transactional
public class ProductImageService {

	@Autowired
	private ProductImageRepository productImageRepository;
	
	public boolean save(ProductImage productImage) {
		try {
			productImageRepository.save(productImage);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean saveAll(List<ProductImage> productImages) {
		try {
			productImageRepository.saveAll(productImages);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public ProductImage findByProduct(Product product) {
		Optional<ProductImage> result = productImageRepository.findByProduct(product);
		if (result.isEmpty()) {
			return null;
		}
		return result.get();
	}
}
