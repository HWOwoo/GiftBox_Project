package edu.hi.mapper;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import edu.hi.model.CartDTO;

@SpringBootTest
class CartMapperTests {

	@Autowired
	private CartMapper mapper;
	
//	@Test
//	public void addCart() {
//		String memberId = "admin";
//		int giftId = 61;
//		int count = 2;
//		
//		CartDTO cart = new CartDTO();
//		cart.setMemberId(memberId);
//		cart.setGiftId(giftId);
//		cart.setGiftCount(count);
//		
//		int result = 0;
//		result = mapper.addCart(cart);
//		
//		System.out.println("결과 : " + result);
//		
//	}	
	
//	/* 카트 삭제 */
//
//	@Test
//	public void deleteCartTest() {
//		int cartId = 1;
//		
//		mapper.deleteCart(cartId);
//
//	}
	
	/* 카트 수량 수정 */

//	@Test
//	public void modifyCartTest() {
//		int cartId = 1;
//		int count = 5;
//		
//		CartDTO cart = new CartDTO();
//		cart.setCartId(cartId);
//		cart.setGiftCount(count);
//		
//		mapper.modifyCount(cart);
//		
//	}
	
	/* 카트 목록 */ 

//	@Test
//	public void getCartTest() {
//		String memberId = "admin";
//		
//		
//		List<CartDTO> list = mapper.getCart(memberId);
//		for(CartDTO cart : list) {
//			System.out.println(cart);
//			cart.initSaleTotal();
//			System.out.println("init cart : " + cart);
//		}
//		
//		
//	
//	}	
	
	/* 카트 확인 */

	@Test
	public void checkCartTest() {
		
		String memberId = "admin";
		int giftId = 61;
		
		CartDTO cart = new CartDTO();
		cart.setMemberId(memberId);
		cart.setGiftId(giftId);
		
		CartDTO resutlCart = mapper.checkCart(cart);
		System.out.println("결과 : " + resutlCart);
		
	}
}
