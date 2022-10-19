package edu.hi.service;

import java.util.List;

import edu.hi.model.AttachImageVO;
import edu.hi.model.CateVO;
import edu.hi.model.Criteria;
import edu.hi.model.GiftVO;
import edu.hi.model.OrderDTO;

public interface AdminService {

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
	
	/** 지정 상품 이미지 정보 얻기 */
	public List<AttachImageVO> getAttachInfo(int giftId);
	
	/** 주문 상품 리스트 */
	public List<OrderDTO> getOrderList(Criteria cri);
	
	/** 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);
	
}
