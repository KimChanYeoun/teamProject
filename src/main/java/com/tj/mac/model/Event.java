package com.tj.mac.model;

import java.sql.Date;

public class Event {
	private int eventNo;           // 이벤트 글번호
	private String eventTitle;	   // 이벤트제목
	private String eventFile;	   // 이벤트첨부사진
	private int eventReadCount;    // 이벤트조회수
	private Date eventDate;		   // 이벤트작성일
	private int countEvent;        // 이벤트글갯수
	private int startRow;
	private int endRow;
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public String getEventFile() {
		return eventFile;
	}
	public void setEventFile(String eventFile) {
		this.eventFile = eventFile;
	}
	public int getEventReadCount() {
		return eventReadCount;
	}
	public void setEventReadCount(int eventReadCount) {
		this.eventReadCount = eventReadCount;
	}
	public Date getEventDate() {
		return eventDate;
	}
	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}
	public int getCountEvent() {
		return countEvent;
	}
	public void setCountEvent(int countEvent) {
		this.countEvent = countEvent;
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
		return "Event [eventNo=" + eventNo + ", eventTitle=" + eventTitle + ", eventFile=" + eventFile
				+ ", eventReadCount=" + eventReadCount + ", eventDate=" + eventDate + ", countEvent=" + countEvent
				+ ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
	
}
