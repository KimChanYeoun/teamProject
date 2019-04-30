package com.tj.mac.service;

import java.sql.Date;
import java.util.List;

import com.tj.mac.model.Screenup;

public interface ScreenupService {
	public int insertScreenup(Screenup screenup);
	public Screenup getScreenup(int screenupNo);
	public List<Screenup> searchScreenup(Screenup screenup);
	public List<String> getScreenupDate(String screenNo);
	public List<Date> selectDate(Screenup screenup);
	public List<Screenup> selectScreen(Screenup screenup);
	public Screenup selectedAll(Screenup screenup);
}
