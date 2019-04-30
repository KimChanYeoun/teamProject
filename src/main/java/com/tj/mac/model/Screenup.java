package com.tj.mac.model;

import java.sql.Date;

public class Screenup {
	private String movieName;
	private double movieRating;
	private Date movieRelease;
	private String movieImage;
	private String cinemaName;
	private String screenName;
	private String cinemaNo;
	private int screenupNo;
	private int movieNo;
	private String screenNo;
	private Date screenupStartdate;
	private Date screenupEnddate;
	private Date selectedDate;
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public double getMovieRating() {
		return movieRating;
	}
	public void setMovieRating(double movieRating) {
		this.movieRating = movieRating;
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
	public String getCinemaName() {
		return cinemaName;
	}
	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}
	public String getScreenName() {
		return screenName;
	}
	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}
	public String getCinemaNo() {
		return cinemaNo;
	}
	public void setCinemaNo(String cinemaNo) {
		this.cinemaNo = cinemaNo;
	}
	public int getScreenupNo() {
		return screenupNo;
	}
	public void setScreenupNo(int screenupNo) {
		this.screenupNo = screenupNo;
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public String getScreenNo() {
		return screenNo;
	}
	public void setScreenNo(String screenNo) {
		this.screenNo = screenNo;
	}
	public Date getScreenupStartdate() {
		return screenupStartdate;
	}
	public void setScreenupStartdate(Date screenupStartdate) {
		this.screenupStartdate = screenupStartdate;
	}
	public Date getScreenupEnddate() {
		return screenupEnddate;
	}
	public void setScreenupEnddate(Date screenupEnddate) {
		this.screenupEnddate = screenupEnddate;
	}
	public Date getSelectedDate() {
		return selectedDate;
	}
	public void setSelectedDate(Date selectedDate) {
		this.selectedDate = selectedDate;
	}
	@Override
	public String toString() {
		return "Screenup [movieName=" + movieName + ", movieRating=" + movieRating + ", movieRelease=" + movieRelease
				+ ", movieImage=" + movieImage + ", cinemaName=" + cinemaName + ", screenName=" + screenName
				+ ", cinemaNo=" + cinemaNo + ", screenupNo=" + screenupNo + ", movieNo=" + movieNo + ", screenNo="
				+ screenNo + ", screenupStartdate=" + screenupStartdate + ", screenupEnddate=" + screenupEnddate
				+ ", selectedDate=" + selectedDate + "]";
	}
}
