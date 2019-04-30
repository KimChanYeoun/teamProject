package com.tj.mac.dao;

import java.util.List;

import com.tj.mac.model.Movie;

public interface MovieDao {
	public int insertMovie(Movie movie);
	public int modifyMovie(Movie movie);
	public Movie getMovie(int movieNo);
	public int totCntMovie();
	public List<Movie> listMovie(Movie movie);
	public int searchCntMovie(Movie movie);
	public List<Movie> searchMovie(Movie movie);
	public List<Movie> beforeReleaseMovie();
	public List<Movie> nowMovie();
	public List<Movie> scheduleMovie();
	public List<Movie> selectMovie();
	public int activeBooking(int movieNo);
	public List<Movie> movieSelection();
}
