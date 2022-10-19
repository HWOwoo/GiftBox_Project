package edu.hi.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import edu.hi.model.CartDTO;
import edu.hi.service.CartService;

@SpringBootTest
class CartServiceTests {

	@Autowired
	private CartService service;
		
	//등록 테스트
	@Test
	public void addCartTest() {
		//given
			String memberId = "admin";
			int giftId = 121;
			int count = 5;
			
			CartDTO dto = new CartDTO(); 
			dto.setMemberId(memberId);
			dto.setGiftId(giftId);
			dto.setGiftCount(count);
		
		//when
			int result = service.addCart(dto);
		
		//then
			System.out.println("** result : " + result);
		
		
	}

}
