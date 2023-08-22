package com.kh.final3.schedule.model.dao;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.final3.approval.model.vo.Leave;
import com.kh.final3.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {
	
	//부서 일정 등록 메소드 
	public int addSchedule(SqlSession sqlSession, Schedule deptSc) {

		return sqlSession.insert("scheduleMapper.addSchedule", deptSc);
	}

	//부서 일정 조회 메소드 
	public ArrayList<Schedule> getSchedule(SqlSession sqlSession, String deptCode) {

		return (ArrayList)sqlSession.selectList("scheduleMapper.getSchedule", deptCode);
	}

	//부서 일정 수정 메소드
	public int updateSchedule(SqlSession sqlSession, Schedule deptSc) {

		return sqlSession.update("scheduleMapper.updateSchedule", deptSc);
	}
	
	//부서 일정 삭제 메소드
	public int deleteSchedule(SqlSession sqlSession, String deptSchedule_No) {

		return sqlSession.delete("scheduleMapper.deleteSchedule", deptSchedule_No);
	}

	//부서내 휴가 조회 메소드 	
	public ArrayList<Leave> getLeaveSchedule(SqlSession sqlSession, String deptCode) {

		return (ArrayList)sqlSession.selectList("scheduleMapper.getLeaveSchedule", deptCode);
	}
	
	//회사일정 조회 메소드 
	public ArrayList<Schedule> selectAllList(SqlSession sqlSession, String scheduleType) {
		
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectAllList", scheduleType);
	}
	
	//회사일정 수정메소드
	public int updateAllSchedule(SqlSession sqlSession, Schedule schedule) {
		
		return sqlSession.update("scheduleMapper.updateAllSchedule", schedule);
	}
	
	//회사일정 삭제메소드
	public int deleteAllSchedule(SqlSession sqlSession, Schedule schedule) {

		return sqlSession.update("scheduleMapper.deleteAllSchedule",schedule);
	}
	
	//개인일정 조회 메소드 
	public ArrayList<Schedule> selectUserSchedule(SqlSession sqlSession, Schedule schedule) {

		return (ArrayList)sqlSession.selectList("scheduleMapper.selectUserSchedule", schedule);
	}
	
	//개인일정 수정 메소드 
	public int updateUserSchedule(SqlSession sqlSession, Schedule schedule) {

		return sqlSession.update("scheduleMapper.updateUserSchedule", schedule);
	}
	
	//개인일정 삭제 메소드 
	public int deleteUserSchedule(SqlSession sqlSession, Schedule schedule) {

		return sqlSession.update("scheduleMapper.deleteUserSchedule", schedule);
	}
}
