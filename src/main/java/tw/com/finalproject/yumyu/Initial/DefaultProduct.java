package tw.com.finalproject.yumyu.Initial;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.Products.Product;
import tw.com.finalproject.yumyu.Products.ProductImage;
import tw.com.finalproject.yumyu.Products.Service.ProductImageService;
import tw.com.finalproject.yumyu.Products.Service.ProductService;

@Service
@Transactional
public class DefaultProduct {

	@Autowired
	private ProductService productService;
	@Autowired
	private ProductImageService productImageService;

	public int create() throws FileNotFoundException, IOException {
		List<List<String>> records = new ArrayList<>();
		try (BufferedReader br = new BufferedReader(new FileReader(new File("src/main/resources/static/DefaultProduct.csv")))) {
			String line;
			while ((line = br.readLine()) != null) {
				String[] values = line.split(",");
				records.add(Arrays.asList(values));
			}
		}
		

		for (List<String> row : records) {
			if (row.get(0).equals("index")) {
				continue;
			}
			String index = row.get(0);
			String imgPath = row.get(1);
			String name = row.get(2);
			String quantity = row.get(3);
			String originalPrice = row.get(4);
			String isOnSale = row.get(5);
			String curPrice = row.get(6);
			String tags = row.get(7);

			int indexInt = Integer.parseInt(index);
			int quantityInt = Integer.parseInt(quantity);
			int originalPriceInt = Integer.parseInt(originalPrice);
			boolean isOnSaleBool = Boolean.getBoolean(isOnSale);
			int curPriceInt = Integer.parseInt(curPrice);
			List<String> tagsList = Arrays.asList(tags.split("x"));
			
			Product product = Product.builder().name(name).curPrice(curPriceInt).originalPrice(originalPriceInt)
					.isOnSale(isOnSaleBool).imgPath("/FinalProject/api/v1/product/image/"+indexInt).quantityInStock(quantityInt)
					.tags(tagsList).build();
			Product resultProduct = productService.saveReturnProduct(product);

			if (resultProduct != null) {
				FileInputStream inputStream = new FileInputStream(new File(imgPath));
				byte[] image = new byte[inputStream.available()];
				inputStream.read(image);
				ProductImage productImage = ProductImage.builder().product(resultProduct).image(image).build();
				boolean imageSaveResult = productImageService.save(productImage);
				if (imageSaveResult) {
					inputStream.close();
				}
			}

		}

		return records.size();
	}
}
