package com.tj.mac.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.Time;
@Repository
public class TimeDaoImpl implements TimeDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<Time> listTime() {
		return sessionTemplate.selectList("listTime");
	}

}
