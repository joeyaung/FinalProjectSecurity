package tw.com.finalproject.yumyu.Member.API;

import java.security.Principal;
import java.util.List;
import java.util.Map;
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

import tw.com.finalproject.yumyu.Enums.ApplicationRoles;
import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.Service.ApplicationUserService;
import tw.com.finalproject.yumyu.Utils.Utils;

@RestController
@RequestMapping("/api/v1/member/")
public class MemberAPIController {

	@Autowired
	private ApplicationUserService applicationUserService;

	@Autowired
	private PasswordEncoder passwordEncoder;

//	Get User By ID
	@GetMapping(path = "getMyInfo", produces = "application/json;charset=UTF-8")
	@RolesAllowed("ROLE_MEMBER")
	public ApplicationUser queryByID(@PathVariable(name = "id") String id, Principal principal) {
		String username = principal.getName();
		ApplicationUser curUser = applicationUserService.queryByUsername(username);
		if (!id.equals(String.valueOf(curUser.getId()))) {
			return null;
		}
		return curUser;
	}

//	Check if User Exits By UserName
	@GetMapping(path = "isExits/{username}", produces = "plain/text;charset=UTF-8")
	public String queryByID(@PathVariable(name = "username") String username) {
		System.out.println(username);
		ApplicationUser curUser = applicationUserService.queryByUsername(username);
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
		ApplicationUser queryByUsername = applicationUserService.queryByUsername(name);
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
		ApplicationUser result = applicationUserService.queryByUsername(name);
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

}
