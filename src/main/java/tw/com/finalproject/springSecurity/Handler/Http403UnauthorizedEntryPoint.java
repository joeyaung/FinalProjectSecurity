package tw.com.finalproject.springSecurity.Handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

@Component
public class Http403UnauthorizedEntryPoint implements AuthenticationEntryPoint {

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException authException) throws IOException, ServletException {
		System.out.println("In Error Handler");
		String path = request.getServletPath();
		request.getSession().setAttribute("from", request.getRequestURI());
		if (path.startsWith("/account")) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		if (path.startsWith("/inner")) {
			response.sendRedirect(request.getContextPath() + "/login_inner");
			return;
		}
		
		
	}

}