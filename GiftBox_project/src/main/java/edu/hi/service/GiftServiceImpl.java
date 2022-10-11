package edu.hi.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hi.mapper.AttachMapper;
import edu.hi.mapper.GiftMapper;
import edu.hi.model.AttachImageVO;
import edu.hi.model.Criteria;
import edu.hi.model.GiftVO;

@Service
public class GiftServiceImpl implements GiftService {
	
	private static final Logger log = LoggerFactory.getLogger(GiftServiceImpl.class);
	
	@Autowired
	private GiftMapper giftMapper;
	
	@Autowired
	private AttachMapper attachMapper;

	/** 상품 검색 */
	@Override
	public List<GiftVO> getGoodsList(Criteria cri) {
		
		log.info("getGoodsList().......");
		
		String type = cri.getType();
		String[] typeArr = type.split("");
		String[] shopArr = giftMapper.getShopIdList(cri.getKeyword());
		
		
		if(type.equals("A") || type.equals("AC") || type.equals("AT") || type.equals("ACT")) {
			if(shopArr.length == 0) {
				return new ArrayList();
			}
		}
		
		for(String t : typeArr) {
			if(t.equals("A")) {
				cri.setShopArr(shopArr);
			}
		}
		
		List<GiftVO> list = giftMapper.getGoodsList(cri);
		
		list.forEach(book -> {
			
			int giftId = book.getGiftId();
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(giftId);
			
			book.setImageList(imageList);
			
		});
		
		return list;
	}

	/** 사품 총 갯수 */
	@Override
	public int goodsGetTotal(Criteria cri) {
		
		log.info("goodsGetTotal().......");
		
		return giftMapper.goodsGetTotal(cri);
		
	}
	
}
