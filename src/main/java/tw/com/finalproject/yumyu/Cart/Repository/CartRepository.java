package tw.com.finalproject.yumyu.Cart.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.finalproject.yumyu.Cart.CartItem;
import tw.com.finalproject.yumyu.Member.ApplicationUser;

public interface CartRepository extends JpaRepository<CartItem, Long> {
	public List<CartItem> findByMember(ApplicationUser member);
}
