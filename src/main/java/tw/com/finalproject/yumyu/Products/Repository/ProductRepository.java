package tw.com.finalproject.yumyu.Products.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.finalproject.yumyu.Products.Product;


public interface ProductRepository extends JpaRepository<Product, Long> {
}
