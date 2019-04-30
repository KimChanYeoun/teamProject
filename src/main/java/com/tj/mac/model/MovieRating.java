package com.tj.mac.model;

public class MovieRating {
	private int movieRatingNo;
	private int movieNo;
	private String memberId;
	private int movieRatingPoint;
	private String movieRatingComment;
	public int getMovieRatingNo() {
		return movieRatingNo;
	}
	public void setMovieRatingNo(int movieRatingNo) {
		this.movieRatingNo = movieRatingNo;
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getMovieRatingPoint() {
		return movieRatingPoint;
	}
	public void setMovieRatingPoint(int movieRatingPoint) {
		this.movieRatingPoint = movieRatingPoint;
	}
	public String getMovieRatingComment() {
		return movieRatingComment;
	}
	public void setMovieRatingComment(String movieRatingComment) {
		this.movieRatingComment = movieRatingComment;
	}
	@Override
	public String toString() {
		return "MovieRating [movieRatingNo=" + movieRatingNo + ", movieNo=" + movieNo + ", memberId=" + memberId
				+ ", movieRatingPoint=" + movieRatingPoint + ", movieRatingComment=" + movieRatingComment + "]";
	}
}
