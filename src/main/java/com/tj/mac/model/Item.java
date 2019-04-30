package com.tj.mac.model;

public class Item {
	/*
	 *  ItemNo NUMBER(10) PRIMARY KEY,
	 *  ItemName VARCHAR2(20) NOT NULL,
	 *  ItemImage VARCHAR2(200) NOT NULL,
	 *   ItemPrice NUMBER(6) NOT NULL);
	 */
	private int itemNo;			// 상품코드
	private String itemName;	// 상품명
	private String itemImage;	// 상품이미지
	private int itemPrice;		// 가격
	private int getItem;     	// 불러올 아이템
	private int startRow;
	private int endRow;
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemImage() {
		return itemImage;
	}
	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getGetItem() {
		return getItem;
	}
	public void setGetItem(int getItem) {
		this.getItem = getItem;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	@Override
	public String toString() {
		return "Item [itemNo=" + itemNo + ", itemName=" + itemName + ", itemImage=" + itemImage + ", itemPrice="
				+ itemPrice + ", getItem=" + getItem + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
	
}
