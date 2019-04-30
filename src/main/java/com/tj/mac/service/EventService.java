package com.tj.mac.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mac.model.Event;
public interface EventService {
	public List<Event> eventListAll();
	public List<Event> eventListPaging(Event event);
	public int writeEvent(MultipartHttpServletRequest mRequest, Event event);
	public Event detailEvent(int eventNo);
	public int modifyEvent(MultipartHttpServletRequest mRequest);
	public int ReadCountEvent(int eventNo);
	public int deleteEvent(int eventNo);
	public int countEvent();
}
