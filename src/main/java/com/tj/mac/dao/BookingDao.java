package com.tj.mac.dao;

import com.tj.mac.model.Booking;

public interface BookingDao {
	public int insertBooking(Booking booking);
	public int deleteBooking(int bookingNo);
	public Booking getBooking(int bookingNo);
	public int getLastBookingNo();
	public int usePoint(Booking booking);
	public int savePoint(Booking booking);
	public int accumulateAmount(Booking booking);
	public int upMemberGrade(String memberId);
}
