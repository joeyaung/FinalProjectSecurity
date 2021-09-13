package tw.com.finalproject.yumyu.Products.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.Products.Product;
import tw.com.finalproject.yumyu.Products.Repository.ProductRepository;

@Service
@Transactional
public class ProductService {

	@Autowired
	private ProductRepository productRepositoy;

	public boolean save(Product product) {
		try {
			productRepositoy.save(product);
			long id = product.getId();
			String imgPath = product.getImgPath() + id;
			product.setImgPath(imgPath);
			productRepositoy.saveAndFlush(product);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean saveAll(List<Product> products) {
		try {
			productRepositoy.saveAll(products);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean delete(Product product) {
		try {
			productRepositoy.delete(product);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteAll(List<Product> products) {
		try {
			productRepositoy.deleteAll(products);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean update(Product product) {
		try {
			productRepositoy.saveAndFlush(product);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateAll(List<Product> products) {
		try {
			productRepositoy.saveAllAndFlush(products);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public Product findById(long id) {
		Optional<Product> result = productRepositoy.findById(id);
		if (result.isEmpty()) {
			return null;
		}
		return result.get();
	}

	public List<Product> findByTagsContains(List<String> queryStrings) {
		List<Product> productList = productRepositoy.findAll();
		List<Product> resultList = new ArrayList<Product>();
		for (Product product : productList) {
			for (String query : queryStrings) {
				if (product.getTags().contains(query)) {
					resultList.add(product);
				}
			}
		}
		return resultList;
	}

	public List<Product> findAll() {
		List<Product> result = productRepositoy.findAll();
		return result;
	}

}
