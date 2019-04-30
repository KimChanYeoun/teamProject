package com.tj.mac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tj.mac.service.EventService;
import com.tj.mac.service.MovieService;
import com.tj.mac.service.QnaService;

@Controller
public class MainController {
	@Autowired
	private MovieService movieService;
	@Autowired
	private QnaService qService;

	@Autowired
	private EventService eventService;

	@RequestMapping(value = "main")
	public String main(Model model) {
		model.addAttribute("movieSelection", movieService.movieSelection());
		model.addAttribute("qna_Hitlist", qService.qna_HitList());
		model.addAttribute("event_list" , eventService.eventListAll());
		return "main/main";
	}
}
