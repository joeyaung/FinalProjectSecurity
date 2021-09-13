package tw.com.finalproject.yumyu.MemberOrder.Service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.MemberOrder.MemberOrder;
import tw.com.finalproject.yumyu.MemberOrder.Repository.MemberOrderRepository;

@Service
@Transactional
public class MemberOrderService {

	@Autowired
	private MemberOrderRepository memberOrderRepository;

	public boolean save(MemberOrder order) {
		try {
			memberOrderRepository.save(order);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean saveAll(List<MemberOrder> orders) {
		try {
			memberOrderRepository.saveAll(orders);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<MemberOrder> findByMember(ApplicationUser member) {
		List<MemberOrder> resultList = memberOrderRepository.findByMemberOrderByCreateDateDesc(member);
		return resultList;
	}
	
	public List<MemberOrder> findAllOrders(){
		List<MemberOrder> result = memberOrderRepository.findAll();
		return result;
	}
	
	public MemberOrder findById(long id) {
		Optional<MemberOrder> result = memberOrderRepository.findById(id);
		if (result.isEmpty()) {
			System.out.println("null");
			return null;
		}
		return result.get();
	}
}
