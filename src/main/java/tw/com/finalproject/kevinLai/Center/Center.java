package tw.com.finalproject.kevinLai.Center;

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
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Center {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int centerId;      		//中心ID
	private String centerName;    	//中心名稱
	private String centerPhone;		//中心電話
	private String centerEmail;   	//中心Email
	private String centerAddress;	//中心地址
	private String centerOpentime;  //中心營業時間
	private String centerService;	//中心服務內容
	
	
	@Column(name = "centerImage",columnDefinition = "VARBINARY(MAX)")
	private byte[] centerImage;

	@Transient
	private String centerBase64Image;

	@Transient
	private MultipartFile centerFile;
	
	

}
