package edu.hi.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import edu.hi.model.ReplyDTO;

@SpringBootTest
class ReplyMapperTests {

	@Autowired
	private ReplyMapper mapper;
	
	@Test
	public void replyEnrollTest() {
		
		String id = "admin";
		int giftId = 95;
		double rating = 3.5;
		String content = "댓글 테스트";
		
		ReplyDTO dto = new ReplyDTO();
		dto.setGiftId(giftId);
		dto.setMemberId(id);
		dto.setRating(rating);
		dto.setContent(content);
		
		mapper.enrollReply(dto);
		
		
	}

}
