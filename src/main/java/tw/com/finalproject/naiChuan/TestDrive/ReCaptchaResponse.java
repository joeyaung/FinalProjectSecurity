package tw.com.finalproject.naiChuan.TestDrive;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReCaptchaResponse {
	private boolean success;
	private String hostname;
	private String challeng_ts;
	@JsonProperty("error-codes")
	private String[] errorCodes;
}
