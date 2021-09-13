package tw.com.finalproject.yumyu.Cart;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Products.Product;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CartItem {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name = "member", referencedColumnName = "id")
	private ApplicationUser member;
	@ManyToOne
	@JoinColumn(name = "product_id", referencedColumnName = "id")
	private Product product;
	@Column(nullable = false)
	private int quantityInCart;

}
