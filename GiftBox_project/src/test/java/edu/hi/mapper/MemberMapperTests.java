package edu.hi.mapper;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import edu.hi.model.GiftVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/resources/applicationContext.xml")
public class MemberMapperTests {
	
	@Autowired
	private AdminMapper mapper;
	
	/* 상품 등록 */
	@Test
	public void giftEnrollTest() throws Exception{
		
		GiftVO gift = new GiftVO();
		
		gift.setGiftName("mapper 테스트");
		gift.setShopId(123);
		gift.setPubleYear("2021-03-18");
		gift.setPublisher("출판사");
		gift.setCateCode("0231");
		gift.setGiftPrice(20000);
		gift.setGiftStock(300);
		gift.setGiftDiscount(0.23);
		gift.setGiftIntro("책 소개 ");
		gift.setGiftContents("책 목차 ");
		
		mapper.giftEnroll(gift);
	}
	
	
}
