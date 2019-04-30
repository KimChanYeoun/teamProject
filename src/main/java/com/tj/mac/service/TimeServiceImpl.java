package com.tj.mac.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.mac.dao.TimeDao;
import com.tj.mac.model.Time;
@Service
public class TimeServiceImpl implements TimeService {
	@Autowired
	private TimeDao timeDao;
	@Override
	public List<Time> listTime() {
		return timeDao.listTime();
	}

}
