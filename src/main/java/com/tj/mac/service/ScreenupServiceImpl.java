package com.tj.mac.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.mac.dao.ScreenupDao;
import com.tj.mac.model.Screenup;
@Service
public class ScreenupServiceImpl implements ScreenupService {
	@Autowired
	private ScreenupDao screenupDao;
	@Override
	public int insertScreenup(Screenup screenup) {
		return screenupDao.insertScreenup(screenup);
	}
	@Override
	public Screenup getScreenup(int screenupNo) {
		return screenupDao.getScreenup(screenupNo);
	}
	@Override
	public List<Screenup> searchScreenup(Screenup screenup) {
		return screenupDao.searchScreenup(screenup);
	}
	@Override
	public List<String> getScreenupDate(String screenNo) {
		List<Screenup> dateList = screenupDao.getScreenupDate(screenNo);
		List<String> date = new ArrayList<String>();
		for(Screenup dl : dateList) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-M-dd");
			Date startDate = dl.getScreenupStartdate();
			Date endDate = dl.getScreenupEnddate();
			Calendar startCal = Calendar.getInstance();
			Calendar endCal = Calendar.getInstance();
			startCal.setTime(startDate);
			endCal.setTime(endDate);
			String end = format.format(endCal.getTime()).toString();
			while(true) {
				String now = format.format(startCal.getTime()).toString();
				date.add(now);
				if(now.equals(end)) {
					break;
				}
				startCal.add(Calendar.DATE, 1);
			}
		}
		return date;
	}
	@Override
	public List<Date> selectDate(Screenup screenup) {
		List<Screenup> dateList = screenupDao.selectDate(screenup);
		List<Date> date = new ArrayList<Date>();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		for(Screenup dl : dateList) {
			Date startDate = dl.getScreenupStartdate();
			Date endDate = dl.getScreenupEnddate();
			Calendar startCal = Calendar.getInstance();
			Calendar endCal = Calendar.getInstance();
			startCal.setTime(startDate);
			endCal.setTime(endDate);
			Date end = Date.valueOf(format.format(endCal.getTime()));
			while(true) {
				Date now = Date.valueOf(format.format(startCal.getTime()));
				date.add(now);
				if(now.equals(end)) {
					break;
				}
				startCal.add(Calendar.DATE, 1);
			}
		}
		List<Date> resultList = new ArrayList<Date>();
		for(int i=0 ; i<date.size(); i++) {
			if(!resultList.contains(date.get(i))) {
				resultList.add(date.get(i));
			}
		}
		return resultList;
	}
	@Override
	public List<Screenup> selectScreen(Screenup screenup) {
		return screenupDao.selectScreen(screenup);
	}
	@Override
	public Screenup selectedAll(Screenup screenup) {
		return screenupDao.selectedAll(screenup);
	}
}
