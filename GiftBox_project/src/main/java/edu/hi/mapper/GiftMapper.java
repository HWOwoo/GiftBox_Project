package edu.hi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.model.CateFilterDTO;
import edu.hi.model.Criteria;
import edu.hi.model.GiftVO;
import edu.hi.model.SelectDTO;

@Mapper
public interface GiftMapper {

	/** 상품 검색 */
	public List<GiftVO> getGoodsList(Criteria cri);
	
	/** 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri);
	
	/** 가게 id 리스트 요청 */
	public String[] getShopIdList(String keyword);
	
	/** 본사 카테고리 리스트 */
	public List<GiftVO> getCateCode1();
	
	/** 외주 카테고리 리스트 */
	public List<GiftVO> getCateCode2();
	
	/** 검색 대상 카테고리 리스트 */
	public String[] getCateList(Criteria cri);
	
	/** 카테고리 정보(+검색대상 갯수) */
	public CateFilterDTO getCateInfo(Criteria cri);
	
	/** 상품 정보 */
	public GiftVO getGoodsInfo(int giftId);
	
	/** 상품 id 이름 */
	public GiftVO getGiftIdName(int giftId);
	
	/** 평점순 상품 정보 */
	public List<SelectDTO> likeSelect();
	
}
