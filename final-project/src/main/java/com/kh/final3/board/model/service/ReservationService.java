package com.kh.final3.board.model.service;

import java.util.ArrayList;

import com.kh.final3.board.model.vo.Reservation;

public interface ReservationService {
	// 회의실 예약현황 조회
	ArrayList<Reservation> selectReservationList();
	// 회의실 예약 등록
	int enrollMeetingRoomRev(Reservation rv);
	// 회의실 예약 수정
	int updateMeetingRoomRev(Reservation rv);
	// 회의실 예약 삭제
	int deleteMeetingRoomRev(int reservationNo);

}
