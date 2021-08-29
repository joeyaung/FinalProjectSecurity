package tw.com.finalproject.shellyYang.News;

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
public class News {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer newsId;
	private String title;
	private String subtitle;
	private String uploadDate;
	@Column(name = "content", columnDefinition = "VARCHAR(MAX) NOT NULL")
	private String content;
	private String remarks;

	@Column(name = "image", columnDefinition = "VARBINARY(MAX)")
	private byte[] image;

	@Transient
	private String base64Image;

	@Transient
	private MultipartFile file;

	@Transient
	private String filepath;

}
