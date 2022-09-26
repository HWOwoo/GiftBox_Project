package edu.hi.mapper;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.model.GiftVO;

@Mapper
public interface AdminMapper {
	
	/** 상품 등록 */
	public void giftEnroll(GiftVO gift);

}
