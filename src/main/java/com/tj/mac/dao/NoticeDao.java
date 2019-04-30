package com.tj.mac.dao;

import java.util.List;

import com.tj.mac.model.Notice;

public interface NoticeDao {
	public List<Notice> noticeList(Notice notice);
	
	public Notice noticeDetail(int noticeNo);
	
	public Notice noticeNext(int noticeNo);
	
	public Notice noticeBefore(int noticeNo);
	
	public int writerNotice(Notice notice);
	
	public int modifyNotice(Notice notice);
	
	public int readCountNotice(int noticeNo);
	
	public int deleteNotice(int noticeNo);
	
	public int noticeCount();
}
