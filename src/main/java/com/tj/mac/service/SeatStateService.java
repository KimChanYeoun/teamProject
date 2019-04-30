package com.tj.mac.service;

import java.util.List;

import com.tj.mac.model.SeatState;

public interface SeatStateService {
	public int insertSeatState(SeatState seatState);
	public int deleteSeatState(SeatState seatState);
	public List<String> getSeatState(SeatState seatState);
}
