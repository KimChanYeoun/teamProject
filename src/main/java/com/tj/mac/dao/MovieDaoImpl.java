package com.tj.mac.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.Movie;
@Repository
public class MovieDaoImpl implements MovieDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int insertMovie(Movie movie) {
		return sessionTemplate.insert("insertMovie", movie);
	}
	@Override
	public int modifyMovie(Movie movie) {
		return sessionTemplate.update("modifyMovie", movie);
	}
	@Override
	public Movie getMovie(int movieNo) {
		return sessionTemplate.selectOne("getMovie", movieNo);
	}
	@Override
	public int totCntMovie() {
		return sessionTemplate.selectOne("totCntMovie");
	}
	@Override
	public List<Movie> listMovie(Movie movie) {
		return sessionTemplate.selectList("listMovie", movie);
	}
	@Override
	public int searchCntMovie(Movie movie) {
		return sessionTemplate.selectOne("searchCntMovie", movie);
	}
	@Override
	public List<Movie> searchMovie(Movie movie) {
		return sessionTemplate.selectList("searchMovie", movie);
	}
	@Override
	public List<Movie> beforeReleaseMovie() {
		return sessionTemplate.selectList("beforeReleaseMovie");
	}
	@Override
	public List<Movie> nowMovie() {
		return sessionTemplate.selectList("nowMovie");
	}
	@Override
	public List<Movie> scheduleMovie() {
		return sessionTemplate.selectList("scheduleMovie");
	}
	@Override
	public List<Movie> selectMovie() {
		return sessionTemplate.selectList("selectMovie");
	}
	@Override
	public int activeBooking(int movieNo) {
		return sessionTemplate.selectOne("activeBooking", movieNo);
	}
	@Override
	public List<Movie> movieSelection() {
		return sessionTemplate.selectList("movieSelection");
	}
}
