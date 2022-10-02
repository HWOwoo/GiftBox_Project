package edu.hi.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hi.mapper.AdminMapper;
import edu.hi.model.CateVO;
import edu.hi.model.Criteria;
import edu.hi.model.GiftVO;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger log = LoggerFactory.getLogger(ShopServiceImpl.class);
	
	@Autowired
	private AdminMapper adminMapper;	
	
	/** 상품 등록 */
	@Override
	public void giftEnroll(GiftVO gift) {
		
		log.info("(srevice)giftEnroll........");
		
		adminMapper.giftEnroll(gift);
		
	}
	
	/** 카테고리 리스트 */
	@Override
	public List<CateVO> cateList() {
		
		log.info("(service)cateList........");
		
		return adminMapper.cateList();
	}
	
	/** 상품 리스트 */
	@Override
	public List<GiftVO> goodsGetList(Criteria cri) {
		log.info("goodsGetTotalList()..........");
		return adminMapper.goodsGetList(cri);
	}

	/** 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri) {
		log.info("goodsGetTotal().........");
		return adminMapper.goodsGetTotal(cri);
	}	
	
	/** 상품 조회 페이지 */
	@Override
	public GiftVO goodsGetDetail(int giftId) {
		
		log.info("(service)bookGetDetail......." + giftId);
		
		return adminMapper.goodsGetDetail(giftId);
	}
	
	/** 상품 정보 수정 */
	@Override
	public int goodsModify(GiftVO vo) {
		
		log.info("goodsModify........");
		
		return adminMapper.goodsModify(vo);
		
	}
	
	/** 상품 정보 삭제 */
	@Override
	public int goodsDelete(int giftId) {

		log.info("goodsDelete..........");
		
		return adminMapper.goodsDelete(giftId);
	}	
	
}
