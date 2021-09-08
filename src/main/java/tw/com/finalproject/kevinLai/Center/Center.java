package tw.com.finalproject.kevinLai.Center;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
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
	private String centerLoc;		//中心縣市(與試駕中心結合)
	private String centerLocSit;	//中心地區(與試駕中心結合)
	private String centerAddress;	//中心地址
	private String centerOpentime;  //中心營業時間
	private String latitude;		//緯度
	private String longitude;		//經度
	
//	 @OneToOne
//	 private Store store;
	
	
	@Column(name = "centerImage",columnDefinition = "VARBINARY(MAX)")
	private byte[] centerImage;

	@Transient
	private String centerBase64Image;

	@Transient
	private MultipartFile centerFile;
	
	

}
