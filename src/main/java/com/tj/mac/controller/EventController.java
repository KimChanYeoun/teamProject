package com.tj.mac.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mac.model.Event;
import com.tj.mac.service.EventService;
import com.tj.mac.service.Paging;
@Controller
@RequestMapping("event")
public class EventController {
	@Autowired
	private EventService eventService;
	 @RequestMapping(params="method=writeForm")
	 public String writeForm() {
		 return "event/writeForm";
	 }
	 @RequestMapping(params="method=write")
	 public String write(Event event, MultipartHttpServletRequest mRequest) {
		 eventService.writeEvent(mRequest, event);
		 return "event/writeForm";
	 }	 
	 
	 @RequestMapping(params="method=list")
	 public String list(Event event, String pageNum, Model model) {
		Paging paging = new Paging(eventService.countEvent(), pageNum, 4, 5);
		event.setStartRow(paging.getStartRow());
		event.setEndRow(paging.getEndRow());		
		model.addAttribute("list", eventService.eventListPaging(event)); 
		model.addAttribute("paging", paging);
		return "event/list";
	 }
	 @RequestMapping(params="method=detail")
	 public String detail(int eventNo, Model model) {
		 model.addAttribute("detail", eventService.detailEvent(eventNo));
		 return "event/detail";
	 }
	 @RequestMapping(params="method=modifyForm")
	 public String modifyForm(int eventNo, String pageNum, Model model) {
		 model.addAttribute("detail", eventService.detailEvent(eventNo));
		 return "event/modifyForm";
	 }
	 @RequestMapping(params="method=modify")
	 public String modify(MultipartHttpServletRequest mRequest, String pageNum) {
		 eventService.modifyEvent(mRequest);
		 return "redirect:event.do?method=list&pageNum="+pageNum;
	 }
	 @RequestMapping(params="method=delete")
	 public String delete(int eventNo, String pageNum) {
		 eventService.deleteEvent(eventNo);
		 return "redirect:event.do?method=list&pageNum="+pageNum;
	 }
	 @RequestMapping(params="method=count")
	 public String count(int eventNo, Model model) {
		 model.addAttribute(eventService.countEvent());
		 return "event/count";
	 }
}
