package edu.hi.service;

import java.util.List;

import edu.hi.model.Criteria;
import edu.hi.model.ShopVO;

public interface ShopService {

    /** 가게 등록 */
    public void shopEnroll(ShopVO shop) throws Exception;
    
    /** 가게 목록 */
    public List<ShopVO> shopGetList(Criteria cri) throws Exception;
    
    /** 가게 총 수 */
    public int shopGetTotal(Criteria cri) throws Exception;  
    
	/** 가게 상세 페이지 */
	public ShopVO shopGetDetail(int shopId) throws Exception;
	
    /** 가게 정보 수정 */
	public int shopModify(ShopVO shop) throws Exception;
    
}
