package com.tj.mac.model;

import java.sql.Date;

public class SeatState {
	private int seatStateNo;
	private String seatNo;
	private String timeNo;
	private String screenNo;
	private Date seatStateDate;
	public int getSeatStateNo() {
		return seatStateNo;
	}
	public void setSeatStateNo(int seatStateNo) {
		this.seatStateNo = seatStateNo;
	}
	public String getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}
	public String getTimeNo() {
		return timeNo;
	}
	public void setTimeNo(String timeNo) {
		this.timeNo = timeNo;
	}
	public String getScreenNo() {
		return screenNo;
	}
	public void setScreenNo(String screenNo) {
		this.screenNo = screenNo;
	}
	public Date getSeatStateDate() {
		return seatStateDate;
	}
	public void setSeatStateDate(Date seatStateDate) {
		this.seatStateDate = seatStateDate;
	}
	@Override
	public String toString() {
		return "SeatState [seatStateNo=" + seatStateNo + ", seatNo=" + seatNo + ", timeNo=" + timeNo + ", screenNo="
				+ screenNo + ", seatStateDate=" + seatStateDate + "]";
	}
}
