package com.tj.mac.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.mac.dao.CinemaDao;
import com.tj.mac.model.Cinema;
@Service
public class CinemaServiceImpl implements CinemaService {
	@Autowired
	private CinemaDao cinemaDao;
	@Override
	public List<Cinema> selectCinema(int movieNo) {
		return cinemaDao.selectCinema(movieNo);
	}

}
