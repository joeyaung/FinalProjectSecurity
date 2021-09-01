package tw.com.finalproject.yumyu.MemberOrder;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberOrder {
	
	private long id;
	private String method;
	private int totalAmount;
	private OrderDetail orderDetail;
	
}
