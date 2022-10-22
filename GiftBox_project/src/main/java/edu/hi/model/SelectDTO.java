package edu.hi.model;

import java.util.List;

public class SelectDTO {
	
	/** 상품 id */
	private int giftId;
	
	/** 상품 이름 */
	private String giftName;
	
	/** 카테고리 이름 */
	private String cateName;
	
	private double ratingAvg;	
	
	/** 상품 이미지 */
	private List<AttachImageVO> imageList;

	public int getGiftId() {
		return giftId;
	}

	public void setGiftId(int giftId) {
		this.giftId = giftId;
	}

	public String getGiftName() {
		return giftName;
	}

	public void setGiftName(String giftName) {
		this.giftName = giftName;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public double getRatingAvg() {
		return ratingAvg;
	}

	public void setRatingAvg(double ratingAvg) {
		this.ratingAvg = ratingAvg;
	}

	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}

	@Override
	public String toString() {
		return "SelectDTO [giftId=" + giftId + ", giftName=" + giftName + ", cateName=" + cateName + ", ratingAvg="
				+ ratingAvg + ", imageList=" + imageList + "]";
	}
	
	

}
