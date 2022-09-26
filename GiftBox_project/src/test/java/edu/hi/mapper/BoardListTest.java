package edu.hi.mapper;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import edu.hi.model.ShopVO;

@SpringBootTest
class BoardListTest {
	
	 private static final Logger log = LoggerFactory.getLogger(BoardListTest.class);
	 
	 @Autowired
	 private ShopMapper mapper;


		@Test
		public void authorModifyTest() {
			
			ShopVO shop = new ShopVO();
					
			shop.setShopId(7);
			System.out.println("수정 전...................." + mapper.shopGetDetail(shop.getShopId()));
			
			shop.setShopName("수정");
			shop.setNationId("01");
			shop.setShopIntro("소개 수정 하였습니다.");
			
			mapper.shopModify(shop);
			System.out.println("수정 후...................." + mapper.shopGetDetail(shop.getShopId()));
			
		}

}
