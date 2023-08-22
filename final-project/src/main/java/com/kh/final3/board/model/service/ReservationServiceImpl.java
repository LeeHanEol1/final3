package com.kh.final3.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.final3.board.model.dao.ReservationDao;
import com.kh.final3.board.model.vo.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 회의실 예약 현황 조회
	@Override
	public ArrayList<Reservation> selectReservationList() {
		return reservationDao.selectReservationList(sqlSession);
	}
	// 회의실 예약 등록
	@Override
	public int enrollMeetingRoomRev(Reservation rv) {
		return reservationDao.enrollMeetingRoomRev(sqlSession, rv);
	}
	// 회의실 예약 수정
	@Transactional
	@Override
	public int updateMeetingRoomRev(Reservation rv) {
		int result1 = reservationDao.updateMeetingRoomRev(sqlSession, rv);
		int result2 = reservationDao.updateMeetingRoomCode(sqlSession, rv);
		return result1 * result2;
	}
	// 회의실 예약 삭제
	@Transactional
	@Override
	public int deleteMeetingRoomRev(int reservationNo) {
		int result1 = reservationDao.deleteMeetingRoomRev(sqlSession, reservationNo);
		int result2 = reservationDao.deleteMeetingRoomCode(sqlSession, reservationNo);
		return result1 * result2;
	}

	
}
