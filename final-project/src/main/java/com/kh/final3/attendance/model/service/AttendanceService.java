package com.kh.final3.attendance.model.service;

import java.util.ArrayList;

import com.kh.final3.approval.model.vo.Leave;
import com.kh.final3.attendance.model.vo.AttRequest;
import com.kh.final3.attendance.model.vo.Attendance;
import com.kh.final3.attendance.model.vo.Record;
import com.kh.final3.common.vo.PageInfo;

public interface AttendanceService {

	ArrayList<Attendance> attendanceList(int userNo);
	
	// 오늘의 근무계획 불러오기
	Attendance attendanceMain(int userNo);

	int insertTodo(Attendance att);

	int updateTodo(Attendance att);

	Attendance selectTodo(int userNo);
	
	//휴가리스트 불러오기
	ArrayList<Leave> selectLeaveList(int userNo);

	Record selectAtt(Attendance att);
	// 해당일 근태유형
	Attendance selectLeave(Attendance att);
	// 근무정정신청
	int insertRequest(AttRequest ar);
	// 근무정정신청 리스트 조회
	ArrayList<AttRequest> selectMyRequestList(PageInfo pi, int userNo);
	// 전체 근무정정신청 리스트 조회
	ArrayList<AttRequest> selectRequestList(PageInfo pi);
	// 근무정정신청 체크 승인
	int approveAtt(ArrayList<Attendance> list);
	// 근무정정신청 체크 반려
	int rejectAtt(int[] checkBoxArr);
	// 나의 근무 신청 글 갯수
	int selectMyRequestListCount(int userNo);
	// 전체 근무 신청 글 갯수
	int selectRequestListCount();
	// 전체 직원 근태 수 카운트
	int selectManagerAttListCount(String selectedDate);
	// 해당일 직원 근태 목록
	ArrayList<Attendance> selectManagerAttList(PageInfo pi, String selectedDate);
	
	

}
