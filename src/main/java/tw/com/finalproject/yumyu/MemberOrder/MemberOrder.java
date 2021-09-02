package tw.com.finalproject.yumyu.MemberOrder;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import tw.com.finalproject.yumyu.Member.ApplicationUser;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberOrder {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String method;
	private String paypalOrderId;
	private int totalAmount;
	private int totalQuantity;
	@OneToMany(cascade = CascadeType.ALL)
	private List<OrderDetail> orderDetail;
	@ManyToOne
	private ApplicationUser member;
	@Column(nullable = false)
	private String createDate;
	
}
