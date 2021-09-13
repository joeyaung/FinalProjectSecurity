package tw.com.finalproject.yumyu.Initial;

import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.MEMBER;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.Service.ApplicationUserService;

@Service
@Transactional
public class DefaultMember {
	@Autowired
	private ApplicationUserService applicationUserService;

	@Autowired
	private PasswordEncoder passwordEncoder;

	public boolean create() throws IOException {

		List<ApplicationUser> resultList = new ArrayList<>();

		// Default User
		ApplicationUser defaultMember = ApplicationUser.builder().username("member@demo.com")
				.password(passwordEncoder.encode("password")).roles(MEMBER.name()).city("台北市").town("松山區")
				.fullAddress("寶清街105巷13號").zipCode("105").fullName("王小明").phone("0954925147").build();

		resultList.add(defaultMember);

		boolean result = applicationUserService.saveAll(resultList);
		return result;
	}

}
