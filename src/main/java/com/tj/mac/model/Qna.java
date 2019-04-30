package com.tj.mac.model;

import java.sql.Date;

public class Qna {
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private	String qnaFile;
	private	int qnaHit;
	private	Date qnaDate;
	private	String qnaIp;
	private	String qnanoPw;
	private	int qnaGroup;
	private	int qnaStep;
	private	int qnaIndent;
	private	String memberId;
	private	String adminId;
	private String memberName;
	private int startRow;
	private int endRow;
	private String qna_Serch;
	
	
	
	public String getQna_Serch() {
		return qna_Serch;
	}
	public void setQna_Serch(String qna_Serch) {
		this.qna_Serch = qna_Serch;
	}
	public String getQnanoPw() {
		return qnanoPw;
	}
	public void setQnanoPw(String qnanoPw) {
		this.qnanoPw = qnanoPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
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
	public String getQnaIp() {
		return qnaIp;
	}
	public void setQnaIp(String qnaIp) {
		this.qnaIp = qnaIp;
	}
	public String getQnaNopw() {
		return qnanoPw;
	}
	public void setQnaNopw(String qnaNopw) {
		this.qnanoPw = qnaNopw;
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
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaFile=" + qnaFile
				+ ", qnaHit=" + qnaHit + ", qnaDate=" + qnaDate + ", qnaIp=" + qnaIp + ", qnanoPw=" + qnanoPw
				+ ", qnaGroup=" + qnaGroup + ", qnaStep=" + qnaStep + ", qnaIndent=" + qnaIndent + ", memberId="
				+ memberId + ", adminId=" + adminId + ", memberName=" + memberName + ", startRow=" + startRow
				+ ", endRow=" + endRow + ", qna_Serch=" + qna_Serch + "]";
	}
	
	
	
}
