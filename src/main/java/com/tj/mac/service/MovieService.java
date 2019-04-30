package com.tj.mac.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mac.model.Movie;

public interface MovieService {
	public int insertMovie(MultipartHttpServletRequest mRequest, Movie movie);
	public int modifyMovie(MultipartHttpServletRequest mRequest, Movie movie);
	public Movie getMovie(int movieNo);
	public int totCntMovie();
	public List<Movie> listMovie(Movie movie);
	public int searchCntMovie(Movie movie);
	public List<Movie> searchMovie(Movie movie);
	public List<Movie> beforeReleaseMovie();
	public List<Movie> nowMovie();
	public List<Movie> scheduleMovie();
	public List<Movie> selectMovie();
	public boolean activeBooking(int movieNo);
	public List<Movie> movieSelection();
}
