package tw.com.finalproject.yumyu.Utils;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Component
public class Utils {

	private final static String googleGeoAPIUrl = "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyAvr3kMsioad5Zo07JoypCyYwHpAq4qy5w";

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	public String findPostCode(String address) {
		RestTemplate restTemplate = new RestTemplate();
		String postCode = null;
		String googleurl = StringUtils.join(googleGeoAPIUrl, "&address=", address);
		String rs = restTemplate.getForObject(googleurl, String.class);
		JsonObject convertedObject = new Gson().fromJson(rs, JsonObject.class);
		JsonArray addressComponents = convertedObject.getAsJsonArray("results").get(0).getAsJsonObject()
				.getAsJsonArray("address_components");
		postCode = addressComponents.get(addressComponents.size() - 1).getAsJsonObject().get("long_name").getAsString();

		return postCode;
	}
	
	public String generateRandomString(int length) {
		boolean useLetters = true;
		boolean useNumbers = true;
		String generatedString = RandomStringUtils.random(length, useLetters, useNumbers);

		return generatedString;
	}

}
