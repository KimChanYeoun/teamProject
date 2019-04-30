package com.tj.mac.model;

import java.sql.Date;

public class Purchase {
	private int purchaseNo;		// 구매내역번호
	private String memberId;	// 아이디
	private int purchasePrice;	// 총번호
	private Date purchaseDate;	// 구매날짜
	public int getPurchaseNo() {
		return purchaseNo;
	}
	public void setPurchaseNo(int purchaseNo) {
		this.purchaseNo = purchaseNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getPurchasePrice() {
		return purchasePrice;
	}
	public void setPurchasePrice(int purchasePrice) {
		this.purchasePrice = purchasePrice;
	}
	public Date getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	@Override
	public String toString() {
		return "Purchase [purchaseNo=" + purchaseNo + ", memberId=" + memberId + ", purchasePrice=" + purchasePrice
				+ ", purchaseDate=" + purchaseDate + "]";
	}
	
}
