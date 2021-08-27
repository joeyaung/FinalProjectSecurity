package tw.com.finalproject.yumyu.InternalUse;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import tw.com.finalproject.yumyu.Member.ApplicationUser;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Client {
	
//	For UserDetails
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(unique = true, nullable = false)
	private String email;
	@Column(nullable = false)
	private String fullName;
	@Column(nullable = false)
	private String phone;
	private String city;
	private String town;
	private String fullAddress;
	private String zipCode;
	private String salesStage;
	//TODO Employee and MEMBER connection
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "member_id", referencedColumnName = "id")
	private ApplicationUser member;
	
	@ManyToOne(cascade = CascadeType.ALL, targetEntity = Employee.class)
	@JoinColumn(name = "employee_id", referencedColumnName = "id")
	private Employee inchargedEmployee;
	

}
