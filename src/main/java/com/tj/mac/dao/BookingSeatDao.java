package com.tj.mac.dao;

import com.tj.mac.model.BookingSeat;

public interface BookingSeatDao {
	public int insertBookingSeat(BookingSeat bookingSeat);
	public int deleteBookingSeat(int bookingNo);
}
