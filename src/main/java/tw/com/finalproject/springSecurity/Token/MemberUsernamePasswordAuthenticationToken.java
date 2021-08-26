package tw.com.finalproject.springSecurity.Token;

import java.util.Collection;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;


public class MemberUsernamePasswordAuthenticationToken extends UsernamePasswordAuthenticationToken {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3490238789733102168L;
	
	public MemberUsernamePasswordAuthenticationToken(Object principal, Object credentials) {
		super(principal, credentials);
	}
	
	public MemberUsernamePasswordAuthenticationToken(Object principal, Object credentials, Collection<? extends GrantedAuthority> authorites) {
		super(principal, credentials, authorites);
	}
	
}
