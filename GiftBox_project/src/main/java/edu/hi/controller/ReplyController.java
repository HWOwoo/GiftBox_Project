package edu.hi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.hi.model.Criteria;
import edu.hi.model.ReplyDTO;
import edu.hi.model.ReplyPageDTO;
import edu.hi.service.ReplyService;

/** http body 바로 데이터를 담아 반환할 것이기 때문에 클래스 선언부에 @RestController */
@RestController 
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	/** 댓글 등록 */
	@PostMapping("/enroll")
	public void enrollReplyPOST(ReplyDTO dto) {
		
		replyService.enrollReply(dto);
		
	}
	
	/** 댓글 체크 */
	/** memberId, bookId 파라미터 */
	/** 존재 : 1 / 존재x : 0 */
	@PostMapping("/check")
	public String replyCheckPOST(ReplyDTO dto) {
		
		return replyService.checkReply(dto);
		
	}
	
	/** 댓글 페이징 */
	@GetMapping(value="/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ReplyPageDTO replyListPOST(Criteria cri) {
		
		return replyService.replyList(cri);
		
	}
}
