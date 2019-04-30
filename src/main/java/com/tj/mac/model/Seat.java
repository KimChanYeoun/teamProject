package com.tj.mac.model;

public class Seat {
	private String seatNo;
	private String seatRow;
	private int seatCol;
	public String getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}
	public String getSeatRow() {
		return seatRow;
	}
	public void setSeatRow(String seatRow) {
		this.seatRow = seatRow;
	}
	public int getSeatCol() {
		return seatCol;
	}
	public void setSeatCol(int seatCol) {
		this.seatCol = seatCol;
	}
	@Override
	public String toString() {
		return "Seat [seatNo=" + seatNo + ", seatRow=" + seatRow + ", seatCol=" + seatCol + "]";
	}
}
