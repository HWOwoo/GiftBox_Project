package edu.hi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.model.CartDTO;

@Mapper
public interface CartMapper {
	
	/** 장바구니 추가 */
	public int addCart(CartDTO cart) throws Exception;
	
	/** 장바구니 삭제 */
	public int deleteCart(int cartId);
	
	/** 장바구니 수량 수정 */
	public int modifyCount(CartDTO cart);
	
	/** 장바구니 목록 */
	public List<CartDTO> getCart(String memberId);	
	
	/** 장바구니 확인 */
	public CartDTO checkCart(CartDTO cart);
	
	/** 카트 제거(주문) */
	public int deleteOrderCart(CartDTO dto);

}
