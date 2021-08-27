package tw.com.finalproject.yumyu.InternalUse;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ClientActivity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String title;
	private String activityType;
	private String content;

	@ManyToOne
	@JoinColumn(name = "emp_id")
	private Employee employee;

	@ManyToOne
	@JoinColumn(name = "client_id")
	private Client client;

	private String createdDate;

	@PrePersist
	protected void onCreate() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		createdDate = df.format(new Date());
	}
}
