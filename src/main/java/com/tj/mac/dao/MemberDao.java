package com.tj.mac.dao;


import java.util.List;

import com.tj.mac.model.Member;


public interface MemberDao {
	public int memberGradeUpdate(String memberId);

	public List<Member> memberList(Member member);
	
	public Member getMember(String memberId);
	
	public Member getMemberName(String memberName);
	
	public int memberIdConfirm(String memberId);

	public int joinMember(Member member);
	
	public Member callLogin(String memberPhone);

	public int modifyMember(Member member);
	
	public int memberStop(String memberId);
	
	public int memberStart(String memberId);
	
	public int memberTotal();
	
	public int cntMember(Member member);
	
}
