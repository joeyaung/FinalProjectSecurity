package tw.com.finalproject.yumyu.Products;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.Data;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(nullable = false)
	private String name;
	@Column(nullable = false)
	private int curPrice;
	@Column(nullable = false)
	private boolean isOnSale;
	@Column(nullable = false)
	private int originalPrice;
	@Column(nullable = false)
	private String imgPath;
	@Column(nullable = false)
	private int quantityInStock;
	
	@ElementCollection
	private List<String> tags;
}
