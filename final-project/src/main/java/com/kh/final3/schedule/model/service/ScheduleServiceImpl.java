package com.kh.final3.schedule.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.final3.approval.model.vo.Leave;
import com.kh.final3.schedule.model.dao.ScheduleDao;
import com.kh.final3.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	//부서 일정 등록 메소드
	@Override
	public int addSchedule(Schedule deptSc) {
		
		return scheduleDao.addSchedule(sqlSession, deptSc);
	}
	
	//부서 일정 조회 메소드 
	@Override
	public ArrayList<Schedule> getSchedule(String deptCode) {

		return scheduleDao.getSchedule(sqlSession,deptCode);
	}
	
	//부서 일정 수정 메소드 
	@Override
	public int updateSchedule(Schedule deptSc) {
		
		return scheduleDao.updateSchedule(sqlSession, deptSc);
	}
	
	//부서 일정 삭제 메소드
	@Override
	public int deleteSchedule(String scheduleNo) {

		return scheduleDao.deleteSchedule(sqlSession, scheduleNo);
	}
	
	//부서 내 휴가 조회 메소드 
	@Override
	public ArrayList<Leave> getLeaveSchedule(String deptCode) {

		return scheduleDao.getLeaveSchedule(sqlSession, deptCode);
	}
	
	//회사일정 조회 메소드
	@Override
	public ArrayList<Schedule> selectAllList(String scheduleType) {

		return scheduleDao.selectAllList(sqlSession,scheduleType);
	}

	//회사일정 수정 메소드 
	@Override
	public int updateAllSchedule(Schedule schedule) {

		return scheduleDao.updateAllSchedule(sqlSession,schedule);
	}
	
	//회사일정 삭제 메소드 
	@Override
	public int deleteAllSchedule(Schedule schedule) {

		return scheduleDao.deleteAllSchedule(sqlSession, schedule);
	}

	//개인 일정 조회 메소드 
	@Override
	public ArrayList<Schedule> selectUserSchedule(Schedule schedule) {
		
		return scheduleDao.selectUserSchedule(sqlSession, schedule);
	}
	
	//개인 일정 수정 메소드 
	@Override
	public int updateUserSchedule(Schedule schedule) {

		return scheduleDao.updateUserSchedule(sqlSession, schedule);
	}
	
	//개인 일정 삭제 메소드 
	@Override
	public int deleteUserSchedule(Schedule schedule) {
		
		return scheduleDao.deleteUserSchedule(sqlSession, schedule);
	}
	
	


}
