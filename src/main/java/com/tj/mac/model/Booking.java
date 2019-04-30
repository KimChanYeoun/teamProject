package com.tj.mac.model;

import java.sql.Date;

public class Booking {
	private int movieNo;
	private String movieName;
	private String screenName;
	private int bookingNo;
	private int screenupNo;
	private String memberId;
	private String timeNo;
	private Date bookingDate;
	private int bookingCount;
	private int bookingPrice;
	private String seatNo;
	private int usePoint;
	private int resultPrice;
	private String memberGradeNo;
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getScreenName() {
		return screenName;
	}
	public void setScreenName(String screenName) {
		this.screenName = screenName;
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
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	public int getResultPrice() {
		return resultPrice;
	}
	public void setResultPrice(int resultPrice) {
		this.resultPrice = resultPrice;
	}
	public String getMemberGradeNo() {
		return memberGradeNo;
	}
	public void setMemberGradeNo(String memberGradeNo) {
		this.memberGradeNo = memberGradeNo;
	}
	@Override
	public String toString() {
		return "Booking [movieNo=" + movieNo + ", movieName=" + movieName + ", screenName=" + screenName
				+ ", bookingNo=" + bookingNo + ", screenupNo=" + screenupNo + ", memberId=" + memberId + ", timeNo="
				+ timeNo + ", bookingDate=" + bookingDate + ", bookingCount=" + bookingCount + ", bookingPrice="
				+ bookingPrice + ", seatNo=" + seatNo + ", usePoint=" + usePoint + ", resultPrice=" + resultPrice
				+ ", memberGradeNo=" + memberGradeNo + "]";
	}
}
