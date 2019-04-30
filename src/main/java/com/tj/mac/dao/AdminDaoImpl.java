package com.tj.mac.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.Admin;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSession sessionTemplate;

	@Override
	public int admininsert(Admin admin) {
		return sessionTemplate.insert("admininsert", admin);
	}

	@Override
	public int admindelete(String adminId) {
		return sessionTemplate.delete("admindelete", adminId);
	}

	@Override
	public Admin getAdmin(String adminId) {
		return sessionTemplate.selectOne("getAdmin", adminId);
	}

}
