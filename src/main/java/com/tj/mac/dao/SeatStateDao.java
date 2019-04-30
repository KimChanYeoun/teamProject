package com.tj.mac.dao;

import java.util.List;

import com.tj.mac.model.SeatState;

public interface SeatStateDao {
	public int insertSeatState(SeatState seatState);
	public int deleteSeatState(SeatState seatState);
	public List<SeatState> getSeatState(SeatState seatState);
}
