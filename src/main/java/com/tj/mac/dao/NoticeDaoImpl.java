package com.tj.mac.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	private SqlSession sessionTemplate;

	@Override
	public List<Notice> noticeList(Notice notice) {
		return sessionTemplate.selectList("noticeList", notice);
	}

	@Override
	public Notice noticeDetail(int noticeNo) {
		return sessionTemplate.selectOne("noticeDetail", noticeNo);
	}

	@Override
	public int writerNotice(Notice notice) {
		return sessionTemplate.insert("writerNotice", notice);
	}

	@Override
	public int modifyNotice(Notice notice) {
		return sessionTemplate.update("modifyNotice", notice);
	}

	@Override
	public int readCountNotice(int noticeNo) {
		return sessionTemplate.update("readCountNotice", noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return sessionTemplate.delete("deleteNotice", noticeNo);
	}

	@Override
	public int noticeCount() {
		return sessionTemplate.selectOne("noticeCount");
	}

	@Override
	public Notice noticeNext(int noticeNo) {
		return sessionTemplate.selectOne("noticeNext", noticeNo);
	}

	@Override
	public Notice noticeBefore(int noticeNo) {
		return sessionTemplate.selectOne("noticeBefore", noticeNo);
	}

}
