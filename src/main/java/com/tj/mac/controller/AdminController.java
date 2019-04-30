package com.tj.mac.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tj.mac.model.Member;
import com.tj.mac.service.AdminService;
import com.tj.mac.service.MemberService;
import com.tj.mac.service.Paging;

@Controller
@RequestMapping("admin")
// member.do?method=join&mid=aaa
public class AdminController {
	@Autowired
	private AdminService adminService;

	@Autowired
	private MemberService memberService;

	@RequestMapping(params = "method=loginForm")
	public String loginForm() {
		return "admin/loginForm";
	}

	@RequestMapping(params = "method=login")
	public String login(String adminId, String adminPw, Model model, HttpSession httpSession) {
		String result = adminService.loginCheck(adminId, adminPw, httpSession);
		if (result.equals("로그인 성공")) {
			return "redirect:main.do";
		} else {
			model.addAttribute("adminId", adminId);
			model.addAttribute("adminPw", adminPw);
			model.addAttribute("result", result);
			return "forward:admin.do?method=loginForm";
		}
	}

	@RequestMapping(params = "method=logout")
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:main.do";
	}

	@RequestMapping(params = "method=memberList")
	public String memberList(Member member, String pageNum, Model model) {
		int cntMember = memberService.cntMember(member);
		Paging paging = new Paging(cntMember, pageNum, 20, 10);
		member.setStartRow(paging.getStartRow());
		member.setEndRow(paging.getEndRow());
		model.addAttribute("memberList", memberService.memberList(member));
		model.addAttribute("paging", paging);
		return "admin/memberList";
	}

	@RequestMapping(params = "method=memberStart")
	public String memberStart(String memberId, Model model) {
		int result = memberService.memberStart(memberId);
		model.addAttribute("result", result);
		return "admin/memberList";
	}

	@RequestMapping(params = "method=memberStop")
	public String memberStop(String memberId, Model model) {
		int result = memberService.memberStop(memberId);
		model.addAttribute("result", result);
		return "admin/memberList";
	}

}
