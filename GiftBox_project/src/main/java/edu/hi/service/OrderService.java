package edu.hi.service;

import java.util.List;

import edu.hi.model.OrderCancelDTO;
import edu.hi.model.OrderDTO;
import edu.hi.model.OrderPageItemDTO;

public interface OrderService {

	/** 주문 정보 */
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders);
	
	/** 주문 */
	public void order(OrderDTO ord);
	
	/** 주문 취소 */
	public void orderCancle(OrderCancelDTO dto);
	
}
