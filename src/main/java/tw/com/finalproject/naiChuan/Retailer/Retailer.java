package tw.com.finalproject.naiChuan.Retailer;

import javax.persistence.Entity;
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
public class Retailer {

	@Id
	private String retailerId;
	private String tel;
	private String retailerName;
	private String email;
	private String location;
	private String workday;
	private String weekend;

}
