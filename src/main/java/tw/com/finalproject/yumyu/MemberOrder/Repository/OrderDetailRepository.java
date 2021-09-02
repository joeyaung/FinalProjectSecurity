package tw.com.finalproject.yumyu.MemberOrder.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.finalproject.yumyu.MemberOrder.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
}
