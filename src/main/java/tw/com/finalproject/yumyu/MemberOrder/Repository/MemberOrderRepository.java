package tw.com.finalproject.yumyu.MemberOrder.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.finalproject.yumyu.Member.ApplicationUser;
import tw.com.finalproject.yumyu.MemberOrder.MemberOrder;

public interface MemberOrderRepository extends JpaRepository<MemberOrder, Long> {
	public List<MemberOrder> findByMemberOrderByCreateDateDesc(ApplicationUser member);
}
