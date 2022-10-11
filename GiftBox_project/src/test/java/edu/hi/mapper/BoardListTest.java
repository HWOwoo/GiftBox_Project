package edu.hi.mapper;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import edu.hi.model.AttachImageVO;

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
			
		/* 이미지 등록 */
		@Test
		public void imageEnrollTest() {
			
			AttachImageVO vo = new AttachImageVO();
			
			vo.setGiftId(121);
			vo.setFileName("test");
			vo.setUploadPath("test");
			vo.setUuid("test2");
			
			mapper.imageEnroll(vo);
			
		}


}

