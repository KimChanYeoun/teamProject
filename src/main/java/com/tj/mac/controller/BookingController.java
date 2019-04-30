package com.tj.mac.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tj.mac.model.Booking;
import com.tj.mac.model.BookingSeat;
import com.tj.mac.model.Cinema;
import com.tj.mac.model.Screenup;
import com.tj.mac.model.SeatState;
import com.tj.mac.service.BookingSeatService;
import com.tj.mac.service.BookingService;
import com.tj.mac.service.CinemaService;
import com.tj.mac.service.MemberService;
import com.tj.mac.service.MovieService;
import com.tj.mac.service.ScreenupService;
import com.tj.mac.service.SeatStateService;

@Controller
@RequestMapping("booking")
public class BookingController {
	@Autowired
	private BookingService bookingService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private CinemaService cinemaService;
	@Autowired
	private ScreenupService screenupService;
	@Autowired
	private SeatStateService seatStateService;
	@Autowired
	private BookingSeatService bookingSeatService;
	@Autowired
	private MemberService memberService;
	@RequestMapping(params="method=insertForm")
	public String insertForm(Model model) {
		model.addAttribute("movieList", movieService.selectMovie());
		return "booking/insertForm";
	}
	@RequestMapping(params="method=selectedMovie")
	@ResponseBody
	public List<Cinema> selectedMovie(int movieNo){
		return cinemaService.selectCinema(movieNo);
	}
	@RequestMapping(params="method=selectedCinema")
	@ResponseBody
	public List<Date> selectedCinema(Screenup screenup){
		return screenupService.selectDate(screenup);
	}
	@RequestMapping(params="method=selectedDate")
	@ResponseBody
	public List<Screenup> selectedDate(Screenup screenup){
		return screenupService.selectScreen(screenup);
	}
	@RequestMapping(params="method=selectedAll")
	@ResponseBody
	public Screenup selectedAll(Screenup screenup) {
		return screenupService.selectedAll(screenup);
	}
	@RequestMapping(params="method=insertForm2")
	public String insertForm2(int movieNo, SeatState seatState , Model model) {
		model.addAttribute("movie", movieService.getMovie(movieNo));
		return "booking/insertForm2";
	}
	@RequestMapping(params="method=getSeatState")
	@ResponseBody
	public List<String> getSeatState(SeatState seatState){
		return seatStateService.getSeatState(seatState);
	}
	@RequestMapping(params="method=checkSeatState")
	@ResponseBody
	public int checkSeatState(SeatState seatState, String[] seatNo) {
		int result = 0;
		for(String sn : seatNo) {
			seatState.setSeatNo(sn);
			if(!seatStateService.getSeatState(seatState).isEmpty()) {
				result = 1;
			}
		}
		return result;
	}
	@RequestMapping(params="method=payment")
	public String payment(SeatState seatState, String[] seatNo, int movieNo, Model model) {
		List<String> seatNoList = new ArrayList<String>();
		for(String sn : seatNo) {
			seatState.setSeatNo(sn);
			seatStateService.insertSeatState(seatState);
			seatNoList.add(sn);
		}
		model.addAttribute("seatNo", seatNoList);
		model.addAttribute("movie", movieService.getMovie(movieNo));
		return "booking/payment";
	}
	@RequestMapping(params="method=cancelPayment")
	public String cancelPayment(SeatState seatState, String[] seatNo) {
		for(String sn : seatNo) {
			seatState.setSeatNo(sn);
			seatStateService.deleteSeatState(seatState);
		}
		return "redirect:main.do";
	}
	@RequestMapping(params="method=insert")
	public String insert(Booking booking, BookingSeat bookingSeat, String[] seatNo, Model model, HttpSession httpSession) {
		int result = bookingService.insertBooking(booking);
		bookingSeat.setBookingNo(bookingService.getLastBookingNo());
		for(String sn : seatNo) {
			bookingSeat.setSeatNo(sn);
			bookingSeatService.insertBookingSeat(bookingSeat);
		}
		if(booking.getUsePoint()!=0) {
			bookingService.usePoint(booking);
		}
		if(booking.getResultPrice()!=0) {
			bookingService.savePoint(booking);
		}
		bookingService.accumulateAmount(booking);
		bookingService.upMemberGrade(booking.getMemberId());
		httpSession.setAttribute("member", memberService.getMember(booking.getMemberId()));
		if(result==1) {
			model.addAttribute("msg", "결제완료");
		} else {
			model.addAttribute("msg", "결제실패");
		}
		return "redirect:main.do";
	}
}
