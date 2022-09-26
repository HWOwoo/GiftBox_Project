package edu.hi.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hi.mapper.ShopMapper;
import edu.hi.model.Criteria;
import edu.hi.model.ShopVO;

@Service
public class ShopServiceImpl implements ShopService {
	
	private static final Logger log = LoggerFactory.getLogger(ShopServiceImpl.class);
	
	@Autowired
	ShopMapper shopMapper;
	
	/** 가게 등록 */
    @Override
    public void shopEnroll(ShopVO shop) throws Exception {
        
        shopMapper.shopEnroll(shop);
        
    }
    
    /** 가게 목록 */
    @Override
    public List<ShopVO> shopGetList(Criteria cri) throws Exception {
        
    	log.info("(service)shopGetList()....." + cri);
    	
        return shopMapper.shopGetList(cri);
    }
    
    
    /** 가게 총 수 */
    @Override
    public int shopGetTotal(Criteria cri) throws Exception {
    	
        log.info("(service)shopGetTotal()......." + cri);
        
        return shopMapper.shopGetTotal(cri);
    }
    
	/** 가게 상세 페이지 */
	@Override
	public ShopVO shopGetDetail(int shopId) throws Exception {
		
		log.info("shopGetDetail........" + shopId);
		
		return shopMapper.shopGetDetail(shopId);
		
	}
	
	/** 가게 정보 수정 */
	@Override
	public int shopModify(ShopVO shop) throws Exception {
		
		log.info("(service) shopModify........." + shop);
		
		return shopMapper.shopModify(shop);
		
	}
    
    
}
