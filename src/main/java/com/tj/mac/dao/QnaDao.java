package com.tj.mac.dao;

import java.util.List;

import com.tj.mac.model.Qna;

public interface QnaDao {
	public List<Qna> qna_ListAll(Qna qna);
	public List<Qna> qna_HitList();
	public List<Qna> qna_Paging(Qna qna);
	public int qna_Write(Qna qna);
	public int qna_Modify(Qna qna);
	public Qna qna_Content(int qnaNo);
	public int qna_Delete(int qnaNo);
	public int qna_Cnt();
	public int qna_ReWrite(Qna qna);
	public int qna_Re(Qna qna);
	public List<Qna> qna_Serch(Qna qna);
	public int qna_serTot(Qna qna);
	public int hit_up(int qnaNo);
	public Qna qna_ContentNext(int qnaNo);
	public Qna qna_ContentPrevious(int qnaNo);
}
