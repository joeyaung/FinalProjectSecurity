package tw.com.finalproject.springSecurity.Handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		HttpSession session = request.getSession();
		if (session != null) {
			session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
			
		}

		if (request.getParameter("userType").equals("member")) {
			response.sendRedirect(request.getContextPath() + "/account");
			return;
		} else if (request.getParameter("userType").equals("employee")) {
			response.sendRedirect(request.getContextPath() + "/inner");
			return;
		}
		
		response.sendRedirect(request.getContextPath() + "/");
		return;
	}

}
