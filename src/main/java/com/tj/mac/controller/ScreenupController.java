package com.tj.mac.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tj.mac.model.Screenup;
import com.tj.mac.service.MovieService;
import com.tj.mac.service.ScreenupService;

@Controller
@RequestMapping("screenup")
public class ScreenupController {
	@Autowired
	private ScreenupService screenupService;
	@Autowired
	private MovieService movieService;
	@RequestMapping(params="method=insertForm")
	public String insertForm(Model model) {
		model.addAttribute("movieList", movieService.beforeReleaseMovie());
		return "screenup/insertForm";
	}
	@RequestMapping(params="method=getScreenupDate")
	@ResponseBody
	public List<String> getScreenupDate(String screenNo) {
		return screenupService.getScreenupDate(screenNo);
	}
	@RequestMapping(params="method=insert")
	public String insert(Screenup screenup, Model model) {
		screenupService.insertScreenup(screenup);
		return "redirect:movie.do?method=list";
	}
}
