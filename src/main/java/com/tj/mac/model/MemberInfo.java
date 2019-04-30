package com.tj.mac.model;

import java.sql.Date;

public class MemberInfo {
	private String memberId;
	private int itemNo;			// 상품코드
	private String itemName;	// 상품명
	private String itemImage;	// 상품이미지
	private int itemPrice;
	private int purchaseNo;
	private int purchasePrice;
	private Date purchaseDate;
	private int purchaseItemNo;
	private int purchaseItemAmount;
	private int bookingNo;
	private int screenupNo;
	private String movieName;
	private String movieImage;
	private String timeNo;
	private Date bookingDate;
	private int bookingCount;
	private int bookingPrice;
	private String seatNo;
	private int bookingSeatNo;
	private int startRow;
	private int endRow;
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaFile;
	private int qnaHit;
	private Date qnaDate;
	private String qnanoPw;
	private int qnaGroup;
	private int qnaStep;
	private int qnaIndent;
	private String adminId;
	private String memberName;

	public String getMovieImage() {
		return movieImage;
	}

	public void setMovieImage(String movieImage) {
		this.movieImage = movieImage;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaFile() {
		return qnaFile;
	}

	public void setQnaFile(String qnaFile) {
		this.qnaFile = qnaFile;
	}

	public int getQnaHit() {
		return qnaHit;
	}

	public void setQnaHit(int qnaHit) {
		this.qnaHit = qnaHit;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public String getQnanoPw() {
		return qnanoPw;
	}

	public void setQnanoPw(String qnanoPw) {
		this.qnanoPw = qnanoPw;
	}

	public int getQnaGroup() {
		return qnaGroup;
	}

	public void setQnaGroup(int qnaGroup) {
		this.qnaGroup = qnaGroup;
	}

	public int getQnaStep() {
		return qnaStep;
	}

	public void setQnaStep(int qnaStep) {
		this.qnaStep = qnaStep;
	}

	public int getQnaIndent() {
		return qnaIndent;
	}

	public void setQnaIndent(int qnaIndent) {
		this.qnaIndent = qnaIndent;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

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

	public int getPurchaseNo() {
		return purchaseNo;
	}

	public void setPurchaseNo(int purchaseNo) {
		this.purchaseNo = purchaseNo;
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

	public int getPurchaseItemNo() {
		return purchaseItemNo;
	}

	public void setPurchaseItemNo(int purchaseItemNo) {
		this.purchaseItemNo = purchaseItemNo;
	}

	public int getPurchaseItemAmount() {
		return purchaseItemAmount;
	}

	public void setPurchaseItemAmount(int purchaseItemAmount) {
		this.purchaseItemAmount = purchaseItemAmount;
	}

	public int getBookingNo() {
		return bookingNo;
	}

	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
	}

	public int getScreenupNo() {
		return screenupNo;
	}

	public void setScreenupNo(int screenupNo) {
		this.screenupNo = screenupNo;
	}

	public String getTimeNo() {
		return timeNo;
	}

	public void setTimeNo(String timeNo) {
		this.timeNo = timeNo;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public int getBookingCount() {
		return bookingCount;
	}

	public void setBookingCount(int bookingCount) {
		this.bookingCount = bookingCount;
	}

	public int getBookingPrice() {
		return bookingPrice;
	}

	public void setBookingPrice(int bookingPrice) {
		this.bookingPrice = bookingPrice;
	}

	public String getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}

	public int getBookingSeatNo() {
		return bookingSeatNo;
	}

	public void setBookingSeatNo(int bookingSeatNo) {
		this.bookingSeatNo = bookingSeatNo;
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
		return "MemberInfo [memberId=" + memberId + ", itemNo=" + itemNo + ", itemName=" + itemName + ", itemImage="
				+ itemImage + ", itemPrice=" + itemPrice + ", purchaseNo=" + purchaseNo + ", purchasePrice="
				+ purchasePrice + ", purchaseDate=" + purchaseDate + ", purchaseItemNo=" + purchaseItemNo
				+ ", purchaseItemAmount=" + purchaseItemAmount + ", bookingNo=" + bookingNo + ", screenupNo="
				+ screenupNo + ", movieName=" + movieName + ", movieImage=" + movieImage + ", timeNo=" + timeNo
				+ ", bookingDate=" + bookingDate + ", bookingCount=" + bookingCount + ", bookingPrice=" + bookingPrice
				+ ", seatNo=" + seatNo + ", bookingSeatNo=" + bookingSeatNo + ", startRow=" + startRow + ", endRow="
				+ endRow + ", qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaFile="
				+ qnaFile + ", qnaHit=" + qnaHit + ", qnaDate=" + qnaDate + ", qnanoPw=" + qnanoPw + ", qnaGroup="
				+ qnaGroup + ", qnaStep=" + qnaStep + ", qnaIndent=" + qnaIndent + ", adminId=" + adminId
				+ ", memberName=" + memberName + "]";
	}

}