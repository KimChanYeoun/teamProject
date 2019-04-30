package com.tj.mac.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.mac.dao.MemberGradeDao;
import com.tj.mac.model.MemberGrade;
@Service
public class MemberGradeServiceImpl implements MemberGradeService {
	@Autowired
	private MemberGradeDao memberGradeDao;

	@Override
	public List<MemberGrade> memberGradeList() {
		return memberGradeDao.memberGradeList();
	}

}
