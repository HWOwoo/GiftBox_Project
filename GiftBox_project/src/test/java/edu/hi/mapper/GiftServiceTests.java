
package edu.hi.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import edu.hi.model.Criteria;
import edu.hi.service.GiftService;

@SpringBootTest
class GiftServiceTests {
	
	@Autowired
	GiftService service;

//	@Test
//	public void getCateInfoListTest1() {
//		Criteria cri = new Criteria();
//	
//		String type = "TC";
//		//String keyword = "테스트";
//		String keyword = "없음";	
//		String cateCode="101001";
//
//		cri.setType(type);
//		cri.setKeyword(keyword);
//		cri.setCateCode(cateCode);
//		
//		System.out.println("List<CateFilterVO> : " + service.getCateInfoList(cri));
//		
//	}
	
	@Test
	public void getCateInfoListTest2() {
		Criteria cri = new Criteria();
	
		String type = "AC";
		String keyword = "김윤수";	
		//String keyword = "머스크";	
		String cateCode = "101001";

		cri.setType(type);
		cri.setKeyword(keyword);
		cri.setCateCode(cateCode);
		
		System.out.println("List<CateFilterDTO> : " + service.getCateInfoList(cri));
		
	}	
//
//	@Test
//	public void getCateInfoListTest3() {
//		Criteria cri = new Criteria();
//	
//		String type = "T";
//		String keyword = "테스트";
//		//String keyword = "없음";	
//		
//
//		cri.setType(type);
//		cri.setKeyword(keyword);
//		
//		System.out.println("List<CateFilterVO> : " + service.getCateInfoList(cri));
//		
//	}	
//	
//	@Test
//	public void getCateInfoListTest4() {
//		Criteria cri = new Criteria();
//	
//		String type = "AC";
//		//String keyword = "유홍준";	
//		String keyword = "머스크";	
//		
//
//		cri.setType(type);
//		cri.setKeyword(keyword);
//		
//		System.out.println("List<CateFilterVO> : " + service.getCateInfoList(cri));
//		
//	}

}
