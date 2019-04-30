package com.tj.mac.service;

import java.util.List;

import com.tj.mac.model.MovieRating;

public interface MovieRatingService {
	public int insertMovieRating(MovieRating movieRating);
	public int modifyMovieRating(MovieRating movieRating);
	public int deleteMovieRating(int movieRatingNo);
	public List<MovieRating> getMovieRating(int movieNo);
	public MovieRating getMovieRatingById(MovieRating movieRating);
}
