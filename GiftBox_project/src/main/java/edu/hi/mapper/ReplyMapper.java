package edu.hi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.model.Criteria;
import edu.hi.model.ReplyDTO;

@Mapper
public interface ReplyMapper {

	/** 댓글 등록 */
	public int enrollReply(ReplyDTO dto);
	
	/** 댓글 존재 체크 */
	public Integer checkReply(ReplyDTO dto);
	
	/** 댓글 페이징 */
	public List<ReplyDTO> getReplyList(Criteria cri);
	
	/** 댓글 총 갯수(페이징) */
	public int getReplyTotal(int giftId);
	
}
