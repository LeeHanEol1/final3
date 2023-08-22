package com.kh.final3.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.final3.board.model.vo.Reservation;

@Repository
public class ReservationDao {
	// 회의실 예약 등록
	public int enrollMeetingRoomRev(SqlSessionTemplate sqlSession, Reservation rv) {
		return sqlSession.insert("reservationMapper.enrollMeetingRoomRev", rv);
	}
	// 회의실 예약 조회
	public ArrayList<Reservation> selectReservationList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("reservationMapper.selectReservationList");
	}
	// 회의실 예약 수정
	public int updateMeetingRoomRev(SqlSessionTemplate sqlSession, Reservation rv) {
		return sqlSession.update("reservationMapper.updateMeetingRoomRev", rv);
	}
	// 회의실 코드 수정
	public int updateMeetingRoomCode(SqlSessionTemplate sqlSession, Reservation rv) {
		return sqlSession.delete("reservationMapper.updateMeetingRoomCode", rv);
	}
	// 회의실 예약 삭제
	public int deleteMeetingRoomRev(SqlSessionTemplate sqlSession, int reservationNo) {
		return sqlSession.update("reservationMapper.deleteMeetingRoomRev", reservationNo);
	}
	// 회의실 코드 삭제
	public int deleteMeetingRoomCode(SqlSessionTemplate sqlSession, int reservationNo) {
		return sqlSession.delete("reservationMapper.deleteMeetingRoomCode", reservationNo);
	}
	
}
