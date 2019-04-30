package com.tj.mac.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.mac.dao.AdminDao;
import com.tj.mac.model.Admin;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao adminDao;

	@Override
	public int admindelete(String adminId) {
		return adminDao.admindelete(adminId);
	}

	@Override
	public int admininsert(Admin admin) {
		return adminDao.admininsert(admin);
	}

	@Override
	public Admin getAdmin(String adminId) {
		return adminDao.getAdmin(adminId);
	}

	@Override
	public String loginCheck(String adminId, String adminPw, HttpSession httpSession) {
		String result = "로그인 성공";
		Admin admin = adminDao.getAdmin(adminId);
		if (admin == null) {
			result = "유효하지 않은 아이디입니다";
		} else if (!admin.getAdminPw().equals(adminPw)) {
			result = "비밀번호가 맞지 않습니다";
		} else {
			httpSession.setAttribute("admin", admin);
			httpSession.setAttribute("adminId", adminId);
		}
		return result;
	}
}
