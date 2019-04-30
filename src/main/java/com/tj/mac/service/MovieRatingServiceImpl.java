package com.tj.mac.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.mac.dao.MovieRatingDao;
import com.tj.mac.model.MovieRating;
@Service
public class MovieRatingServiceImpl implements MovieRatingService {
	@Autowired
	private MovieRatingDao movieRatingDao;
	@Override
	public int insertMovieRating(MovieRating movieRating) {
		return movieRatingDao.insertMovieRating(movieRating);
	}
	@Override
	public int modifyMovieRating(MovieRating movieRating) {
		return movieRatingDao.modifyMovieRating(movieRating);
	}
	@Override
	public int deleteMovieRating(int movieRatingNo) {
		return movieRatingDao.deleteMovieRating(movieRatingNo);
	}
	@Override
	public List<MovieRating> getMovieRating(int movieNo) {
		return movieRatingDao.getMovieRating(movieNo);
	}
	@Override
	public MovieRating getMovieRatingById(MovieRating movieRating) {
		return movieRatingDao.getMovieRatingById(movieRating);
	}
}
