package com.tj.mac.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mac.model.Notice;

public interface NoticeService {
	public List<Notice> noticeList(Notice notice);
	
	public Notice noticeDetail(int noticeNo);
	
	public Notice noticeNext(int noticeNo);
	
	public Notice noticeBefore(int noticeNo);
	
	public int writerNotice(MultipartHttpServletRequest mRequest, Notice notice);
	
	public int modifyNotice(MultipartHttpServletRequest mRequest);
	
	public int readCountNotice(int noticeNo);
	
	public int deleteNotice(int noticeNo);
	
	public int noticeCount();

}
