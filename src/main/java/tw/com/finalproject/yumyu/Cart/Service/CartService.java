package tw.com.finalproject.yumyu.Cart.Service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.Cart.CartItem;
import tw.com.finalproject.yumyu.Cart.Repository.CartRepository;
import tw.com.finalproject.yumyu.Member.ApplicationUser;

@Service
@Transactional
public class CartService {

	@Autowired
	private CartRepository cartRepository;

	public boolean save(CartItem cartItem) {
		try {
			cartRepository.save(cartItem);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<CartItem> findByMember(ApplicationUser member) {
		List<CartItem> result = cartRepository.findByMember(member);
		return result;
	}

	public boolean deleteCartItem(CartItem cartItem) {
		try {
			cartRepository.delete(cartItem);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteAllCartItemByMember(ApplicationUser member) {
		List<CartItem> memberCartItem = cartRepository.findByMember(member);
		try {
			cartRepository.deleteAll(memberCartItem);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean updateCartItem(CartItem cartItem) {
		try {
			cartRepository.saveAndFlush(cartItem);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean saveAll(List<CartItem> cartItems) {
		try {
			cartRepository.saveAll(cartItems);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	public CartItem findById(long cartId) {
		Optional<CartItem> result = cartRepository.findById(cartId);
		if (result.isEmpty()) {
			return null;
		}
		return result.get();
		
	}
}
