package edu.hi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.model.AttachImageVO;
import edu.hi.model.CateVO;
import edu.hi.model.Criteria;
import edu.hi.model.GiftVO;

@Mapper
public interface AdminMapper {
	
	/** 상품 등록 */
	public void giftEnroll(GiftVO gift);

	/** 카테고리 리스트 */
	public List<CateVO> cateList();
	
	/** 상품 리스트 */
	public List<GiftVO> goodsGetList(Criteria cri);
	
	/** 상품 총 개수 */
	public int goodsGetTotal(Criteria cri);
	
	/** 상품 조회 페이지 */
	public GiftVO goodsGetDetail(int giftId);
	
	/** 상품 수정 */
	public int goodsModify(GiftVO vo);
	
	/** 상품 정보 삭제 */
	public int goodsDelete(int giftId);
	
	/** 이미지 등록 */
	public void imageEnroll(AttachImageVO vo);
	
	/** 지정 상품 이미지 전체 삭제 */
	public void deleteImageAll(int giftId);
	
}
