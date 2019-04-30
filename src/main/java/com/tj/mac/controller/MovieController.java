package com.tj.mac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mac.model.Movie;
import com.tj.mac.service.MovieRatingService;
import com.tj.mac.service.MovieService;
import com.tj.mac.service.Paging;

@Controller
@RequestMapping("movie")
public class MovieController {
	@Autowired
	private MovieService movieService;
	@Autowired
	private MovieRatingService movieRatingService;
	@RequestMapping(params="method=insertForm")
	public String insertForm() {
		return "movie/insertForm";
	}
	@RequestMapping(params="method=insert")
	public String insert(MultipartHttpServletRequest mRequest, Movie movie, Model model) {
		int result = movieService.insertMovie(mRequest, movie);
		if(result == 1) {
			model.addAttribute("msg", "영화등록 성공");
		} else {
			model.addAttribute("msg", "영화등록 실패");
		}
		return "forward:movie.do?method=list";
	}
	@RequestMapping(params="method=modifyForm")
	public String modifyForm(int movieNo, Model model) {
		model.addAttribute("modifyForm", movieService.getMovie(movieNo));
		return "movie/modifyForm";
	}
	@RequestMapping(params="method=modify")
	public String modify(MultipartHttpServletRequest mRequest, Movie movie, Model model) {
		int result = movieService.modifyMovie(mRequest, movie);
		if(result!=0) {
			model.addAttribute("msg", "수정완료");
		} else {
			model.addAttribute("msg", "수정실패");
		}
		return "forward:movie.do?method=detail";
	}
	@RequestMapping(params="method=list")
	public String list(Movie movie, String pageNum, Model model) {
		Paging paging = new Paging(movieService.totCntMovie(), pageNum, 20, 10);
		movie.setStartRow(paging.getStartRow());
		movie.setEndRow(paging.getEndRow());
		model.addAttribute("list", movieService.listMovie(movie));
		model.addAttribute("paging", paging);
		return "movie/list";
	}
	@RequestMapping(params="method=search")
	public String search(Movie movie, String pageNum, Model model) {
		Paging paging = new Paging(movieService.searchCntMovie(movie), pageNum, 20, 10);
		movie.setStartRow(paging.getStartRow());
		movie.setEndRow(paging.getEndRow());
		model.addAttribute("search", movieService.searchMovie(movie));
		model.addAttribute("paging", paging);
		return "movie/search";
	}
	@RequestMapping(params="method=detail")
	public String detail(int movieNo, Model model) {
		model.addAttribute("detail", movieService.getMovie(movieNo));
		model.addAttribute("ratingList", movieRatingService.getMovieRating(movieNo));
		model.addAttribute("activeBooking", movieService.activeBooking(movieNo));
		return "movie/detail";
	}
	@RequestMapping(params="method=getMovie")
	@ResponseBody
	public Movie getMovie(int movieNo) {
		return movieService.getMovie(movieNo);
	}
	@RequestMapping(params="method=now")
	public String now(Model model) {
		model.addAttribute("now", movieService.nowMovie());
		return "movie/now";
	}
	@RequestMapping(params="method=schedule")
	public String schedule(Model model) {
		model.addAttribute("schedule", movieService.scheduleMovie());
		return "movie/schedule";
	}
}
