package tw.com.finalproject.yumyu.Products.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.finalproject.yumyu.Products.Product;
import tw.com.finalproject.yumyu.Products.ProductImage;

public interface ProductImageRepository extends JpaRepository<ProductImage, Long> {

	Optional<ProductImage> findByProduct(Product product);
}
