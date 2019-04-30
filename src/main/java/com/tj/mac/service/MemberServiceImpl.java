package com.tj.mac.service;


import java.util.List;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.tj.mac.dao.MemberDao;
import com.tj.mac.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	public JavaMailSenderImpl mailSender;

	@Override
	public int memberIdConfirm(String memberId) {
		return memberDao.memberIdConfirm(memberId);
	}

	@Override
	public int joinMember(final Member member) {
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = 
					"  <h1>" + member.getMemberName() + "님의 회원가입을 축하드립니다</h1>" + 
		            "  <div>"  + 
					"    <div>" + 
					"      <hr color=\"red\"/>" + 
					"    </div>" + 
					"  </div>" + 
					"    <div>" + 
					"      <img src=\"https://i.imgur.com/4sx3Hb1.png\" />\n" + 
					"    </div>" + 
					"    <div style=\"font-weight: blod; font-size: 1.2em;\">M A C 사이트 일동</div>\n" + 
					"    <div style=\"color:red;\">서울시 종로구 삼일대로 17길 51 스타골드BD 501호</div>";

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMemberEmail()));
				mimeMessage.setFrom(new InternetAddress("MAC@gmail.com "));
				mimeMessage.setSubject(member.getMemberName() + "님 회원가입감사합니다");
				mimeMessage.setText(content, "utf-8", "html");
				
			}
		};
		mailSender.send(message);
		return memberDao.joinMember(member);
	}

	@Override
	public Member getMember(String memberId) {
		return memberDao.getMember(memberId);
	}
	
	@Override
	public Member getMemberName(String memberName) {
		return memberDao.getMemberName(memberName);
	}

	@Override
	public int modifyMember(Member member) {
		return memberDao.modifyMember(member);
	}

	@Override
	public int memberStop(String memberId) {
		return memberDao.memberStop(memberId);
	}

	@Override
	public int memberStart(String memberId) {
		return memberDao.memberStart(memberId);
	}

	@Override
	public List<Member> memberList(Member member) {
		return memberDao.memberList(member);
	}

	@Override
	public String loginCheck(String memberId, String memberPw, HttpSession httpSession) {
		String result = "로그인 성공";
		Member member = memberDao.getMember(memberId);
		if (member == null) {
			result = "유효하지 않는 아이디입니다";
		} else if (!member.getMemberPw().equals(memberPw)) {
			result = "비밀번호가 맞지 않습니다";
		} else if (member.getMemberState() == 1){
			result = "정지된 회원입니다";
		} else {
			httpSession.setAttribute("member", member);
			httpSession.setAttribute("memberId", memberId);
		}
		return result;
	}

	@Override
	public Member callLogin(String memberPhone) {
		return memberDao.callLogin(memberPhone);
	}

	@Override
	public String callLoginCheck(String tel1, String tel2, String tel3, HttpSession httpSession) {
		String result = "로그인 성공";
		Member member = memberDao.callLogin(tel1+tel2+tel3);
		if (member == null) {
			result = "유효하지 않는 전화번호입니다";
		} else if (member.getMemberState() == 1){
			result = "정지된 회원입니다";
		} else {
			httpSession.setAttribute("member", member);
			httpSession.setAttribute("memberPhone", tel1+tel2+tel3);
		}
		return result;
	}

	@Override
	public int memberTotal() {
		return memberDao.memberTotal();
	}

	@Override
	public int cntMember(Member member) {
		return memberDao.cntMember(member);
	}

	@Override
	public String searchMemberId(String tel1, String tel2, String tel3, HttpSession httpSession) {
		String result = "아이디";
		final Member member = memberDao.callLogin(tel1+tel2+tel3);
		if (member == null) {
			result = "등록된 이용자가 없습니다";
		} else if (member.getMemberState() == 1){
			result = "정지된 회원입니다";
		} else {
			MimeMessagePreparator message = new MimeMessagePreparator() {
				String content = 
						"  <h1>" + member.getMemberName() + "님의 아이디는</h1>" + 
			            "  <div>"  + 
						"    <div>" + 
						"      "+member.getMemberId()+"입니다\n\n" + 
						"      <hr color=\"red\"/>" + 
						"    </div>" + 
						"  </div>" + 
						"    <div>" + 
						"      <img src=\"https://i.imgur.com/4sx3Hb1.png\" />\n" +
						"    </div>" + 
						"    <div style=\"font-weight: blod; font-size: 1.2em;\">M A C 사이트 일동</div>\n" + 
						"    <div style=\"color:red;\">서울시 종로구 삼일대로 17길 51 스타골드BD 501호</div>";

				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMemberEmail()));
					mimeMessage.setFrom(new InternetAddress("MAC@gmail.com "));
					mimeMessage.setSubject(member.getMemberName() + "님이 요청하신 정보입니다");
					mimeMessage.setText(content, "utf-8", "html");
					
				}
			};
			mailSender.send(message);
			httpSession.setAttribute("member", member);
		}
		return result;
	}

	@Override
	public String searchMemberPw(String memberId, String tel1, String tel2, String tel3, HttpSession httpSession) {
		String result = "비밀번호";
		final Member member = memberDao.getMember(memberId);
		if (member == null) {
			result = "존재하지 않는 아이디입니다";
		} else if (!member.getMemberPhone().equals(tel1+tel2+tel3)) {
			result = "전화번호가 맞지 않습니다";
		} else if (member.getMemberState() == 1){
			result = "정지된 회원입니다";
		} else {
			MimeMessagePreparator message = new MimeMessagePreparator() {
				String content = 
						"  <h1>" + member.getMemberName() + "님의 비밀번호는</h1>" + 
			            "  <div>"  + 
						"    <div>" + 
						"      "+member.getMemberPw()+"입니다\n\n" + 
						"      <hr color=\"red\"/>" + 
						"    </div>" + 
						"  </div>" + 
						"    <div>" + 
						"      <img src=\"https://i.imgur.com/4sx3Hb1.png\" />\n" +
						"    </div>" + 
						"    <div style=\"font-weight: blod; font-size: 1.2em;\">M A C 사이트 일동</div>\n" + 
						"    <div style=\"color:red;\">서울시 종로구 삼일대로 17길 51 스타골드BD 501호</div>";

				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMemberEmail()));
					mimeMessage.setFrom(new InternetAddress("MAC@gmail.com "));
					mimeMessage.setSubject(member.getMemberName() + "님이 요청하신 정보입니다");
					mimeMessage.setText(content, "utf-8", "html");
				}
			};
			mailSender.send(message);
			httpSession.setAttribute("member", member);
			httpSession.setAttribute("memberId", memberId);
		}
		return result;
	}
	

}