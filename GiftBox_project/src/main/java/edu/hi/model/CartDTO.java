package edu.hi.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CartDTO {
	
	/** gift_cart 테이블 속성 */
    private int cartId;
    
    private String memberId;
    
    private int giftId;
    
    private int giftCount;
    
    /** gift_product 테이블 속성 */
    
    private String giftName;
    
    private int giftPrice;
    
    private double giftDiscount;
    
    /** 추가 */
    private int salePrice;
    
    private int totalPrice;
    
    private int point;
    
    private int totalPoint;
    
	/* 상품 이미지 */
	private List<AttachImageVO> imageList;
    
	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getGiftId() {
		return giftId;
	}

	public void setGiftId(int giftId) {
		this.giftId = giftId;
	}

	public int getGiftCount() {
		return giftCount;
	}

	public void setGiftCount(int giftCount) {
		this.giftCount = giftCount;
	}

	public String getGiftName() {
		return giftName;
	}

	public void setGiftName(String giftName) {
		this.giftName = giftName;
	}

	public int getGiftPrice() {
		return giftPrice;
	}

	public void setGiftPrice(int giftPrice) {
		this.giftPrice = giftPrice;
	}

	public double getGiftDiscount() {
		return giftDiscount;
	}

	public void setGiftDiscount(double giftDiscount) {
		this.giftDiscount = giftDiscount;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}
	
	public int getPoint() {
		return point;
	}

	public int getTotalPoint() {
		return totalPoint;
	}

	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}	

	@Override
	public String toString() {
		return "CartDTO [cartId=" + cartId + ", memberId=" + memberId + ", giftId=" + giftId + ", giftCount="
				+ giftCount + ", giftName=" + giftName + ", giftPrice=" + giftPrice + ", giftDiscount=" + giftDiscount
				+ ", salePrice=" + salePrice + ", totalPrice=" + totalPrice + ", point=" + point + ", totalPoint="
				+ totalPoint + ", imageList=" + imageList + "]";
	}

	public void initSaleTotal() {
		this.salePrice = (int) (this.giftPrice * (1-this.giftDiscount));
		this.totalPrice = this.salePrice*this.giftCount;
		this.point = (int)(Math.floor(this.salePrice*0.005));
		this.totalPoint =this.point * this.giftCount;
	}

}
