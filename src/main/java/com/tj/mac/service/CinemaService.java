package com.tj.mac.service;

import java.util.List;

import com.tj.mac.model.Cinema;

public interface CinemaService {
	public List<Cinema> selectCinema(int movieNo);
}
