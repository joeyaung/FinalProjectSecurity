package tw.com.finalproject.shellyYang.News.Comment;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String comment_id;
	private String upload_time;
	private String comment_name;
	private String comment_email;
	private String comment_content;

}
