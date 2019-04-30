package com.tj.mac.model;

public class Time {
	private String timeNo;
	private String timeSet;
	public String getTimeNo() {
		return timeNo;
	}
	public void setTimeNo(String timeNo) {
		this.timeNo = timeNo;
	}
	public String getTimeSet() {
		return timeSet;
	}
	public void setTimeSet(String timeSet) {
		this.timeSet = timeSet;
	}
	@Override
	public String toString() {
		return "Time [timeNo=" + timeNo + ", timeSet=" + timeSet + "]";
	}
}
