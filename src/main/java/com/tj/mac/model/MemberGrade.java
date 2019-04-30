package com.tj.mac.model;

public class MemberGrade {
	private String memberGradeNo;
	private String memberGradeName;

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

	@Override
	public String toString() {
		return "MemberGrade [memberGradeNo=" + memberGradeNo + ", memberGradeName=" + memberGradeName + "]";
	}

}