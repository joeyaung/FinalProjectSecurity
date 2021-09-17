package tw.com.finalproject.yumyu.Member.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.Repository.ApplicationUserRepository;

@Service
public class ApplicationUserService implements UserDetailsService {

	@Autowired
	private ApplicationUserRepository applicationUserRepository;


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Optional<ApplicationUser> findbyUsename = applicationUserRepository.findByUsername(username);
		if (findbyUsename.isEmpty()) {
			throw new UsernameNotFoundException(String.format("%s is not found in DB.", username));
		}
		ApplicationUser result = findbyUsename.get();
		UserDetails resultDetails = User.builder().username(result.getUsername()).password(result.getPassword())
				.roles(result.getRoles()).build();
		return resultDetails;
	}

	public List<ApplicationUser> queryAll() {
		List<ApplicationUser> findAll = applicationUserRepository.findAll();
		return findAll;
	}

	public ApplicationUser findByUsername(String username) {
		Optional<ApplicationUser> findByUsername = applicationUserRepository.findByUsername(username);
		if (findByUsername.isEmpty()) {
			return null;
		}
		return findByUsername.get();
	}

	public boolean save(ApplicationUser user) {
		try {
			applicationUserRepository.save(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean saveAll(List<ApplicationUser> members) {
		try {
			applicationUserRepository.saveAll(members);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public ApplicationUser findById(long id) {
		Optional<ApplicationUser> result = applicationUserRepository.findById(id);
		if (result.isEmpty()) {
			return null;
		}
		return result.get();
	}
	
	public List<ApplicationUser> findAll(){
		List<ApplicationUser> result = applicationUserRepository.findAll();
		return result;
	}

}
