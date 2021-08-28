package tw.com.finalproject.kevinLai.Product;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Product {

	@Id

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String productname;
	private int price;
	private int quantity;
	private byte[] image;

	@Transient
	private String base64Image;

	@Transient
	private MultipartFile file;

}
