package edu.hi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.model.Criteria;
import edu.hi.model.ShopVO;

@Mapper
public interface ShopMapper {
	
    /** 가게 등록 */
    public void shopEnroll(ShopVO shop);
    
    /** 가게 목록 */
    public List<ShopVO> shopGetList(Criteria cri);
    
    /** 가게 총 수 */
    public int shopGetTotal(Criteria cri);

    /** 가게 상세 페이지 */
	public ShopVO shopGetDetail(int shopId);   
	
	/** 가게 정보 수정 */
	public int shopModify(ShopVO shop);	
    
}
