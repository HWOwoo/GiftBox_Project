package edu.hi.mapper;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import edu.hi.model.GiftVO;

@SpringBootTest
class BoardListTest {
	
	 private static final Logger log = LoggerFactory.getLogger(BoardListTest.class);

		@Autowired
		private AdminMapper mapper;
		
//		@Test
//		public void goodsGetListTest() {
//				
//			Criteria cri = new Criteria();
//			
//			/* 검색조건 */
//			cri.setKeyword("테스트");
//			
//			/* 검색 리스트 */
//			List list = mapper.goodsGetList(cri);
//			for(int i = 0; i < list.size(); i++) {
//				System.out.println("result......." + i + " : " + list.get(i));
//			}
			
//			/* 상품 총 갯수 */
//			int result = mapper.goodsGetTotal(cri);
//			System.out.println("resutl.........." + result);
			
		/* 상품 조회 페이지 */
		@Test
		public void goodsGetDetailTest() {
			
			int giftId = 61;
			
			GiftVO result = mapper.goodsGetDetail(giftId);
			
			System.out.println("상품 조회 데이터 : " + result);
			
			
		}


}

