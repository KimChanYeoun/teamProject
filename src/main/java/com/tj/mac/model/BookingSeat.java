package com.tj.mac.model;

public class BookingSeat {
	private int bookingSeatNo;
	private int bookingNo;
	private String seatNo;
	public int getBookingSeatNo() {
		return bookingSeatNo;
	}
	public void setBookingSeatNo(int bookingSeatNo) {
		this.bookingSeatNo = bookingSeatNo;
	}
	public int getBookingNo() {
		return bookingNo;
	}
	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
	}
	public String getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}
	@Override
	public String toString() {
		return "BookingSeat [bookingSeatNo=" + bookingSeatNo + ", bookingNo=" + bookingNo + ", seatNo=" + seatNo + "]";
	}
}
