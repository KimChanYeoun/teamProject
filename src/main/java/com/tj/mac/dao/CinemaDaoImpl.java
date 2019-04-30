package com.tj.mac.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.Cinema;
@Repository
public class CinemaDaoImpl implements CinemaDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<Cinema> selectCinema(int movieNo) {
		return sessionTemplate.selectList("selectCinema", movieNo);
	}

}
