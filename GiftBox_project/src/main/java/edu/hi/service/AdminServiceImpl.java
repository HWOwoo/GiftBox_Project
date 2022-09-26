package edu.hi.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hi.mapper.AdminMapper;
import edu.hi.model.GiftVO;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger log = LoggerFactory.getLogger(ShopServiceImpl.class);
	
	@Autowired
	private AdminMapper adminMapper;	
	
	/* 상품 등록 */
	@Override
	public void giftEnroll(GiftVO gift) {
		
		log.info("(srevice)giftEnroll........");
		
		adminMapper.giftEnroll(gift);
		
	}
	
}
