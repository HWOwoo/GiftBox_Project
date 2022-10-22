package edu.hi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hi.mapper.ReplyMapper;
import edu.hi.model.Criteria;
import edu.hi.model.PageDTO;
import edu.hi.model.ReplyDTO;
import edu.hi.model.ReplyPageDTO;
import edu.hi.model.UpdateReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper replyMapper;
	
	/** 댓글등록 */
	@Override
	public int enrollReply(ReplyDTO dto) {
		
		int result = replyMapper.enrollReply(dto);
		
		setRating(dto.getGiftId());
		
		return result;
	}
	
	@Override
	public String checkReply(ReplyDTO dto) {

		Integer result = replyMapper.checkReply(dto);
		
		if(result == null) {
			return "0";
		} else {
			return "1";
		}
		
	}
	
	@Override
	public ReplyPageDTO replyList(Criteria cri) {
		ReplyPageDTO dto = new ReplyPageDTO();
		
		dto.setList(replyMapper.getReplyList(cri));
		dto.setPageInfo(new PageDTO(cri, replyMapper.getReplyTotal(cri.getGiftId())));
		
		return dto;
	}
	
	@Override
	public int deleteReply(ReplyDTO dto) {
		
		int result = replyMapper.deleteReply(dto.getReplyId()); 
		
		setRating(dto.getGiftId());
		
		return result;
	}
	
	public void setRating(int giftId) {
		
		Double ratingAvg = replyMapper.getRatingAverage(giftId);	
		
		if(ratingAvg == null) {
			ratingAvg = 0.0;
		}	
		
		ratingAvg = (double) (Math.round(ratingAvg*10));
		ratingAvg = ratingAvg / 10;
		
		UpdateReplyDTO urd = new UpdateReplyDTO();
		urd.setGiftId(giftId);
		urd.setRatingAvg(ratingAvg);	
		
		replyMapper.updateRating(urd);	
		
	}

}
