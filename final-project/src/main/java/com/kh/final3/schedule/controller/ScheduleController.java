package com.kh.final3.schedule.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.final3.approval.model.vo.Leave;
import com.kh.final3.schedule.model.service.ScheduleService;
import com.kh.final3.schedule.model.vo.Schedule;

@Controller
@RequestMapping(value = {"/member", "/admin"})
public class ScheduleController {

	@Autowired
	private ScheduleService scheduleService;
	
	//페이지 이동 메소드 
	@RequestMapping("schedule.sc")
	public String scheduleHome() {
		
		return "schedule/deptSchedule";
	}
	
	//관리자 스케줄관리 페이지 이동 메소드 
	@RequestMapping("schedule.ad")
	public String adminScheduleHome() {
		
		return "schedule/companySchedule";
	}
	
	//개인 스케줄관리 페이지 이동 메소드 
	@RequestMapping("personalSchedule.sc")
	public String userScheduleHome() {
		
		return "schedule/userSchedule";
	}
	
	//일정 등록 메소드 
	@ResponseBody
	@RequestMapping(value="addSchedule.sc")
	public String addSchedule(Schedule deptSc) {
		
		int result = scheduleService.addSchedule(deptSc);
		
		return (result>0)? "YYYY" :"NNNN";
		
	}
	
	//일정 조회 메소드
	@ResponseBody
	@RequestMapping(value ="getSchedule.sc", produces = "application/json; UTF-8")
	public String getSchedule(String deptCode) {
		
		ArrayList <Schedule> deptList = scheduleService.getSchedule(deptCode);
		
		return new Gson().toJson(deptList);
	}
	
	//일정 수정 메소드 
	@ResponseBody
	@RequestMapping(value="updateSchedule.sc")
	public String updateSchedule(Schedule deptSc) {
		
		int result = scheduleService.updateSchedule(deptSc);
		
		return (result>0)? "YYYY" :"NNNN";
	}
	
	//일정 삭제 메소드 
	@ResponseBody
	@RequestMapping(value="deleteSchedule.sc")
	public String deleteSchedule(String scheduleNo) {
		
		int result = scheduleService.deleteSchedule(scheduleNo);
		
		return (result>0)? "YYYY" :"NNNN";
		
	}
	
	//부서내 휴가 조회 메소드 
	@ResponseBody
	@RequestMapping(value="getLeaveSchedule.sc", produces = "application/json; UTF-8")
	public String getLeaveSchedule(String deptCode) {
		ArrayList<Leave> deptLeaveList = scheduleService.getLeaveSchedule(deptCode);
		
		return new Gson().toJson(deptLeaveList); 
	}
	
	//회사일정 등록 메소드 
	@ResponseBody
	@RequestMapping("addSchedule.ad")
	public String addAllSchedule(Schedule schedule) {
		
		int result = scheduleService.addSchedule(schedule);

		return (result>0)? "YYYY" :"NNNN";
	}
	
	
	//회사일정 조회 메소드 
	@ResponseBody
	@RequestMapping(value="selectSchedule.ad", produces = "application/json; UTF-8")
	public String selectAllSchedule(String scheduleType) {
		
		ArrayList<Schedule> allList = scheduleService.selectAllList(scheduleType);
		
		return new Gson().toJson(allList);
	}
	
	//회사일정 수정 메소드 
	@ResponseBody
	@RequestMapping("updateSchedule.ad")
	public String updateAllSchedule(Schedule schedule) {
		
		int result = scheduleService.updateAllSchedule(schedule);
		
		return (result>0)? "YYYY" : "NNNN";
	}
	
	//회사일정 삭제 메소드 
	@ResponseBody
	@RequestMapping("deleteSchedule.ad")
	public String deleteAllSchedule(Schedule schedule) {
		
		int result = scheduleService.deleteAllSchedule(schedule);
		
		return (result>0)? "YYYY":"NNNN";
	}
	
	//회원 일정 조회 메소드 
	@ResponseBody
	@RequestMapping(value="getUserSchedule.sc", produces = "application/json; UTF-8")
	public String getUserSchedule(int userNo, Schedule schedule) {
		
		ArrayList <Schedule> userList = scheduleService.selectUserSchedule(schedule);
		
		return new Gson().toJson(userList);
	}
	
	//회원 일정 등록 메소드 
	@ResponseBody
	@RequestMapping("addUserSchedule.sc")
	public String addUserSchedule(Schedule schedule) {
		
		int result = scheduleService.addSchedule(schedule);
		
		return (result > 0) ? "YYYY" : "NNNN";
	}
	
	//회원 일정 수정 메소드
	@ResponseBody
	@RequestMapping("updateUserSchedule.sc")
	public String updateUserSchedule(Schedule schedule) {
		
		int result = scheduleService.updateUserSchedule(schedule);
		
		return (result >0)? "YYYY" : "NNNN";
	}

	//회원 일정 삭제 메소드 
	@ResponseBody
	@RequestMapping("deleteUserSchedule.sc")
	public String deleteUserSchedule(Schedule schedule) {
		
		int result = scheduleService.deleteUserSchedule(schedule);
		
		return (result > 0) ? "YYYY" : "NNNN";
	}

}
