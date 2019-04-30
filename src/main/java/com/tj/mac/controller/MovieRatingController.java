package com.tj.mac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tj.mac.dao.MovieRatingDao;
import com.tj.mac.model.MovieRating;

@Controller
@RequestMapping("movieRating")
public class MovieRatingController {
	@Autowired
	private MovieRatingDao movieRatingDao;
	@RequestMapping(params="method=insert")
	public String insert(MovieRating movieRating, Model model) {
		MovieRating result = movieRatingDao.getMovieRatingById(movieRating);
		if(result != null) {
			movieRatingDao.modifyMovieRating(movieRating);
			model.addAttribute("msg", "이미 등록된 평점이 있어 해당 평점을 수정하였습니다");
		} else {
			movieRatingDao.insertMovieRating(movieRating);
		}
		return "forward:movie.do?method=detail&movieNo="+movieRating.getMovieNo();
	}
	@RequestMapping(params="method=delete")
	public String delete(int movieRatingNo, int movieNo, Model model) {
		int result = movieRatingDao.deleteMovieRating(movieRatingNo);
		if(result == 1) {
			model.addAttribute("msg", "평점 삭제 완료");
		}
		return "forward:movie.do?method=detail&movieNo="+movieNo;
	}
}
