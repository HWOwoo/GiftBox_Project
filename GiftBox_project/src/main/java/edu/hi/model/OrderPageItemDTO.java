package edu.hi.model;

import java.util.List;

public class OrderPageItemDTO {

	/** 뷰 전달받을 값 */
    private int giftId;
    
    private int giftCount;
    
	/** DB 꺼내올 값 */
    private String giftName;
    
    private int giftPrice;
    
    private double giftDiscount;
    
	/** 만들어 낼 값 */
    private int salePrice;
    
    private int totalPrice;
    
    private int point;
    
    private int totalPoint;
    
	/** 상품 이미지 */
	private List<AttachImageVO> imageList;
    
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

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	
	
	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}

	public void initSaleTotal() {
		this.salePrice = (int) (this.giftPrice * (1-this.giftDiscount));
		this.totalPrice = this.salePrice*this.giftCount;
		this.point = (int)(Math.floor(this.salePrice*0.05));
		this.totalPoint =this.point * this.giftCount;
	}
	
	@Override
	public String toString() {
		return "OrderPageItemDTO [giftId=" + giftId + ", giftCount=" + giftCount + ", giftName=" + giftName
				+ ", giftPrice=" + giftPrice + ", giftDiscount=" + giftDiscount + ", salePrice=" + salePrice
				+ ", totalPrice=" + totalPrice + ", point=" + point + ", totalPoint=" + totalPoint + ", imageList="
				+ imageList + "]";
	}
    
}
