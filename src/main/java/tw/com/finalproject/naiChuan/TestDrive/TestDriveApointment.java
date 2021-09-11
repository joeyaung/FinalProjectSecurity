package tw.com.finalproject.naiChuan.TestDrive;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TestDriveApointment {
	
	@Id
	private String formId;
	private String driveDate;
	private String driveTime;
	private String carMod;
	private String driveLoc;
	private String driveLocSit;
	private String sales;
	private String formTime;
	private String nameCli;
	private String gendCli;
	private String timCli;
	private String mailCli;
	private String telCli;
	private String remark;
}

