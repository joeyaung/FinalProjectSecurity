package tw.com.finalproject.yumyu.Member;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
public class ApplicationUser {

//	For UserDetails
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(unique = true, nullable = false)
	private String username;
	@Column(nullable = false)
	private String password;
	@Column(nullable = false)
	private String roles;

//	Member attributes
	@Column(nullable = false)
	private String fullName;
	@Column(nullable = false)
	private String phone;
	private String city;
	private String town;
	private String fullAddress;
	private String zipCode;

}
