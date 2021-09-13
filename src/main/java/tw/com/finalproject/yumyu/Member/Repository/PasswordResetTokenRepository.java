package tw.com.finalproject.yumyu.Member.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.PasswordResetToken;

public interface PasswordResetTokenRepository extends JpaRepository<PasswordResetToken, Long> {
	Optional<PasswordResetToken> findByMember(ApplicationUser member);
	Optional<PasswordResetToken> findByToken(String token);
}
