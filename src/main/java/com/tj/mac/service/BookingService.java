package com.tj.mac.service;

import com.tj.mac.model.Booking;

public interface BookingService {
	public int insertBooking(Booking booking);
	public int deleteBooking(int bookingNo);
	public Booking getBooking(int bookingNo);
	public int getLastBookingNo();
	public void usePoint(Booking booking);
	public void savePoint(Booking booking);
	public void accumulateAmount(Booking booking);
	public void upMemberGrade(String memberId);
}
