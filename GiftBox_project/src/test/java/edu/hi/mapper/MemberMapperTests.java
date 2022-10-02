package edu.hi.mapper;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import edu.hi.model.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/resources/applicationContext.xml")
public class MemberMapperTests {
	
	
	@Autowired
	private AdminMapper mapper;
	
	@Test
	public void goodsGetListTest() {
			
		Criteria cri = new Criteria();
		
//		/* 검색조건 */
//		cri.setKeyword("테스트");
//		
//		/* 검색 리스트 */
//		List list = mapper.goodsGetList(cri);
//		for(int i = 0; i < list.size(); i++) {
//			System.out.println("result......." + i + " : " + list.get(i));
//		}
		
		/* 상품 총 갯수 */
		int result = mapper.goodsGetTotal(cri);
		System.out.println("resutl.........." + result);
		
		
	}
	
	
}
