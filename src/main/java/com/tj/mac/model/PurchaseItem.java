package com.tj.mac.model;

public class PurchaseItem {
	private int purchaseitemNo; // 매점구매상품코드
	private int itemNo;			// 상품코드
	private int purchaseNo;		// 구매내역번호
	public int getPurchaseitemNo() {
		return purchaseitemNo;
	}
	public void setPurchaseitemNo(int purchaseitemNo) {
		this.purchaseitemNo = purchaseitemNo;
	}
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	public int getPurchaseNo() {
		return purchaseNo;
	}
	public void setPurchaseNo(int purchaseNo) {
		this.purchaseNo = purchaseNo;
	}
	@Override
	public String toString() {
		return "PurchaseItem [purchaseitemNo=" + purchaseitemNo + ", itemNo=" + itemNo + ", purchaseNo=" + purchaseNo
				+ "]";
	}
	
}
