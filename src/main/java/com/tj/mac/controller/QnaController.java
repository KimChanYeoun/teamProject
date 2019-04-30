package com.tj.mac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mac.model.Qna;
import com.tj.mac.service.Paging;
import com.tj.mac.service.QnaService;

@Controller
@RequestMapping(value = "qna")
public class QnaController {

	@Autowired
	private QnaService qService;

	@RequestMapping(params = "method=list")
	public String qna_list(String pageNum, Model model, Qna qna) {
		Paging paging = new Paging(qService.qna_Cnt(), pageNum, 15, 5);
		qna.setStartRow(paging.getStartRow());
		qna.setEndRow(paging.getEndRow());
		model.addAttribute("qna_list", qService.qna_ListAll(qna));
		model.addAttribute("tot", qService.qna_Cnt());
		model.addAttribute("paging", paging);
		return "qna/qna_list";
	}

	@RequestMapping(params = "method=content")
	public String content(int qnaNo, Model model, String pageNum) {
		model.addAttribute("content", qService.qna_Content(qnaNo));
		model.addAttribute("contentNext",qService.qna_ContentNext(qnaNo));
		model.addAttribute("contentPrevious",qService.qna_ContentPrevious(qnaNo));
		model.addAttribute("pageNum", pageNum);
		return "qna/qna_content";
	}

	@RequestMapping(params = "method=writeForm")
	public String writeForm() {
		return "qna/qna_writeForm";
	}

	@RequestMapping(params = "method=write")
	public String write(Qna qna, MultipartHttpServletRequest mRequest, Model model) {
		qService.qna_Write(mRequest, qna);
		return "redirect:qna.do?method=list";

	}

	@RequestMapping(params = "method=modifyForm")
	public String modifyForm(int qnaNo, Model model) {
		model.addAttribute("modifyForm", qService.qna_Content(qnaNo));
		return "qna/qna_modifyForm";
	}

	@RequestMapping(params = "method=modify")
	public String modify(int qnaNo, Qna qna, MultipartHttpServletRequest mRequest) {
		qService.qna_Modify(mRequest, qna);
		return "forward:qna.do?method=content&qnaNo=" + qnaNo;
	}

	@RequestMapping(params = "method=delete")
	public String delete(int qnaNo, String pageNum) {
		qService.qna_Delete(qnaNo);
		return "redirect:qna.do?method=list";
	}

	@RequestMapping(params = "method=reWrite")
	public String reWrite(Qna qna, MultipartHttpServletRequest mRequest, String pageNum) {
		qService.qna_ReWrite(mRequest, qna);
		return "redirect:qna.do?method=list&pageNum=" + pageNum;
	}

	@RequestMapping(params = "method=reWriteForm")
	public String reWriteForm(int qnaNo, Model model, String pageNum) {
		model.addAttribute("re", qService.qna_Content(qnaNo));
		model.addAttribute("pageNum", pageNum);
		return "qna/qna_reWriteForm";
	}

	@RequestMapping(params = "method=qna_Serch")
	public String qna_Serch(Qna qna, Model model, String pageNum) {
		Paging paging = new Paging(qService.qna_serTot(qna), pageNum, 15, 5);
		qna.setStartRow(paging.getStartRow());
		qna.setEndRow(paging.getEndRow());
		model.addAttribute("qna_list", qService.qna_Serch(qna));
		model.addAttribute("tot", qService.qna_serTot(qna));
		model.addAttribute("paging", paging);
		return "qna/qna_list";

	}


}