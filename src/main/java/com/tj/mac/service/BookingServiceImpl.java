package com.tj.mac.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.mac.dao.BookingDao;
import com.tj.mac.model.Booking;
@Service
public class BookingServiceImpl implements BookingService {
	@Autowired
	private BookingDao bookingDao;
	@Override
	public int insertBooking(Booking booking) {
		return bookingDao.insertBooking(booking);
	}
	@Override
	public int deleteBooking(int bookingNo) {
		return bookingDao.deleteBooking(bookingNo);
	}
	@Override
	public Booking getBooking(int bookingNo) {
		return bookingDao.getBooking(bookingNo);
	}
	@Override
	public int getLastBookingNo() {
		return bookingDao.getLastBookingNo();
	}
	@Override
	public void usePoint(Booking booking) {
		bookingDao.usePoint(booking);
	}
	@Override
	public void savePoint(Booking booking) {
		bookingDao.savePoint(booking);
	}
	@Override
	public void accumulateAmount(Booking booking) {
		bookingDao.accumulateAmount(booking);
	}
	@Override
	public void upMemberGrade(String memberId) {
		bookingDao.upMemberGrade(memberId);
	}
}
