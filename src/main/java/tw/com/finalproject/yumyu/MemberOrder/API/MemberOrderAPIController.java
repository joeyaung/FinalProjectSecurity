package tw.com.finalproject.yumyu.MemberOrder.API;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.Member.Service.ApplicationUserService;
import tw.com.finalproject.yumyu.MemberOrder.MemberOrder;
import tw.com.finalproject.yumyu.MemberOrder.Service.MemberOrderService;

@RestController
public class MemberOrderAPIController {

	@Autowired
	private MemberOrderService memberOrderService;
	@Autowired
	private ApplicationUserService applicationUserService;

	@GetMapping(path = "/account/api/v1/order", produces = "application/json;charset=UTF-8")
	public List<MemberOrder> queryMemberOrdersAll(Principal principal) {
		String username = principal.getName();
		ApplicationUser member = applicationUserService.findByUsername(username);
		List<MemberOrder> resultList = memberOrderService.findByMember(member);
		return resultList;
	}
	
	@GetMapping(path = "/inner/admin/api/v1/order", produces = "application/json; charset=UTF-8")
	public List<MemberOrder> queryAllOrders(){
		List<MemberOrder> result = memberOrderService.findAllOrders();
		return result;
	}
}
