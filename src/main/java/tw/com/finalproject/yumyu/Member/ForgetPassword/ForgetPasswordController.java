package tw.com.finalproject.yumyu.Member.ForgetPassword;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.PasswordResetToken;
import tw.com.finalproject.yumyu.Member.Service.PasswordResetTokenService;

@Controller
public class ForgetPasswordController {

	@Autowired
	private PasswordResetTokenService passwordResetTokenService;
	
	@GetMapping(path = "/forget_password/reset")
	public String resetPasswordPageController(@RequestParam(name = "token") String token, HttpServletRequest request) {
		System.out.println(token);
		PasswordResetToken findByToken = passwordResetTokenService.findByToken(token);
		if (findByToken == null) {
			System.out.println("token service not found.");
			throw new AccessDeniedException("Access Denied");
		}
		Date expiryDate = findByToken.getExpiryDate();
		boolean isExpire = expiryDate.before(new Date());
		if (isExpire) {
			System.out.println("token is expired");
			throw new AccessDeniedException("Token Expired.");
		}
		
		ApplicationUser member = findByToken.getMember();
		request.getSession().setAttribute("username", member.getUsername());
		
		
		return "account/resetPassword";
	}
}