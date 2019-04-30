package com.tj.mac.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.dao.MemberInfoDao;
import com.tj.mac.model.MemberInfo;
@Repository
public class MemberInfoServiceImpl implements MemberInfoService {
	@Autowired
	private MemberInfoDao memberInfoDao;

	@Override
	public List<MemberInfo> myItem(String memberId) {
		return memberInfoDao.myItem(memberId);
	}

	@Override
	public List<MemberInfo> myMovie(String memberId) {
		return memberInfoDao.myMovie(memberId);
	}

	@Override
	public List<MemberInfo> myMovieSeat(int bookingNo) {
		return memberInfoDao.myMovieSeat(bookingNo);
	}

	@Override
	public List<MemberInfo> myQnA(String memberId) {
		return memberInfoDao.myQnA(memberId);
	}

	@Override
	public List<MemberInfo> myQnAList(MemberInfo memberInfo) {
		return memberInfoDao.myQnAList(memberInfo);
	}

	@Override
	public int myQnACnt(String memberId) {
		return memberInfoDao.myQnACnt(memberId);
	}

	@Override
	public List<MemberInfo> myMovieList(MemberInfo memberInfo) {
		return memberInfoDao.myMovieList(memberInfo);
	}

	@Override
	public int myMovieCnt(String memberId) {
		return memberInfoDao.myMovieCnt(memberId);
	}

	@Override
	public List<MemberInfo> myItemList(MemberInfo memberInfo) {
		return memberInfoDao.myItemList(memberInfo);
	}

	@Override
	public int myItemCnt(String memberId) {
		return memberInfoDao.myItemCnt(memberId);
	}

	@Override
	public List<MemberInfo> myItemPurchase(int purchaseNo) {
		return memberInfoDao.myItemPurchase(purchaseNo);
	}

}
