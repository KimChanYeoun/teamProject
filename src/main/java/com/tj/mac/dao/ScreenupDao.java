package com.tj.mac.dao;

import java.util.List;

import com.tj.mac.model.Screenup;

public interface ScreenupDao {
	public int insertScreenup(Screenup screenup);
	public Screenup getScreenup(int screenupNo);
	public List<Screenup> searchScreenup(Screenup screenup);
	public List<Screenup> getScreenupDate(String screenNo);
	public List<Screenup> selectDate(Screenup screenup);
	public List<Screenup> selectScreen(Screenup screenup);
	public Screenup selectedAll(Screenup screenup);
}
