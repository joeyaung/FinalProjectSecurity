
package tw.com.finalproject.yumyu.InternalUse;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Employee {

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

//	Employee attributes
	@Column(nullable = false)
	private String fullName;
	
	@Column(nullable = false)
	private String phone;
	
	@Column(nullable = false)
	private String title;
	
	@Column(nullable = false)
	private String department;
	
	@Column(nullable = false)
	private String location;
	
	@Column(nullable = false)
	private int salary;
	
	@ManyToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name = "manager_id")
	@JsonIgnore
	private Employee manager;
	
	@OneToMany(targetEntity = Client.class, mappedBy = "id")
	@JsonIgnore
	private Set<Client> clients;

}
