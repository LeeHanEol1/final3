package com.kh.final3.schedule.model.service;

import java.util.ArrayList;


import com.kh.final3.approval.model.vo.Leave;
import com.kh.final3.schedule.model.vo.Schedule;

public interface ScheduleService {

	//부서 스케줄 등록 메소드 
	int addSchedule(Schedule deptSc);

	//부서 스케줄 조회 메소드 
	ArrayList<Schedule> getSchedule(String deptCode);
	
	//부서 일정 수정 메소드 
	int updateSchedule(Schedule deptSc);
	
	//부서 일정 삭제 메소드 
	int deleteSchedule(String scheduleNo);
	
	//부서내 휴가 조회 메소드 
	ArrayList<Leave> getLeaveSchedule(String deptCode);
	
	//회사일정 조회 메소드 
	ArrayList<Schedule> selectAllList(String scheduleType);

	//회사일정 수정 메소드 
	int updateAllSchedule(Schedule schedule);
	
	//회사일정 삭제 메소드 
	int deleteAllSchedule(Schedule schedule);
	
	//개인 일정 조회 메소드 
	ArrayList<Schedule> selectUserSchedule(Schedule schedule);
	
	//개인 일정 수정 메소드 
	int updateUserSchedule(Schedule schedule);
	
	//개인 일정 삭제 메소드 
	int deleteUserSchedule(Schedule schedule);


}
