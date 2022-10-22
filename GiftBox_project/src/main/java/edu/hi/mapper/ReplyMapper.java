package edu.hi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.model.Criteria;
import edu.hi.model.ReplyDTO;
import edu.hi.model.UpdateReplyDTO;

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
	
	/** 댓글 삭제 */
	public int deleteReply(int replyId);
	
	/** 평점 평균 구하기 */
	public Double getRatingAverage(int giftId);
	
	/** 평점 평균 반영하기 */
	public int updateRating(UpdateReplyDTO dto);
	
}
