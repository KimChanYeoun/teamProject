package com.tj.mac.dao;

import com.tj.mac.model.Admin;

public interface AdminDao {
	public int admininsert(Admin admin);
	
	public int admindelete(String adminId);
	
	public Admin getAdmin(String adminId);
}
