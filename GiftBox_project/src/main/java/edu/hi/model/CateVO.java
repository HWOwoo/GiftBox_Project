package edu.hi.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CateVO {
	
	/** 카테고리 등급 */
	private int tier;
	
	/** 카테고리 이름 */
	private String cateName;
	
	/** 카테고리 넘버 */
	private String cateCode;
	
	/** 상위 카테고리 */
	private String cateParent;

}
