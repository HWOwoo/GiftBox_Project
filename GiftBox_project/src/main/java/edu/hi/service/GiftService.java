package edu.hi.service;

import java.util.List;

import edu.hi.model.Criteria;
import edu.hi.model.GiftVO;

public interface GiftService {

	/** 상품 검색 */
	public List<GiftVO> getGoodsList(Criteria cri);
	
	/** 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri);
	
}
