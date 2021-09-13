package tw.com.finalproject.yumyu.Member.Service;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.PasswordResetToken;
import tw.com.finalproject.yumyu.Member.Repository.PasswordResetTokenRepository;

@Service
@Transactional
public class PasswordResetTokenService {

	@Autowired
	private PasswordResetTokenRepository passwordResetTokenRepository;
	
	public boolean save(PasswordResetToken passwordResetToken) {
		try {
			passwordResetTokenRepository.save(passwordResetToken);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public PasswordResetToken findByMember(ApplicationUser member) {
		Optional<PasswordResetToken> result = passwordResetTokenRepository.findByMember(member);
		if (result.isEmpty()) {
			return null;
		}
		return result.get();
	}
	
	public PasswordResetToken findByToken(String token) {
		Optional<PasswordResetToken> result = passwordResetTokenRepository.findByToken(token);
		if (result.isEmpty()) {
			return null;
		}
		return result.get();
	}
}
