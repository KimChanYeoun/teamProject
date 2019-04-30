package com.tj.mac.dao;

import java.util.List;

import com.tj.mac.model.Event;

public interface EventDao {
	public List<Event> eventListAll();
	public List<Event> eventListPaging(Event event);
	public int writeEvent(Event event);
	public Event detailEvent(int eventNo);
	public int modifyEvent(Event event);
	public int ReadCountEvent(int eventNo);
	public int deleteEvent(int eventNo);
	public int countEvent();
}
