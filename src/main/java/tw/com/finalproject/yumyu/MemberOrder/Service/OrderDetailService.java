package tw.com.finalproject.yumyu.MemberOrder.Service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.MemberOrder.Repository.OrderDetailRepository;

@Service
@Transactional
public class OrderDetailService {
	@Autowired
	private OrderDetailRepository orderDetailRepository;
	
}
