package tw.com.finalproject.yumyu.Member.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.Member.ApplicationUser;

@Service
public interface ApplicationUserRepository extends JpaRepository<ApplicationUser, Long> {
	public Optional<ApplicationUser> findByUsername(String username);
}
