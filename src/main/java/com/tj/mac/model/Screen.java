package com.tj.mac.model;

public class Screen {
	private String screenNo;
	private String screenName;
	private String cinemaNo;
	public String getScreenNo() {
		return screenNo;
	}
	public void setScreenNo(String screenNo) {
		this.screenNo = screenNo;
	}
	public String getScreenName() {
		return screenName;
	}
	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}
	public String getCinemaNo() {
		return cinemaNo;
	}
	public void setCinemaNo(String cinemaNo) {
		this.cinemaNo = cinemaNo;
	}
	@Override
	public String toString() {
		return "Screen [screenNo=" + screenNo + ", screenName=" + screenName + ", cinemaNo=" + cinemaNo + "]";
	}
}
