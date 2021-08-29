package tw.com.finalproject.shellyYang.Event;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer event_id;

	private String event_title;

	private String event_subtitle;

	private String event_uploaddate;

	private String reserve_start_date;

	private String reserve_end_date;

	private String event_date;

	private String location;

	private Integer attend_limit;

	private Integer reserved_people;
	@Column(columnDefinition = "VARCHAR(MAX)")
	private String event_content;

	@Transient
	private String filepath;

	@Column(name = "event_img", columnDefinition = "VARBINARY(MAX)")
	private byte[] event_img;

	@Transient
	private String base64Image;

	@Transient
	private MultipartFile file;

}
