package com.tj.mac.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.Booking;
@Repository
public class BookingDaoImpl implements BookingDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int insertBooking(Booking booking) {
		return sessionTemplate.insert("insertBooking", booking);
	}
	@Override
	public int deleteBooking(int bookingNo) {
		return sessionTemplate.delete("deleteBooking", bookingNo);
	}
	@Override
	public Booking getBooking(int bookingNo) {
		return sessionTemplate.selectOne("getBooking", bookingNo);
	}
	@Override
	public int getLastBookingNo() {
		return sessionTemplate.selectOne("getLastBookingNo");
	}
	@Override
	public int usePoint(Booking booking) {
		return sessionTemplate.update("usePoint", booking);
	}
	@Override
	public int savePoint(Booking booking) {
		return sessionTemplate.update("savePoint", booking);
	}
	@Override
	public int accumulateAmount(Booking booking) {
		return sessionTemplate.update("accumulateAmount", booking);
	}
	@Override
	public int upMemberGrade(String memberId) {
		return sessionTemplate.update("upMemberGrade", memberId);
	}
}
