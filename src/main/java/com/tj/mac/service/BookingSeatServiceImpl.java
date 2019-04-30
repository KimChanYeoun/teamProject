package com.tj.mac.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.mac.dao.BookingSeatDao;
import com.tj.mac.model.BookingSeat;
@Service
public class BookingSeatServiceImpl implements BookingSeatService {
	@Autowired
	private BookingSeatDao bookingSeatDao;
	@Override
	public int insertBookingSeat(BookingSeat bookingSeat) {
		return bookingSeatDao.insertBookingSeat(bookingSeat);
	}

	@Override
	public int deleteBookingSeat(int bookingNo) {
		return bookingSeatDao.deleteBookingSeat(bookingNo);
	}

}
