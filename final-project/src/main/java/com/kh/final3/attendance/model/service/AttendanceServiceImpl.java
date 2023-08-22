package com.kh.final3.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.final3.approval.model.vo.Leave;
import com.kh.final3.attendance.model.dao.AttendanceDao;
import com.kh.final3.attendance.model.vo.AttRequest;
import com.kh.final3.attendance.model.vo.Attendance;
import com.kh.final3.attendance.model.vo.Record;
import com.kh.final3.common.vo.PageInfo;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	private AttendanceDao attendanceDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Attendance> attendanceList(int userNo) {
		return attendanceDao.attendanceList(sqlSession, userNo);
	}

	// 오늘의 근무계획 불러오기
	@Override
	public Attendance attendanceMain(int userNo) {
		return attendanceDao.attendanceMain(sqlSession, userNo);
	}

	@Override
	public int insertTodo(Attendance att) {
		return attendanceDao.insertTodo(sqlSession, att);
	}

	@Override
	public int updateTodo(Attendance att) {
		return attendanceDao.updateTodo(sqlSession, att);
	}

	@Override
	public Attendance selectTodo(int userNo) {
		return attendanceDao.selectTodo(sqlSession, userNo);
	}
	// 휴가리스트 불러오기
	@Override
	public ArrayList<Leave> selectLeaveList(int userNo) {
		return attendanceDao.selectLeaveList(sqlSession, userNo);
	}

	@Override
	public Record selectAtt(Attendance att) {
		return attendanceDao.selectAtt(sqlSession, att);
	}

	@Override
	public Attendance selectLeave(Attendance att) {
		return attendanceDao.selectLeave(sqlSession, att);
	}
	// 근무 정정 신청
	@Override
	public int insertRequest(AttRequest ar) {
		return attendanceDao.insertRequest(sqlSession, ar);
	}
	// 근무 정정 신청 리스트 조회
	@Override
	public ArrayList<AttRequest> selectMyRequestList(PageInfo pi, int userNo) {
		return attendanceDao.selectMyRequestList(sqlSession, pi, userNo);
	}
	// 전체 근무 정정 신청 리스트 조회
	@Override
	public ArrayList<AttRequest> selectRequestList(PageInfo pi) {
		return attendanceDao.selectRequestList(sqlSession, pi);
	}
	// 근무 정정 체크 승인
	@Override
	@Transactional
	public int approveAtt(ArrayList<Attendance> list) {
		// 1. 기존 근무 ano들고가서  request status y로 바꾸어 승인처리
		// 2. 기존 근무 ano들고가서 record status n으로 바꾸어 실적취소
		// 3. 새로운 근무 정보 들고가서 record insert처리 
		int result1 = 1;
		int result2 = 1;
		int result3 = 1;
		
		for(Attendance att : list){
			result1 *= attendanceDao.approveAtt(sqlSession, att.getAttRecordNo());
			result2 *= attendanceDao.cancleRecord(sqlSession, att.getAttRecordNo());
			result3 *= attendanceDao.insertAttendance(sqlSession, att);
		}
		return result1*result2*result3;
	}
	// 근무정정체크반려
	@Override
	@Transactional
	public int rejectAtt(int[] checkBoxArr) {
		int result = 1;
		for(int refAtno : checkBoxArr) {
			result *= attendanceDao.rejectAtt(sqlSession, refAtno);
		}
		return result;
	}
	// 나의 근무 정정 글 갯수
	@Override
	public int selectMyRequestListCount(int userNo) {
		return attendanceDao.selectMyRequestListCount(sqlSession, userNo);
	}
	// 전체 근무 정정 글 갯수
	@Override
	public int selectRequestListCount() {
		return attendanceDao.selectRequestListCount(sqlSession);
	}
	// 전체 직원 근무 수 카운드
	@Override
	public int selectManagerAttListCount(String selectedDate) {
		return attendanceDao.selectManagerAttListCount(sqlSession, selectedDate);
	}
	// 해당일 직원 근태 목록
	@Override
	public ArrayList<Attendance> selectManagerAttList(PageInfo pi, String selectedDate) {
		return attendanceDao.selectManagerAttList(sqlSession, pi, selectedDate);
	}
	

}
