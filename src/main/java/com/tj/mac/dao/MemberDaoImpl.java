package com.tj.mac.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSession sessionTemplate;

	@Override
	public int memberGradeUpdate(String memberId) {
		return sessionTemplate.update("memberGradeUpdate", memberId);
	}

	@Override
	public List<Member> memberList(Member member) {
		return sessionTemplate.selectList("memberList", member);
	}

	@Override
	public int memberIdConfirm(String memberId) {
		return sessionTemplate.selectOne("memberIdConfirm", memberId);
	}

	@Override
	public int joinMember(Member member) {
		return sessionTemplate.insert("joinMember", member);
	}

	@Override
	public Member getMember(String memberId) {
		return sessionTemplate.selectOne("getMember", memberId);
	}
	
	@Override
	public Member getMemberName(String memberName) {
		return sessionTemplate.selectOne("getMemberName", memberName);
	}

	@Override
	public int modifyMember(Member member) {
		return sessionTemplate.update("modifyMember", member);
	}

	@Override
	public int memberStop(String memberId) {
		return sessionTemplate.update("memberStop", memberId);
	}

	@Override
	public int memberStart(String memberId) {
		return sessionTemplate.update("memberStart", memberId);
	}

	@Override
	public Member callLogin(String memberPhone) {
		return sessionTemplate.selectOne("callLogin", memberPhone);
	}

	@Override
	public int memberTotal() {
		return sessionTemplate.selectOne("memberTotal");
	}

	@Override
	public int cntMember(Member member) {
		return sessionTemplate.selectOne("cntMember", member);
	}

}
