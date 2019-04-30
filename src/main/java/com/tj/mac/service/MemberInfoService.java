package com.tj.mac.service;

import java.util.List;

import com.tj.mac.model.MemberInfo;

public interface MemberInfoService {
	public List<MemberInfo> myItem(String memberId);
	
	public List<MemberInfo> myItemList(MemberInfo memberInfo);
	
	public List<MemberInfo> myMovieList(MemberInfo memberInfo);
	
	public List<MemberInfo> myMovie(String memberId);
	
	public List<MemberInfo> myMovieSeat(int bookingNo);
	
	public List<MemberInfo> myQnA(String memberId);
	
	public List<MemberInfo> myQnAList(MemberInfo memberInfo);
	
	public int myQnACnt(String memberId);
	
	public int myMovieCnt(String memberId);
	
	public int myItemCnt(String memberId);
	
	public List<MemberInfo> myItemPurchase(int purchaseNo);
}
