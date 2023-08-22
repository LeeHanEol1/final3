package com.kh.final3.attendance.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.final3.approval.model.vo.Leave;
import com.kh.final3.attendance.model.vo.AttRequest;
import com.kh.final3.attendance.model.vo.Attendance;
import com.kh.final3.attendance.model.vo.Record;
import com.kh.final3.common.vo.PageInfo;

@Repository
public class AttendanceDao {
	// 출퇴근 시간 리스트 불러오기
	public ArrayList<Attendance> attendanceList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.attendanceList", userNo);
	}
	// 오늘의 근무 계획 불러오기
	public Attendance attendanceMain(SqlSessionTemplate sqlSession, int userNo) {
		return (Attendance) sqlSession.selectOne("attendanceMapper.attendanceMain", userNo);
	}
	public int insertTodo(SqlSessionTemplate sqlSession, Attendance att) {
		return sqlSession.insert("attendanceMapper.insertTodo", att);
	}
	public int updateTodo(SqlSessionTemplate sqlSession, Attendance att) {
		return sqlSession.update("attendanceMapper.updateTodo", att);
	}
	public Attendance selectTodo(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("attendanceMapper.selectTodo", userNo);
	}
	public ArrayList<Leave> selectLeaveList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectLeaveList", userNo);
	}
	// 실적조회
	public Record selectAtt(SqlSessionTemplate sqlSession, Attendance att) {
		return sqlSession.selectOne("attendanceMapper.selectAtt", att);
	}
	// 근태유형조회
	public Attendance selectLeave(SqlSessionTemplate sqlSession, Attendance att) {
		return sqlSession.selectOne("attendanceMapper.selectLeave", att);
	}
	// 근무 정정 신청
	public int insertRequest(SqlSessionTemplate sqlSession, AttRequest ar) {
		return sqlSession.insert("attendanceMapper.insertRequest", ar);
	}
	// 나의 근무 정정 신청 리스트 조회
	public ArrayList<AttRequest> selectMyRequestList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectMyRequestList", userNo, rowBounds);
	}
	// 전체 근무 정정신청 리스트 조회
	public ArrayList<AttRequest> selectRequestList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectRequestList", null, rowBounds);
	}
	// 근무 정정 체크 승인
	// 1. 기존 근무 ano들고가서  request status y로 바꾸어 승인처리
	public int approveAtt(SqlSessionTemplate sqlSession, int refAtno) {
		return sqlSession.update("attendanceMapper.approveAtt", refAtno);
	}
	
	// 2. 기존 근무 ano들고가서 record status n으로 바꾸어 실적취소
	public int cancleRecord(SqlSessionTemplate sqlSession, int attRecordNo) {
		return sqlSession.update("attendanceMapper.cancleRecord", attRecordNo);
	}
	// 3. 새로운 근무 정보 들고가서 record insert처리 
	public int insertAttendance(SqlSessionTemplate sqlSession, Attendance att) {
		return sqlSession.insert("attendanceMapper.insertAttendance", att);
	}
	// 근무정정 체크 반려
	public int rejectAtt(SqlSessionTemplate sqlSession, int refAtno) {
		return sqlSession.update("attendanceMapper.rejectAtt", refAtno);
	}
	// 나의 근무정정 글갯수
	public int selectMyRequestListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("attendanceMapper.selectMyRequestListCount", userNo);
	}
	// 전체 근무정정 글갯수
	public int selectRequestListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("attendanceMapper.selectRequestListCount");
	}
	// 전체 직원 오늘 근무 수 카운트
	public int selectManagerAttListCount(SqlSessionTemplate sqlSession, String selectedDate) {
		return sqlSession.selectOne("attendanceMapper.selectManagerAttListCount", selectedDate);
	}
	// 해당일 직원 근태 목록
	public ArrayList<Attendance> selectManagerAttList(SqlSessionTemplate sqlSession, PageInfo pi, String selectedDate) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectManagerAttList", selectedDate, rowBounds);
	}

}
