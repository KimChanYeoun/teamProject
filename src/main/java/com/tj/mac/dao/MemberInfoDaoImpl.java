package com.tj.mac.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.MemberInfo;
@Repository
public class MemberInfoDaoImpl implements MemberInfoDao {
	@Autowired
	private SqlSession sessionTemplate;

	@Override
	public List<MemberInfo> myItem(String memberId) {
		return sessionTemplate.selectList("myItem", memberId);
	}

	@Override
	public List<MemberInfo> myMovie(String memberId) {
		return sessionTemplate.selectList("myMovie", memberId);
	}

	@Override
	public List<MemberInfo> myMovieSeat(int bookingNo) {
		return sessionTemplate.selectList("myMovieSeat", bookingNo);
	}

	@Override
	public List<MemberInfo> myQnA(String memberId) {
		return sessionTemplate.selectList("myQnA", memberId);
	}

	@Override
	public List<MemberInfo> myQnAList(MemberInfo memberInfo) {
		return sessionTemplate.selectList("myQnAList", memberInfo);
	}

	@Override
	public int myQnACnt(String memberId) {
		return sessionTemplate.selectOne("myQnACnt", memberId);
	}

	@Override
	public List<MemberInfo> myMovieList(MemberInfo memberInfo) {
		return sessionTemplate.selectList("myMovieList", memberInfo);
	}

	@Override
	public int myMovieCnt(String memberId) {
		return sessionTemplate.selectOne("myMovieCnt", memberId);
	}

	@Override
	public List<MemberInfo> myItemList(MemberInfo memberInfo) {
		return sessionTemplate.selectList("myItemList", memberInfo);
	}

	@Override
	public int myItemCnt(String memberId) {
		return sessionTemplate.selectOne("myItemCnt", memberId);
	}

	@Override
	public List<MemberInfo> myItemPurchase(int purchaseNo) {
		return sessionTemplate.selectList("myItemPurchase", purchaseNo);
	}

}
