package tw.com.finalproject.springSecurity.AuthProvider;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import tw.com.finalproject.springSecurity.Token.MemberUsernamePasswordAuthenticationToken;
import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.Service.ApplicationUserService;

@Component
public class MemberCustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private ApplicationUserService applicationUserService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = authentication.getName();
		System.out.println(username);
		String rawPassword = authentication.getCredentials().toString();
		System.out.println(rawPassword);
		
		ApplicationUser user = applicationUserService.queryByUsername(username);
		System.out.println(user);
		if (user != null) {
			String encodedPassword = user.getPassword();
			if (passwordEncoder.matches(rawPassword, encodedPassword)) {
				List<GrantedAuthority> authorityList = new ArrayList<>();
				GrantedAuthority authority = new SimpleGrantedAuthority(user.getRoles());
				authorityList.add(authority);
				System.out.println(user.getRoles());

				return new MemberUsernamePasswordAuthenticationToken(username, rawPassword, authorityList);
			}
		}
		return null;
		
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(MemberUsernamePasswordAuthenticationToken.class);
	}

}
