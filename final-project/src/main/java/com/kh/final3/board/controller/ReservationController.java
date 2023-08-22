package com.kh.final3.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.final3.board.model.service.ReservationService;
import com.kh.final3.board.model.vo.Reply;
import com.kh.final3.board.model.vo.Reservation;

@Controller
@RequestMapping(value = {"/member", "/admin"})
public class ReservationController {
	
	@Autowired
	public ReservationService reservationService;
	
	// 페이지 이동
	@RequestMapping("list.re")
	public String reservationList() {
		return "board/reservation/reservation";
	}
	
	// 회의실 예약 조회
	@ResponseBody
	@RequestMapping(value = "mrrevList.re", produces = "application/json; charset=UTF-8")
	public String selectReservationList() {
		ArrayList<Reservation> list = reservationService.selectReservationList();
		return new Gson().toJson(list);
	}
	// 회의실 예약 등록
	@ResponseBody
	@RequestMapping("mrrev.re")
	public String enrollMeetingRoomRev(Reservation rv) {
		int result = reservationService.enrollMeetingRoomRev(rv);
		return (result > 0) ? "success" : "fail";
	}
	// 회의실 예약 수정
	@ResponseBody
	@RequestMapping("updatemrrev.re")
	public String updateMeetingRoomRev(Reservation rv) {
		int result = reservationService.updateMeetingRoomRev(rv);
		return (result > 0) ? "success" : "fail";
	}
	// 회의실 예약 취소
	@ResponseBody
	@RequestMapping("deletemrrev.re")
	public String deleteMeetingRoomRev(int reservationNo) {
		int result = reservationService.deleteMeetingRoomRev(reservationNo);
		return (result > 0) ? "success" : "fail";
	}

}
