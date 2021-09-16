package tw.com.finalproject.naiChuan.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import tw.com.finalproject.naiChuan.TestDrive.TestDriveApointment;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Model {

	@Id
	private String modelType;
	
	private int price;
	private String engineType;
	private String engineDisplacement;
	private String power;
	private String torque;
	private String consumption;
	private String seat;
	@Column(name = "subtitle", columnDefinition = "VARCHAR(MAX) NOT NULL")
	private String subtitle;
	@Column(name = "description", columnDefinition = "VARCHAR(MAX) NOT NULL")
	private String description;
	
	@Column(name = "outerImage",columnDefinition = "VARBINARY(MAX)")
	private byte[] exterior;
	@Transient
	private String outerBase64Image;
	@Transient
	private MultipartFile outerFile;
	
	@Column(name = "innerImage",columnDefinition = "VARBINARY(MAX)")
	private byte[] interior;
	@Transient
	private String innerBase64Image;
	@Transient
	private MultipartFile innerFile;
	
	@Column(name = "backgroundImage",columnDefinition = "VARBINARY(MAX)")
	private byte[] background;
	@Transient
	private String backgroundBase64Image;
	@Transient
	private MultipartFile backgroundFile;
	
	@Column(name = "angle1Image",columnDefinition = "VARBINARY(MAX)")
	private byte[] angle1;
	@Transient
	private String angle1Base64Image;
	@Transient
	private MultipartFile angle1File;
	
	@Column(name = "angle4Image",columnDefinition = "VARBINARY(MAX)")
	private byte[] angle4;
	@Transient
	private String angle4Base64Image;
	@Transient
	private MultipartFile angle4File;
	
	@Column(name = "angle7Image",columnDefinition = "VARBINARY(MAX)")
	private byte[] angle7;
	@Transient
	private String angle7Base64Image;
	@Transient
	private MultipartFile angle7File;
	
	@Column(name = "angle10Image",columnDefinition = "VARBINARY(MAX)")
	private byte[] angle10;
	@Transient
	private String angle10Base64Image;
	@Transient
	private MultipartFile angle10File;
	
	@Column(name = "angle13Image",columnDefinition = "VARBINARY(MAX)")
	private byte[] angle13;
	@Transient
	private String angle13Base64Image;
	@Transient
	private MultipartFile angle13File;
	
	@Column(name = "angle16Image",columnDefinition = "VARBINARY(MAX)")
	private byte[] angle16;
	@Transient
	private String angle16Base64Image;
	@Transient
	private MultipartFile angle16File;
	
	@Column(name = "angle19Image",columnDefinition = "VARBINARY(MAX)")
	private byte[] angle19;
	@Transient
	private String angle19Base64Image;
	@Transient
	private MultipartFile angle19File;
	
	
}
