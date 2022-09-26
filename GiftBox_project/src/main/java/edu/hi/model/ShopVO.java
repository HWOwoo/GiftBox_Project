package edu.hi.model;

import java.util.Date;

public class ShopVO {
	
    /** 가게 아이디 */
    private int shopId;
    
    /** 가게 이름 */
    private String shopName;
    
    /** 소속 id */
    private String nationId;
    
    /** 가게 소속 */
    private String nationName;
    
    /** 가게 소개 */
    private String shopIntro;
    
    /** 등록 날짜*/
    private Date regDate;
    
    /** 수정 날짜 */
    private Date updateDate;

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getNationId() {
		return nationId;
	}

	public void setNationId(String nationId) {
		this.nationId = nationId;
        if(nationId.equals("01")) {
            this.nationName = "본사";
        } else {
            this.nationName = "외주";
        }
	}

	public String getNationName() {
		return nationName;
	}

	public void setNationName(String nationName) {
		this.nationName = nationName;
	}

	public String getShopIntro() {
		return shopIntro;
	}

	public void setShopIntro(String shopIntro) {
		this.shopIntro = shopIntro;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "ShopVO [shopId=" + shopId + ", shopName=" + shopName + ", nationId=" + nationId + ", nationName="
				+ nationName + ", shopIntro=" + shopIntro + ", regDate=" + regDate + ", updateDate=" + updateDate + "]";
	}

    
    
}
