package tw.com.finalproject.yumyu.Member.API;

import java.security.Principal;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Map.Entry;

import javax.annotation.security.RolesAllowed;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tw.com.finalproject.Mail.MailService;
import tw.com.finalproject.yumyu.Enums.ApplicationRoles;
import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.PasswordResetToken;
import tw.com.finalproject.yumyu.Member.Service.ApplicationUserService;
import tw.com.finalproject.yumyu.Member.Service.PasswordResetTokenService;
import tw.com.finalproject.yumyu.Utils.Utils;

@RestController
@RequestMapping("/api/v1/member/")
public class MemberAPIController {

	@Autowired
	private ApplicationUserService applicationUserService;
	
	@Autowired
	private PasswordResetTokenService passwordResetTokenService;
	
	@Autowired
	private MailService mailService;

	@Autowired
	private PasswordEncoder passwordEncoder;

//	Get User By ID
	@GetMapping(path = "getMyInfo", produces = "application/json;charset=UTF-8")
	@RolesAllowed("ROLE_MEMBER")
	public ApplicationUser queryByID(@PathVariable(name = "id") String id, Principal principal) {
		String username = principal.getName();
		ApplicationUser curUser = applicationUserService.findByUsername(username);
		if (!id.equals(String.valueOf(curUser.getId()))) {
			return null;
		}
		return curUser;
	}

//	Check if User Exits By UserName
	@GetMapping(path = "isExits/{username}", produces = "plain/text;charset=UTF-8")
	public String queryByID(@PathVariable(name = "username") String username) {
		System.out.println(username);
		ApplicationUser curUser = applicationUserService.findByUsername(username);
		System.out.println(curUser);
		if (curUser != null) {

			return "yes";
		} else {
			return "no";
		}
	}

//	Profile Changing Auth
	@PostMapping(path = "auth", produces = "application/json;charset=UTF-8")
	@RolesAllowed("ROLE_MEMBER")
	public ApplicationUser profileChangeAuth(Principal principal, @RequestParam("password") String rawPassword) {
		String name = principal.getName();
		ApplicationUser queryByUsername = applicationUserService.findByUsername(name);
		String encodePassword = queryByUsername.getPassword();
		if (passwordEncoder.matches(rawPassword, encodePassword)) {
			return queryByUsername;
		}
		return null;
	}

//	Update Profile
	@PutMapping(path = "update", produces = "plain/text;charset=UTF-8")
	@RolesAllowed("ROLE_MEMBER")
	public String updateUserProfile(Principal principal, @RequestBody Map<String, String> data) {
		String name = principal.getName();
		ApplicationUser result = applicationUserService.findByUsername(name);
		for (Entry<String, String> curData : data.entrySet()) {
			String curKey = curData.getKey();
			List<String> userAttributes = List.of("password", "fullName", "phone", "city", "town", "fullAddress",
					"zipCode");
			for (String curAttribute : userAttributes) {
				if (curKey.equalsIgnoreCase(curAttribute)) {
					if (curKey.equals("password")) {
						result.setPassword(passwordEncoder.encode(data.get(curKey)));
					}
					if (curKey.equals("fullName")) {
						result.setFullName(data.get(curKey));
					}
					if (curKey.equals("phone")) {
						result.setPhone(data.get(curKey));
					}
					if (curKey.equals("city")) {
						result.setCity(data.get(curKey));
						String formatedAddress = String.format("%s%s%s", result.getCity(), result.getTown(),
								result.getFullAddress());
						Utils utils = new Utils();
						String postCode = utils.findPostCode(formatedAddress);
						result.setZipCode(postCode);
					}
					if (curKey.equals("town")) {
						result.setTown(data.get(curKey));
						String formatedAddress = String.format("%s%s%s", result.getCity(), result.getTown(),
								result.getFullAddress());
						Utils utils = new Utils();
						String postCode = utils.findPostCode(formatedAddress);
						result.setZipCode(postCode);
					}
					if (curKey.equals("fullAddress")) {
						result.setFullAddress(data.get(curKey));
						String formatedAddress = String.format("%s%s%s", result.getCity(), result.getTown(),
								result.getFullAddress());
						Utils utils = new Utils();
						String postCode = utils.findPostCode(formatedAddress);
						result.setZipCode(postCode);
					}
				}
			}
		}
		boolean saveResult = applicationUserService.save(result);
		if (saveResult) {
			return "ok";
		}
		return "fail";
	}

//	Create ApplicationUser
	@PostMapping(path = "create", produces = "plain/text;charset=UTF-8")
	public String createAppUser(@RequestBody Map<String, String> data) {
		ApplicationUser newUser = new ApplicationUser();
		String role = ApplicationRoles.MEMBER.name();
		newUser.setRoles(role);

		String fullName = data.get("fullName");
		String username = data.get("username");
		String rawPassword = data.get("password");
		String phone = data.get("phone");
		String city = data.get("city");
		String town = data.get("town");
		String fullAddress = data.get("fullAddress");
		String zipCode = "";
		if (city != null || town != null) {
			String formatedAddress = String.format("%s%s", city, town);
			Utils utils = new Utils();
			zipCode = utils.findPostCode(formatedAddress);
		}
		newUser.setFullName(fullName);
		newUser.setUsername(username);
		newUser.setPassword(passwordEncoder.encode(rawPassword));
		newUser.setPhone(phone);
		newUser.setCity(city);
		newUser.setTown(town);
		newUser.setFullAddress(fullAddress);
		newUser.setZipCode(zipCode);

		boolean result = applicationUserService.save(newUser);
		if (result) {
			return "ok";
		}
		return "fail";
	}

	@PostMapping(path = "reset_password", produces = "application/json;charset=UTF-8")
	public Map<String, Object> generateResetPassword(@RequestBody Map<String, String> data) {
		final long ONE_MINUTE_IN_MILLIS = 60000;

		Map<String, Object> resultMap = new HashMap<>();

		String username = data.get("username");
		ApplicationUser member = applicationUserService.findByUsername(username);

		if (member == null) {
			resultMap.put("status", "MEMBER_NOT_FOUND");
			return resultMap;
		}
		
		PasswordResetToken findResult = passwordResetTokenService.findByMember(member);
		String token = UUID.randomUUID().toString();
		Calendar dateCalendar = Calendar.getInstance();
		long t = dateCalendar.getTimeInMillis();
		Date expireDate = new Date(t + (10 * ONE_MINUTE_IN_MILLIS));
		PasswordResetToken passwordResetToken = new PasswordResetToken();
		if (findResult == null) {
			passwordResetToken = PasswordResetToken.builder().member(member).token(token).expiryDate(expireDate).build();
		} else {
			passwordResetToken = findResult;
			passwordResetToken.setToken(token);
			passwordResetToken.setExpiryDate(expireDate);
		}
		
		boolean result = passwordResetTokenService.save(passwordResetToken);
		
		if (result) {
//			TODO
			String receipt = member.getUsername();
			String memberName = member.getFullName();
			mailService.sendResetPasswordEmail(receipt, token, memberName);
			resultMap.put("status", "ok");
			return resultMap;
		}
		
		resultMap.put("status", "fail");
		return resultMap;
	}
	
	@PostMapping(path = "update_new_password", produces = "application/json;charset=UTF-8")
	public Map<String, Object> updateNewPasswordForMember(@RequestBody Map<String, String> data){
		Map<String, Object> resultMap = new HashMap<>();
		String newPassword = data.get("password");
		String token = data.get("token");
		
		PasswordResetToken findByToken = passwordResetTokenService.findByToken(token);
		ApplicationUser member = findByToken.getMember();
		member.setPassword(passwordEncoder.encode(newPassword));
		boolean result = applicationUserService.save(member);
		if (result) {
			resultMap.put("status", "ok");
			return resultMap;
		}
		resultMap.put("status", "fail");
		return resultMap;
	}

}
