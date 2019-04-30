package com.tj.mac.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.MemberGrade;
@Repository
public class MemberGradeDaoImpl implements MemberGradeDao {
	@Autowired
	private SqlSession sessionTemplate;

	@Override
	public List<MemberGrade> memberGradeList() {
		return sessionTemplate.selectList("memberGradeList");
	}

}
