package edu.hi.model;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GiftVO {

	/** 상품 id */
	private int giftId;
	
	/** 상품 이름 */
	private String giftName;
	
	/** 작가 id */
	private int shopId;
	
	/** 작가 이름 */
	private String shopName;
	
	/** 출판일 */
	private String publeYear;
	
	/** 출판사 */
	private String publisher;
	
	/** 카테고리 코드 */
	private String cateCode;
	
	/** 카테고리 이름 */
	private String cateName;
	
	/** 상품 가격 */
	private int giftPrice;
	
	/** 상품 재고 */
	private int giftStock;
	
	/** 상품 할인률(백분율) */
	private double giftDiscount;
	
	/** 상품 소개 */
	private String giftIntro;
	
	/** 상품 목차 */
	private String giftContents;
	
	/** 등록 날짜 */
	private Date regDate;
	
	/** 수정 날짜 */
	private Date updateDate;
	
	/** 이미지 정보 */
	private List<AttachImageVO> imageList;
	
}
