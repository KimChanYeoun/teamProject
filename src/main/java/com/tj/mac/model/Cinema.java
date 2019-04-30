package com.tj.mac.model;

public class Cinema {
	private String cinemaNo;
	private String cinemaName;
	public String getCinemaNo() {
		return cinemaNo;
	}
	public void setCinemaNo(String cinemaNo) {
		this.cinemaNo = cinemaNo;
	}
	public String getCinemaName() {
		return cinemaName;
	}
	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}
	@Override
	public String toString() {
		return "Cinema [cinemaNo=" + cinemaNo + ", cinemaName=" + cinemaName + "]";
	}
}
