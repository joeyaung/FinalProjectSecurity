package tw.com.finalproject.springSecurity.Filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.stereotype.Component;

import tw.com.finalproject.springSecurity.Token.EmployeeUsernamePasswordAuthenticationToken;
import tw.com.finalproject.springSecurity.Token.MemberUsernamePasswordAuthenticationToken;

@Component
public class MyAuthenticationFilter extends UsernamePasswordAuthenticationFilter {
	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException {
		UsernamePasswordAuthenticationToken authToken = null;
		if ("member".equals(request.getParameter("userType"))) {
			authToken = new MemberUsernamePasswordAuthenticationToken(request.getParameter("username"), request.getParameter("password"));
		} else {
			authToken = new EmployeeUsernamePasswordAuthenticationToken(request.getParameter("username"), request.getParameter("password"));
		}
		
		setDetails(request, authToken);
		return super.getAuthenticationManager().authenticate(authToken);
	}
	
	@Override
	@Autowired
	public void setAuthenticationManager(AuthenticationManager authenticationManager) {
		super.setAuthenticationManager(authenticationManager);
	}
	

//	@Override
//	@Autowired
//	public void setAuthenticationManager(AuthenticationManager authenticationManager) {
//	    super.setAuthenticationManager(authenticationManager);
//	}
}
