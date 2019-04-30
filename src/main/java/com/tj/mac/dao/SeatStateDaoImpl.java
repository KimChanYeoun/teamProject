package com.tj.mac.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.SeatState;
@Repository
public class SeatStateDaoImpl implements SeatStateDao{
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int insertSeatState(SeatState seatState) {
		return sessionTemplate.insert("insertSeatState", seatState);
	}
	@Override
	public int deleteSeatState(SeatState seatState) {
		return sessionTemplate.delete("deleteSeatState", seatState);
	}
	@Override
	public List<SeatState> getSeatState(SeatState seatState) {
		return sessionTemplate.selectList("getSeatState", seatState);
	}
}
