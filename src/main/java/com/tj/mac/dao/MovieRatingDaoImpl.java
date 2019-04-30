package com.tj.mac.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.MovieRating;
@Repository
public class MovieRatingDaoImpl implements MovieRatingDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int insertMovieRating(MovieRating movieRating) {
		return sessionTemplate.insert("insertMovieRating", movieRating);
	}
	@Override
	public int modifyMovieRating(MovieRating movieRating) {
		return sessionTemplate.update("modifyMovieRating", movieRating);
	}
	@Override
	public int deleteMovieRating(int movieRatingNo) {
		return sessionTemplate.delete("deleteMovieRating", movieRatingNo);
	}
	@Override
	public List<MovieRating> getMovieRating(int movieNo) {
		return sessionTemplate.selectList("getMovieRating", movieNo);
	}
	@Override
	public MovieRating getMovieRatingById(MovieRating movieRating) {
		return sessionTemplate.selectOne("getMovieRatingById", movieRating);
	}
}
