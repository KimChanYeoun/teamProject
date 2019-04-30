package com.tj.mac.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mac.model.Qna;

public interface QnaService {
	
	
	public List<Qna> qna_ListAll(Qna qna);
	public List<Qna> qna_HitList();
	public List<Qna> qna_Paging(Qna qna);
	public int qna_Write(MultipartHttpServletRequest mRequest, Qna qna);
	public int qna_Modify(MultipartHttpServletRequest mRequest, Qna qna);
	public Qna qna_Content(int qnaNo);
	public int qna_Cnt();
	public int qna_Delete(int qnaNo);
	public int qna_ReWrite(MultipartHttpServletRequest mRequest, Qna qna);
	public int qna_Re(Qna qna);
	public List<Qna> qna_Serch(Qna qna);
	public int qna_serTot(Qna qna );
	public int hit_up(int qnaNo);
	public Qna qna_ContentNext(int qnaNo);
	public Qna qna_ContentPrevious(int qnaNo);
	
	
}
