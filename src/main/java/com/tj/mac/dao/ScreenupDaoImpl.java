package com.tj.mac.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.Screenup;
@Repository
public class ScreenupDaoImpl implements ScreenupDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int insertScreenup(Screenup screenup) {
		return sessionTemplate.insert("insertScreenup", screenup);
	}
	@Override
	public Screenup getScreenup(int screenupNo) {
		return sessionTemplate.selectOne("getScreenup", screenupNo);
	}
	@Override
	public List<Screenup> searchScreenup(Screenup screenup) {
		return sessionTemplate.selectList("searchScreenup", screenup);
	}
	@Override
	public List<Screenup> getScreenupDate(String screenNo) {
		return sessionTemplate.selectList("getScreenupDate", screenNo);
	}
	@Override
	public List<Screenup> selectDate(Screenup screenup) {
		return sessionTemplate.selectList("selectDate", screenup);
	}
	@Override
	public List<Screenup> selectScreen(Screenup screenup) {
		return sessionTemplate.selectList("selectScreen", screenup);
	}
	@Override
	public Screenup selectedAll(Screenup screenup) {
		return sessionTemplate.selectOne("selectedAll", screenup);
	}
}
