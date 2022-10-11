package edu.hi.mapper;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class AttachMapperTests {

	@Autowired
	private AttachMapper attachMapper;
	
	/** 이미지 정보 반환*/
	@Test
	public void getAttachListTests() {
		
		int giftId = 121;
		
		System.out.println("이미지 정보 : " + attachMapper.getAttachList(giftId));
		
		
	}

}
