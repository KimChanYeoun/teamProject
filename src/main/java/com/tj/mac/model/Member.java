package com.tj.mac.model;

import java.sql.Date;

public class Member {
	private String memberGradeNo;
	private String memberGradeName;
	private String memberId;
	private String memberPw;
	private String memberName;
	private Date memberBirth;
	private String memberPhone;
	private String memberEmail;
	private String memberAddress;
	private String memberPost;
	private int memberPoint;
	private int memberAmount;
	private int memberState;
	private int startRow;
	private int endRow;
	private String schItem; 
	private String schWord; 

	public String getSchItem() {
		return schItem;
	}

	public void setSchItem(String schItem) {
		this.schItem = schItem;
	}

	public String getSchWord() {
		return schWord;
	}

	public void setSchWord(String schWord) {
		this.schWord = schWord;
	}

	public String getMemberGradeNo() {
		return memberGradeNo;
	}

	public void setMemberGradeNo(String memberGradeNo) {
		this.memberGradeNo = memberGradeNo;
	}

	public String getMemberGradeName() {
		return memberGradeName;
	}

	public void setMemberGradeName(String memberGradeName) {
		this.memberGradeName = memberGradeName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Date getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(Date memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberPost() {
		return memberPost;
	}

	public void setMemberPost(String memberPost) {
		this.memberPost = memberPost;
	}

	public int getMemberPoint() {
		return memberPoint;
	}

	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}

	public int getMemberAmount() {
		return memberAmount;
	}

	public void setMemberAmount(int memberAmount) {
		this.memberAmount = memberAmount;
	}

	public int getMemberState() {
		return memberState;
	}

	public void setMemberState(int memberState) {
		this.memberState = memberState;
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
		return "Member [memberGradeNo=" + memberGradeNo + ", memberGradeName=" + memberGradeName + ", memberId="
				+ memberId + ", memberPw=" + memberPw + ", memberName=" + memberName + ", memberBirth=" + memberBirth
				+ ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail + ", memberAddress=" + memberAddress
				+ ", memberPost=" + memberPost + ", memberPoint=" + memberPoint + ", memberAmount=" + memberAmount
				+ ", memberState=" + memberState + ", startRow=" + startRow + ", endRow=" + endRow + ", schItem="
				+ schItem + ", schWord=" + schWord + "]";
	}

}