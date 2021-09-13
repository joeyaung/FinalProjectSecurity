package tw.com.finalproject.yumyu.InternalUse;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
	private String createDate;
	private String updateTime;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "member_id", referencedColumnName = "id")
	private ApplicationUser member;

	@ManyToOne(cascade = CascadeType.ALL, targetEntity = Employee.class)
	@JoinColumn(name = "employee_id", referencedColumnName = "id")
	private Employee inchargedEmployee;

	@OneToMany(cascade = CascadeType.ALL, targetEntity = ClientActivity.class)
	@JoinColumn(name = "activity_id", referencedColumnName = "id")
	@JsonIgnore
	private List<ClientActivity> activities;

	@PrePersist
	protected void onCreate() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		this.createDate = df.format(new Date());
	}

	@PreUpdate
	protected void onUpdate() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		this.updateTime = df.format(new Date());
	}

}
