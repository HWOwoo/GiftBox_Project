package edu.hi.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.hi.mapper.AdminMapper;
import edu.hi.model.AttachImageVO;
import edu.hi.model.CateVO;
import edu.hi.model.Criteria;
import edu.hi.model.GiftVO;
import edu.hi.model.OrderDTO;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger log = LoggerFactory.getLogger(ShopServiceImpl.class);
	
	@Autowired
	private AdminMapper adminMapper;	
	
	/** 상품 등록 */
	@Transactional
	@Override
	public void giftEnroll(GiftVO gift) {
		
		log.info("(srevice)giftEnroll........");
		
		adminMapper.giftEnroll(gift);
		
		if(gift.getImageList() == null || gift.getImageList().size() <= 0) {
			return;
		}
		
		gift.getImageList().forEach(attach ->{
			
			attach.setGiftId(gift.getGiftId());
			adminMapper.imageEnroll(attach);
			
		});
		
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
	@Transactional
	@Override
	public int goodsModify(GiftVO vo) {
		
		int result = adminMapper.goodsModify(vo);
		
		if(result == 1 && vo.getImageList() != null && vo.getImageList().size() > 0) {
			
			adminMapper.deleteImageAll(vo.getGiftId());
			
			vo.getImageList().forEach(attach -> {
				
				attach.setGiftId(vo.getGiftId());
				adminMapper.imageEnroll(attach);
				
			});
			
		}
		
		return result;
		
	}
	
	/** 상품 정보 삭제 */
	@Override
	public int goodsDelete(int giftId) {

		log.info("goodsDelete..........");
		
		return adminMapper.goodsDelete(giftId);
	}	
	
	/** 지정 상품 이미지 정보 얻기 */
	@Override
	public List<AttachImageVO> getAttachInfo(int giftId) {
		
		log.info("getAttachInfo........");
		
		return adminMapper.getAttachInfo(giftId);
	}
	
	/** 주문 상품 리스트 */
	@Override
	public List<OrderDTO> getOrderList(Criteria cri) {
		return adminMapper.getOrderList(cri);
	}
	
	/** 주문 총 갯수 */
	@Override
	public int getOrderTotal(Criteria cri) {
		return adminMapper.getOrderTotal(cri);
	}
	
}
