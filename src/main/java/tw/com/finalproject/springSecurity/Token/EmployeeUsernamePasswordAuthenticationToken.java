package tw.com.finalproject.springSecurity.Token;

import java.util.Collection;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;


public class EmployeeUsernamePasswordAuthenticationToken extends UsernamePasswordAuthenticationToken {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4080270783326802094L;
	
	public EmployeeUsernamePasswordAuthenticationToken(Object principal, Object credentials) {
		super(principal, credentials);
	}
	
	public EmployeeUsernamePasswordAuthenticationToken(Object principal, Object credentials, Collection<? extends GrantedAuthority> authorities) {
		super(principal, credentials, authorities);
	}
	
	
}
