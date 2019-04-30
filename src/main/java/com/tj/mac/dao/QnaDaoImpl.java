package com.tj.mac.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.Qna;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Autowired
	private SqlSession seesionTemplate;

	public List<Qna> qna_ListAll(Qna qna) {
		return seesionTemplate.selectList("qna_ListAll", qna);
	}

	@Override
	public List<Qna> qna_HitList() {
		return seesionTemplate.selectList("qna_HitList");
	}

	@Override
	public List<Qna> qna_Paging(Qna qna) {
		return seesionTemplate.selectList("qna_Paging", qna);
	}

	@Override
	public int qna_Write(Qna qna) {
		return seesionTemplate.insert("qna_Write", qna);
	}

	@Override
	public int qna_Modify(Qna qna) {
		int result = seesionTemplate.update("qna_Modify", qna);
		return result;
	}

	@Override
	public Qna qna_Content(int qnaNo) {
		hit_up(qnaNo);
		return seesionTemplate.selectOne("qna_Content", qnaNo);

	}

	@Override
	public int qna_Delete(int qnaNo) {
		return seesionTemplate.delete("qna_Delete", qnaNo);
	}

	@Override
	public int qna_Cnt() {
		return seesionTemplate.selectOne("qna_Cnt");
	}

	@Override
	public int qna_ReWrite(Qna qna) {
		qna_Re(qna);
		return seesionTemplate.insert("qna_ReWrite", qna);
	}

	@Override
	public int qna_Re(Qna qna) {
		return seesionTemplate.update("qna_Re", qna);
	}

	@Override
	public List<Qna> qna_Serch(Qna qna) {
		return seesionTemplate.selectList("qna_Serch", qna);
	}

	@Override
	public int qna_serTot(Qna qna) {
		return seesionTemplate.selectOne("qna_serTot", qna);
	}

	@Override
	public int hit_up(int qnaNo) {
		return seesionTemplate.update("hit_up" ,qnaNo);
	}

	@Override
	public Qna qna_ContentNext(int qnaNo) {
		return seesionTemplate.selectOne("qna_ContentNext", qnaNo);
	}

	@Override
	public Qna qna_ContentPrevious(int qnaNo) {
		return seesionTemplate.selectOne("qna_ContentPrevious", qnaNo);
	}

}
