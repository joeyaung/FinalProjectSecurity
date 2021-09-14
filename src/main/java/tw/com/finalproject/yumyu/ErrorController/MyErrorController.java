package tw.com.finalproject.yumyu.ErrorController;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyErrorController implements ErrorController {

	@RequestMapping("/error")
	public String handleError(HttpServletRequest request) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		if (status != null) {
			Integer statusCode = Integer.valueOf(status.toString());

			if (statusCode == HttpStatus.NOT_FOUND.value()) {
				return "errorPage/404";
			} else if (statusCode == HttpStatus.FORBIDDEN.value()) {
				return "errorPage/403";
			} else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
				return "errorPage/500";
			}
		}
		return "errorPage/404";
	}
}
