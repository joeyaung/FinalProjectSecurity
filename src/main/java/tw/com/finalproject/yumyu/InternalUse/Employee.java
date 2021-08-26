
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

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import tw.com.finalproject.yumyu.Enums.OfficeLocations;

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
	private OfficeLocations location;
	
	@Column(nullable = false)
	private int salary;
	
	@ManyToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name = "manager_id")
	private Employee manager;
	
	@OneToMany(mappedBy = "manager")
	private Set<Employee> subordinates;
	
	@OneToMany(targetEntity = Client.class, mappedBy = "id")
	private Set<Client> clients;

}
