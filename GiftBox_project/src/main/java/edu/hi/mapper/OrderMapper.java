package edu.hi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.hi.model.GiftVO;
import edu.hi.model.MemberVO;
import edu.hi.model.OrderDTO;
import edu.hi.model.OrderItemDTO;
import edu.hi.model.OrderPageItemDTO;

@Mapper
public interface OrderMapper {
	
	/** 주문 상품 정보 */	
	public OrderPageItemDTO getGoodsInfo(int giftId);
	
	/** 주문 상품 정보(주문 처리) */	
	public OrderItemDTO getOrderInfo(int giftId);
	
	/** 주문 테이블 등록 */
	public int enrollOrder(OrderDTO ord);
	
	/** 주문 아이템 테이블 등록 */
	public int enrollOrderItem(OrderItemDTO orid);
	
	/** 주문 금액 차감 */
	public int deductMoney(MemberVO member);
	
	/** 주문 재고 차감 */
	public int deductStock(GiftVO gift);
	
	/** 주문 취소 */
	public int orderCancle(String orderId);
	
	/** 주문 상품 정보(주문취소) */
	public List<OrderItemDTO> getOrderItemInfo(String orderId);
	
	/** 주문 정보(주문취소) */
	public OrderDTO getOrder(String orderId);
	
}
