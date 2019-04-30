package com.tj.mac.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tj.mac.model.Member;
import com.tj.mac.model.MemberInfo;
import com.tj.mac.service.MemberInfoService;
import com.tj.mac.service.MemberService;
import com.tj.mac.service.Paging;

@Controller
@RequestMapping("member")
// member.do?method=join&mid=aaa
public class MemberController {
	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberInfoService memberInfoService;

	@RequestMapping(params = "method=joinForm")
	public String joinForm() {
		return "member/joinForm";
	}

	@RequestMapping(params = "method=myInfo")
	public String myInfo(HttpSession httpSession, Model model) {
		String memberId = ((Member)httpSession.getAttribute("member")).getMemberId();
		model.addAttribute("member", memberService.getMember(memberId));
		model.addAttribute("myQnA", memberInfoService.myQnA(memberId));
		List<MemberInfo> myItemList = memberInfoService.myItem(memberId);
		for (int i = 0; i < myItemList.size(); i++) {
			int purchaseNo = myItemList.get(i).getPurchaseNo();
			List<MemberInfo> myItemPurchase = memberInfoService.myItemPurchase(purchaseNo);
			if(myItemPurchase.size()>1) {
				myItemList.get(i).setItemName(myItemPurchase.get(0).getItemName()+" 외 "+myItemPurchase.size()+"개");
			} else {
				myItemList.get(i).setItemName(myItemPurchase.get(0).getItemName());
			}
		}
		model.addAttribute("myItem", myItemList);
		List<MemberInfo> myMovieList = memberInfoService.myMovie(memberId);
		model.addAttribute("myMovie", myMovieList);
		ArrayList<String> mySeatList = new ArrayList<String>();
		System.out.println(myMovieList.size());
		for (int i = 0; i < myMovieList.size(); i++) {
			String mySeatStr = "";
			int bookingNo = myMovieList.get(i).getBookingNo();
			List<MemberInfo> myMovieSeat = memberInfoService.myMovieSeat(bookingNo);
			for (int j = 0; j < myMovieSeat.size(); j++) {
				if (j == (myMovieSeat.size() - 1)) {
					mySeatStr += myMovieSeat.get(j).getSeatNo();
				} else {
					mySeatStr += myMovieSeat.get(j).getSeatNo() + ", ";
				}
			}
			System.out.println("i : "+i);
			System.out.println(mySeatStr);
			mySeatList.add(mySeatStr);
		}
		model.addAttribute("mySeatList", mySeatList);
		return "member/myInfo";
	}

	@RequestMapping(params = "method=memberIdConfirm")
	public String MemberIdConfirm(String memberId, Model model) {
		int result = memberService.memberIdConfirm(memberId);
		model.addAttribute("result", result);
		return "member/idConfirm";
	}

	@RequestMapping(params = "method=join")
	public String join(Member member, Model model, HttpSession httpSession) {
		memberService.joinMember(member);
		httpSession.setAttribute("memberId", member.getMemberId());
		return "redirect:member.do?method=loginForm";
	}

	@RequestMapping(params = "method=loginForm")
	public String loginForm() {
		return "member/loginForm";
	}

	@RequestMapping(params = "method=login")
	public String login(String memberId, String memberPw, Model model, HttpSession httpSession) {
		String result = memberService.loginCheck(memberId, memberPw, httpSession);
		if (result.equals("로그인 성공")) {
			return "redirect:main.do";
		} else {
			model.addAttribute("memberId", memberId);
			model.addAttribute("memberPw", memberPw);
			model.addAttribute("result", result);
			return "forward:member.do?method=loginForm";
		}
	}

	@RequestMapping(params = "method=call")
	public String callLogin(String tel1, String tel2, String tel3, Model model, HttpSession httpSession) {
		String result = memberService.callLoginCheck(tel1, tel2, tel3, httpSession);
		if (result.equals("로그인 성공")) {
			return "redirect:main.do";
		} else {
			model.addAttribute("memberPhone", tel1 + tel2 + tel3);
			model.addAttribute("result", result);
			return "forward:member.do?method=loginForm";
		}
	}

	@RequestMapping(params = "method=logout")
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:main.do";
	}

	@RequestMapping(params = "method=modifyForm")
	public String modifyForm(Model model, HttpSession httpSession) {
		Member member = (Member) httpSession.getAttribute("member");
		model.addAttribute("modifyMember", member);
		return "member/modifyForm";
	}

	@RequestMapping(params = "method=modify")
	public String modify(Member member, Model model, HttpSession httpSession) {
		int result = memberService.modifyMember(member);
		if (result == 1) {// 수정성공
			httpSession.setAttribute("member", member);
			model.addAttribute("modifyResult", result);
			return "redirect:member.do?method=myInfo";
		} else {
			return "member.do?method=modifyForm";
		}
	}

	@RequestMapping(params = "method=memberStopForm")
	public String memberStopForm() {
		return "member/memberStopForm";
	}

	@RequestMapping(params = "method=memberStop")
	public String memberStop(String memberId, Model model, HttpSession httpSession) {
		System.out.println(memberId);
		int result = memberService.memberStop(memberId);
		if(result==1) {
			model.addAttribute("result", "탈퇴가 완료되었습니다");
		}
		httpSession.invalidate();
		return "member/loginForm";
	}

	@RequestMapping(params = "method=searchMyInfo")
	public String searchMyInfo() {
		return "member/searchMyInfo";
	}

	@RequestMapping(params = "method=searchMemberId")
	public String searchMemberId(String tel1, String tel2, String tel3, Model model, HttpSession httpSession) {
		String result = memberService.searchMemberId(tel1, tel2, tel3, httpSession);
		if (result.equals("아이디")) {
			httpSession.invalidate();
			model.addAttribute("result", "가입하신 이메일로 발송하였습니다");
			return "member/searchMyInfo";
		} else {
			model.addAttribute("memberPhone", tel1 + tel2 + tel3);
			model.addAttribute("result", result);
			return "member/searchMyInfo";
		}
	}

	@RequestMapping(params = "method=searchMemberPw")
	public String searchMemberPw(String memberId, String tel1, String tel2, String tel3, Model model,
			HttpSession httpSession) {
		String result = memberService.searchMemberPw(memberId, tel1, tel2, tel3, httpSession);
		if (result.equals("비밀번호")) {
			httpSession.invalidate();
			model.addAttribute("result", "가입하신 이메일로 발송하였습니다");
			return "member/searchMyInfo";
		} else {
			model.addAttribute("memberId", memberId);
			model.addAttribute("memberPhone", tel1 + tel2 + tel3);
			model.addAttribute("result", result);
			return "member/searchMyInfo";
		}
	}

	@RequestMapping(params = "method=myQnAList")
	public String myQnAList(MemberInfo memberInfo, String memberId, String pageNum, Model model) {
		Paging paging = new Paging(memberInfoService.myQnACnt(memberId), pageNum, 15, 10);
		memberInfo.setStartRow(paging.getStartRow());
		memberInfo.setEndRow(paging.getEndRow());
		model.addAttribute("totMy", memberInfoService.myQnACnt(memberId));
		model.addAttribute("myQnAList", memberInfoService.myQnAList(memberInfo));
		model.addAttribute("paging", paging);
		return "member/myQnaList";
	}

	@RequestMapping(params = "method=myItemList")
	public String myItemList(MemberInfo memberInfo, String memberId, String pageNum, Model model) {
		Paging paging = new Paging(memberInfoService.myItemCnt(memberId), pageNum, 10, 10);
		memberInfo.setStartRow(paging.getStartRow());
		memberInfo.setEndRow(paging.getEndRow());
		List<MemberInfo> myItemList = memberInfoService.myItemList(memberInfo);
		ArrayList<String> myPurchaseItemNames = new ArrayList<String>();

		for (int i = 0; i < myItemList.size(); i++) {
			String itemName = "";
			int purchaseNo = myItemList.get(i).getPurchaseNo();
			List<MemberInfo> myItemPurchase = memberInfoService.myItemPurchase(purchaseNo);
			for (int j = 0; j < myItemPurchase.size(); j++) {
				if (j == (myItemPurchase.size() - 1)) {
					itemName += myItemPurchase.get(j).getItemName();
				} else {
					itemName += myItemPurchase.get(j).getItemName() + ", ";
				}
			}
			myPurchaseItemNames.add(itemName);
		}
		model.addAttribute("myPurchaseItemList", myPurchaseItemNames);
		model.addAttribute("myItemList", myItemList);
		model.addAttribute("paging", paging);
		return "member/myItemList";
	}

	@RequestMapping(params = "method=myMovieList")
	public String myMovieList(MemberInfo memberInfo, String memberId, String pageNum, Model model) {
		Paging paging = new Paging(memberInfoService.myMovieCnt(memberId), pageNum, 10, 10);
		memberInfo.setStartRow(paging.getStartRow());
		memberInfo.setEndRow(paging.getEndRow());
		List<MemberInfo> myBuyMovieList = memberInfoService.myMovieList(memberInfo);
		model.addAttribute("myMovieList", memberInfoService.myMovieList(memberInfo));
		ArrayList<String> mySeatList = new ArrayList<String>();
		System.out.println("[controller] size: " + myBuyMovieList.size());
		for (int i = 0; i < myBuyMovieList.size(); i++) {
			String mySeatStr = "";
			int bookingNo = myBuyMovieList.get(i).getBookingNo();
			List<MemberInfo> myMovieSeat = memberInfoService.myMovieSeat(bookingNo);
			for (int j = 0; j < myMovieSeat.size(); j++) {
				if (j == (myMovieSeat.size() - 1)) {
					mySeatStr += myMovieSeat.get(j).getSeatNo();
				} else {
					mySeatStr += myMovieSeat.get(j).getSeatNo() + ", ";
				}
			}
			mySeatList.add(mySeatStr);
		}
		model.addAttribute("mySeatList", mySeatList);
		model.addAttribute("paging", paging);
		return "member/myMovieList";
	}

}
