package com.tj.mac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mac.model.Notice;
import com.tj.mac.service.NoticeService;
import com.tj.mac.service.Paging;

@Controller
@RequestMapping("notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;

	@RequestMapping(params = "method=writerForm")
	public String writeForm() {
		return "notice/writerForm";
	}

	@RequestMapping(params = "method=writer")
	public String writer(Notice notice, MultipartHttpServletRequest mRequest) {
		noticeService.writerNotice(mRequest, notice);
		return "redirect:notice.do?method=noticeList";
	}

	@RequestMapping(params = "method=noticeList")
	public String noticeList(Notice notice, String pageNum, Model model) {
		Paging paging = new Paging(noticeService.noticeCount(), pageNum, 15, 10);
		notice.setStartRow(paging.getStartRow());
		notice.setEndRow(paging.getEndRow());
		model.addAttribute("noticeList", noticeService.noticeList(notice));
		model.addAttribute("paging", paging);
		return "notice/noticeList";
	}
	
	@RequestMapping(params = "method=detail")
	public String detail(int noticeNo, Model model) {
		noticeService.readCountNotice(noticeNo);
		model.addAttribute("detail", noticeService.noticeDetail(noticeNo));
		model.addAttribute("detailNext", noticeService.noticeNext(noticeNo));
		model.addAttribute("detailBefore", noticeService.noticeBefore(noticeNo));
		return "notice/detail";
	}

	@RequestMapping(params = "method=modifyForm")
	public String modifyForm(int noticeNo, String pageNum, Model model) {
		model.addAttribute("detail", noticeService.noticeDetail(noticeNo));
		return "notice/modifyForm";
	}

	@RequestMapping(params = "method=modify")
	public String modify(MultipartHttpServletRequest mRequest, String pageNum) {
		noticeService.modifyNotice(mRequest);
		return "redirect:notice.do?method=noticeList&pageNum=" + pageNum;
	}
	
	@RequestMapping(params = "method=delete")
	public String delete(int noticeNo, String pageNum) {
		noticeService.deleteNotice(noticeNo);
		return "redirect:notice.do?method=noticeList&pageNum=" + pageNum;
	}

}
