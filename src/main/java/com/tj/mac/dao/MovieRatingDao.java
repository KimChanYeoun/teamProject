package com.tj.mac.dao;

import java.util.List;

import com.tj.mac.model.MovieRating;

public interface MovieRatingDao {
	public int insertMovieRating(MovieRating movieRating);
	public int modifyMovieRating(MovieRating movieRating);
	public int deleteMovieRating(int movieRatingNo);
	public List<MovieRating> getMovieRating(int movieNo);
	public MovieRating getMovieRatingById(MovieRating movieRating);
}
