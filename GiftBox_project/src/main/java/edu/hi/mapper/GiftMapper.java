package edu.hi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.model.Criteria;
import edu.hi.model.GiftVO;

@Mapper
public interface GiftMapper {

	/** 상품 검색 */
	public List<GiftVO> getGoodsList(Criteria cri);
	
	/** 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri);
	
	/** 가게 id 리스트 요청 */
	public String[] getShopIdList(String keyword);
	
}
