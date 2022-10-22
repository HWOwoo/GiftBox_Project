package edu.hi.model;

public class UpdateReplyDTO {
	
	private int	giftId;
	
	private double ratingAvg;

	public int getGiftId() {
		return giftId;
	}

	public void setGiftId(int giftId) {
		this.giftId = giftId;
	}

	public double getRatingAvg() {
		return ratingAvg;
	}

	public void setRatingAvg(double ratingAvg) {
		this.ratingAvg = ratingAvg;
	}

	@Override
	public String toString() {
		return "UpdateReplyDTO [giftId=" + giftId + ", ratingAvg=" + ratingAvg + "]";
	}
	
	

}
