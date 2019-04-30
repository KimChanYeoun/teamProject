package com.tj.mac.dao;

import java.util.List;

import com.tj.mac.model.Cinema;

public interface CinemaDao {
	public List<Cinema> selectCinema(int movieNo);
}
