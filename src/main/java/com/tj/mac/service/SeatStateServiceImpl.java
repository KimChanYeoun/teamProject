package com.tj.mac.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.mac.dao.SeatStateDao;
import com.tj.mac.model.SeatState;
@Service
public class SeatStateServiceImpl implements SeatStateService {
	@Autowired
	private SeatStateDao seatStateDao;
	@Override
	public int insertSeatState(SeatState seatState) {
		return seatStateDao.insertSeatState(seatState);
	}
	@Override
	public int deleteSeatState(SeatState seatState) {
		return seatStateDao.deleteSeatState(seatState);
	}
	@Override
	public List<String> getSeatState(SeatState seatState) {
		List<SeatState> seatStateList = seatStateDao.getSeatState(seatState);
		List<String> seatList = new ArrayList<String>();
		for(SeatState st : seatStateList) {
			seatList.add(st.getSeatNo());
		}
		return seatList;
	}
}
