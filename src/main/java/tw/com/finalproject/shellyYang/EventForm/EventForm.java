package tw.com.finalproject.shellyYang.EventForm;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import tw.com.finalproject.shellyYang.Event.Event;
import tw.com.finalproject.yumyu.Member.ApplicationUser;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name = "EVENTFORM",uniqueConstraints={@UniqueConstraint(columnNames={"EVENT_ID","USER_ID"})})
public class EventForm {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer form_id;
	
	@OneToOne
	@JoinColumn(name="EVENT_ID")
	private Event event;
	
	@OneToOne
	@JoinColumn(name="USER_ID")
	private ApplicationUser applicationUser;
	
	private String creation_time;
	
	private String gender;
	
	private String id_number;
	
	private String message;
	
	private String status;

	

}

