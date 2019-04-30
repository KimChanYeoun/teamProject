package com.tj.mac.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.BookingSeat;
@Repository
public class BookingSeatDaoImpl implements BookingSeatDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int insertBookingSeat(BookingSeat bookingSeat) {
		return sessionTemplate.insert("insertBookingSeat", bookingSeat);
	}

	@Override
	public int deleteBookingSeat(int bookingNo) {
		return sessionTemplate.delete("deleteBookingSeat", bookingNo);
	}

}
