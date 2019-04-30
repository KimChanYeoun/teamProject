package com.tj.mac.model;

import java.sql.Date;

public class Movie {
	private int movieNo;
	private String movieName;
	private String movieDirector;
	private String movieActor;
	private String movieGenre;
	private String movieCountry;
	private String movieGrade;
	private String movieRunningtime;
	private Date movieRelease;
	private String movieImage;
	private String movieTrailer;
	private String movieStory;
	private double movieRating;
	private int startRow;
	private int endRow;
	private int minYear;
	private int maxYear;
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getMovieDirector() {
		return movieDirector;
	}
	public void setMovieDirector(String movieDirector) {
		this.movieDirector = movieDirector;
	}
	public String getMovieActor() {
		return movieActor;
	}
	public void setMovieActor(String movieActor) {
		this.movieActor = movieActor;
	}
	public String getMovieGenre() {
		return movieGenre;
	}
	public void setMovieGenre(String movieGenre) {
		this.movieGenre = movieGenre;
	}
	public String getMovieCountry() {
		return movieCountry;
	}
	public void setMovieCountry(String movieCountry) {
		this.movieCountry = movieCountry;
	}
	public String getMovieGrade() {
		return movieGrade;
	}
	public void setMovieGrade(String movieGrade) {
		this.movieGrade = movieGrade;
	}
	public String getMovieRunningtime() {
		return movieRunningtime;
	}
	public void setMovieRunningtime(String movieRunningtime) {
		this.movieRunningtime = movieRunningtime;
	}
	public Date getMovieRelease() {
		return movieRelease;
	}
	public void setMovieRelease(Date movieRelease) {
		this.movieRelease = movieRelease;
	}
	public String getMovieImage() {
		return movieImage;
	}
	public void setMovieImage(String movieImage) {
		this.movieImage = movieImage;
	}
	public String getMovieTrailer() {
		return movieTrailer;
	}
	public void setMovieTrailer(String movieTrailer) {
		this.movieTrailer = movieTrailer;
	}
	public String getMovieStory() {
		return movieStory;
	}
	public void setMovieStory(String movieStory) {
		this.movieStory = movieStory;
	}
	public double getMovieRating() {
		return movieRating;
	}
	public void setMovieRating(double movieRating) {
		this.movieRating = movieRating;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getMinYear() {
		return minYear;
	}
	public void setMinYear(int minYear) {
		this.minYear = minYear;
	}
	public int getMaxYear() {
		return maxYear;
	}
	public void setMaxYear(int maxYear) {
		this.maxYear = maxYear;
	}
	@Override
	public String toString() {
		return "Movie [movieNo=" + movieNo + ", movieName=" + movieName + ", movieDirector=" + movieDirector
				+ ", movieActor=" + movieActor + ", movieGenre=" + movieGenre + ", movieCountry=" + movieCountry
				+ ", movieGrade=" + movieGrade + ", movieRunningtime=" + movieRunningtime + ", movieRelease="
				+ movieRelease + ", movieImage=" + movieImage + ", movieTrailer=" + movieTrailer + ", movieStory="
				+ movieStory + ", movieRating=" + movieRating + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", minYear=" + minYear + ", maxYear=" + maxYear + "]";
	}
}
