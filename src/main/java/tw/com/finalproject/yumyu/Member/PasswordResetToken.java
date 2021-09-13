package tw.com.finalproject.yumyu.Member;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PasswordResetToken {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String token;
	
	@OneToOne(targetEntity = ApplicationUser.class, fetch = FetchType.EAGER)
	@JoinColumn(nullable = false, name = "member_id")
	private ApplicationUser member;
	
	private Date expiryDate;
}
