package com.tj.mac.service;


import java.util.List;

import javax.servlet.http.HttpSession;

import com.tj.mac.model.Member;


public interface MemberService {
	
	public int memberIdConfirm(String memberId);

	public int joinMember(Member member);

	public Member getMember(String memberId);
	
	public Member getMemberName(String memberName);
	
	public Member callLogin(String memberPhone);

	public int modifyMember(Member member);
	
	public int memberStop(String memberId);
	
	public int memberStart(String memberId);
	
	public List<Member> memberList(Member member);
	
	public String searchMemberId(String tel1, String tel2, String tel3, HttpSession httpSession);
	
	public String searchMemberPw(String memberId, String tel1, String tel2, String tel3, HttpSession httpSession);

	public String loginCheck(String memberId, String memberPw, HttpSession httpSession);
	
	public String callLoginCheck(String tel1, String tel2, String tel3, HttpSession httpSession);

	public int memberTotal();
	
	public int cntMember(Member member);
	
}
