package edu.hi.service;

import edu.hi.model.Criteria;
import edu.hi.model.ReplyDTO;
import edu.hi.model.ReplyPageDTO;

public interface ReplyService {

	/** 댓글 등록 */
	public int enrollReply(ReplyDTO dto);
	
	/** 댓글 존재 체크 */
	public String checkReply(ReplyDTO dto);
	
	/** 댓글 페이징 */
	public ReplyPageDTO replyList(Criteria cri);
}
