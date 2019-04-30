package com.tj.mac.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.Event;
@Repository
public class EventDaoImpl implements EventDao {

	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<Event> eventListAll() {
		return sessionTemplate.selectList("eventListAll");
	}

	@Override
	public List<Event> eventListPaging(Event event) {
		return sessionTemplate.selectList("eventListPaging", event);
	}

	@Override
	public int writeEvent(Event event) {
		return sessionTemplate.insert("writeEvent", event);
	}

	@Override
	public Event detailEvent(int eventNo) {
		return sessionTemplate.selectOne("detailEvent", eventNo);
	}

	@Override
	public int modifyEvent(Event event) {
		return sessionTemplate.update("modifyEvent", event);
	}

	@Override
	public int ReadCountEvent(int eventNo) {
		return sessionTemplate.selectOne("ReadCountEvent", eventNo);
	}

	@Override
	public int deleteEvent(int eventNo) {
		return sessionTemplate.delete("deleteEvent", eventNo);
	}

	@Override
	public int countEvent() {
		return sessionTemplate.selectOne("countEvent");
	}

}
