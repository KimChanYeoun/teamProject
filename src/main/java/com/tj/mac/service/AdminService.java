package com.tj.mac.service;

import javax.servlet.http.HttpSession;

import com.tj.mac.model.Admin;

public interface AdminService {
	public int admininsert(Admin admin);
	
	public int admindelete(String adminId);
	
	public Admin getAdmin(String adminId);
	
	public String loginCheck(String adminId, String adminPw, HttpSession httpSession);
}
