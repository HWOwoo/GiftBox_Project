package edu.hi.service;

import java.util.List;

import edu.hi.model.CateFilterDTO;
import edu.hi.model.Criteria;
import edu.hi.model.GiftVO;

public interface GiftService {

	/** 상품 검색 */
	public List<GiftVO> getGoodsList(Criteria cri);
	
	/** 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri);
	
	/** 국내 카테고리 리스트 */
	public List<GiftVO> getCateCode1();
	
	/** 외국 카테고리 리스트 */
	public List<GiftVO> getCateCode2();
	
	/** 검색결과 카테고리 필터 정보 */
	public List<CateFilterDTO> getCateInfoList(Criteria cri);
	
	/** 상품 정보 */
	public GiftVO getGoodsInfo(int giftId);
	
	/** 상품 id 이름 */
	public GiftVO getGiftIdName(int giftId);
	
}
