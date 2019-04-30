package com.tj.mac.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "sub")
public class SubController {

	@RequestMapping(params = "method=siteMap")
	public String main(Model model) {
		System.out.println("안들어옴?");
		return "subpage/site_Map";
	}

}
