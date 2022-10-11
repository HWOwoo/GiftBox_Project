package edu.hi.service;

import java.util.List;

import edu.hi.model.AttachImageVO;

public interface AttachService {

	/** 이미지 데이터 반환 */
	public List<AttachImageVO> getAttachList(int giftId);
	
}
