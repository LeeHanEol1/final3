package com.kh.final3.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.final3.alert.model.vo.Alert;
import com.kh.final3.approval.model.vo.Approval;
import com.kh.final3.attendance.model.vo.Attendance;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.main.model.service.MainService;
import com.kh.final3.member.model.vo.Member;
import com.kh.final3.messenger.model.vo.Messenger;
import com.kh.final3.schedule.model.vo.Schedule;
import com.kh.final3.todo.model.vo.Todo;

@RequestMapping(value={"/member","/admin"})
@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;

	@Autowired
	private Todo todo;

	//사용자 메인페이지 이동 
	@RequestMapping("home.ma")
	public String MainHome() {
		return "main/userMain";
	}
	
	//최근 공지 불러오기 
	@ResponseBody
	@RequestMapping(value="mainNoticeList.ma", produces="application/json; charset=UTF-8")
	public String mainNoticeList() {
		ArrayList<Board> mainNotice = mainService.mainNoticeList();
		return new Gson().toJson(mainNotice);
	}
	
	//즐겨찾기  공지 불러오기 
	@ResponseBody
	@RequestMapping(value="mainNoticeLiked.ma", produces="application/json; charset=UTF-8")
	public String mainNoticeLikedList(HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		//System.out.println(userId);
		ArrayList<Board> mainNoticeLiked = mainService.mainNoticeLikedList(userNo);
		//System.out.println(mainNoticeLiked);
		return new Gson().toJson(mainNoticeLiked);
	}
	
	
	//쪽지 불러오기
	@ResponseBody
	@RequestMapping(value="mainMessengerList.ma", produces="application/json; charseet=UTF-8")
	public String mainMessengerList(HttpSession session) {
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		ArrayList<Messenger> mainMessenger = mainService.mainMessengerList(userId);
		
		return new Gson().toJson(mainMessenger);
	}
	
	//임직원조회(Team)
	@ResponseBody
	@RequestMapping(value="mainOthersTeamList.ma", produces="application/json; charset=UTF-8" )
	public String mainOthersTeamList(HttpSession session) {
		Member m = ((Member)session.getAttribute("loginUser"));

		ArrayList<Member> mainMemberTeam = mainService.mainOthersTeamList(m);
		
		return new Gson().toJson(mainMemberTeam);
	}
	
	//임직원조회(ALL)
	@ResponseBody
	@RequestMapping(value="mainOthersAllList.ma", produces="application/json; charset=UTF-8" )
	public String mainOthersAllList(HttpSession session) {
		Member m = ((Member)session.getAttribute("loginUser"));

		ArrayList<Member> mainMemberTeam = mainService.mainOthersAllList(m);
			
		return new Gson().toJson(mainMemberTeam);
	}
	
	//풀 캘린더에서 일정조회 
	@ResponseBody
	@RequestMapping(value="mainCalendar.ma", produces="application/json; charset=UTF-8")
	public String mainCalendarList(HttpSession session) {
		String deptCode = ((Member)session.getAttribute("loginUser")).getDeptCode();
		
		ArrayList<Schedule> list = mainService.mainCalendarList(deptCode);
		
		return new Gson().toJson(list);
	}
	
	//선택한 날짜 일정 조회 
	@ResponseBody
	@RequestMapping(value="mainDailyEvents.ma", method = RequestMethod.POST)
	public ArrayList<Schedule> mainDailyEvents(HttpSession session, @RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("date") int date) {
		String deptCode = ((Member)session.getAttribute("loginUser")).getDeptCode();
		Map<String, Object> params = new HashMap<>();
		params.put("year", year);
		params.put("month", month);
		params.put("date", date);
		params.put("deptCode", deptCode);
		
		ArrayList<Schedule> events = mainService.mainDailyEvents(params);

		return events;
	}
	
	//전자결재 리스트 조회 
	@ResponseBody
	@RequestMapping(value="mainApprovalStatus.ma", produces="application/json; charset=UTF-8")
	public String mainApprovalStatus(HttpSession session) {
		Member m = ((Member)session.getAttribute("loginUser"));
		
		ArrayList<Approval> aList = mainService.mainApprovalStatus(m);

		return new Gson().toJson(aList);
	}
	
	//투두리스트 입력
	@ResponseBody
	@RequestMapping(value="mainInsertTodo.ma", method = RequestMethod.POST)
	public String mainInsertTodo(HttpSession session, String todoContent) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		//Todo td = new Todo();
		todo.setUserNo(userNo);
		todo.setTodoContent(todoContent);
		
		int result = mainService.mainInsertTodo(todo);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//투두 리스트 조회 
	@ResponseBody
	@RequestMapping(value = "selectTodoList.ma", produces = "application/json; charset=UTF-8")
	public String mainSelectTodoList(HttpSession session, int userNo) {
		Member m = ((Member)session.getAttribute("loginUser"));
		m.setUserNo(userNo);
		
		ArrayList<Todo> list = mainService.mainSelectTodoList(m);

		return new Gson().toJson(list);
	}
	
	//투두 수정 
	@ResponseBody
	@RequestMapping(value = "updateTodoList.ma", method = RequestMethod.POST)
	public String updateTodoList(int todoNo, String status) {
		todo.setTodoNo(todoNo);
		todo.setStatus(status);
		
		int result = mainService.updateTodoList(todo);

		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//투두 리스트 한개 삭제 
	@ResponseBody
	@RequestMapping(value = "deleteTodoList.ma", method = RequestMethod.POST)
	public String deleteTodoList(int todoNo) {

		int result = mainService.deleteTodoList(todoNo);
		
		return (result > 0) ? "success" : "fail";
	}
	
	//투두 리스트 모두 삭제 
	@ResponseBody
	@RequestMapping(value = "allDeleteTodoList.ma", method = RequestMethod.POST)
	public String allDeleteTodoList(HttpSession session, int userNo) {
		Member m = ((Member)session.getAttribute("loginUser"));
		m.setUserNo(userNo);
		
		int result = mainService.allDeleteTodoList(m);
		
		return (result > 0) ? "success" : "fail";
	}
	
	//알림 전체 조회 
	@ResponseBody
	@RequestMapping(value = "menuAlertList.ma", produces = "application/json; charset=UTF-8")
	public String menuAlertList(HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		ArrayList<Alert> mainAlert = mainService.menuAlertList(userNo);

		return new Gson().toJson(mainAlert);
	}
	
	//알림 a태그 선택시 상태 변경(읽음 처리)
	@ResponseBody
	@RequestMapping(value = "menuAlertUpdate.ma", method = RequestMethod.POST)
	public String menuAlertUpdate(int alertNo, String status) {
		Alert al = new Alert();
		al.setAlertNo(alertNo);
		al.setStatus(status);
		
		int result = mainService.menuAlertUpdate(al);

		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//알림 전체 삭제
	@ResponseBody
	@RequestMapping(value = "menuAlertAllDelete.ma", method = RequestMethod.POST)
	public String menuAlertAllDelete(HttpSession session, int userNo) {
		Member m = ((Member)session.getAttribute("loginUser"));
		m.setUserNo(userNo);
		
		int result = mainService.menuAlertAllDelete(m);
		
		return (result > 0) ? "success" : "fail";
	}
	
	//출퇴근 조회
	@ResponseBody
	@RequestMapping(value = "mainSelectOnTime.ma", produces = "application/json; charset=UTF-8")
	public String selectOnTime(HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		ArrayList<Attendance> atList = mainService.selectOnTime(userNo);
		//System.out.println(atList);
		return new Gson().toJson(atList);
	}
	
	//출근 등록 
	@ResponseBody
	@RequestMapping(value = "insertOnTime.ma", method = RequestMethod.POST)
	public String insertOnTime(HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		int count = mainService.selectCount(userNo);
		
		//근무계획 조회
		Attendance at = mainService.selectLeaveType(userNo);
		Attendance at2 = new Attendance();
	
		if(at == null) { // 근무계획 없으면
			at2.setUserNo(userNo);
		}else { // 근무계획 있으면
			at2.setUserNo(userNo);
			at2.setLeaveType(at.getLeaveType());
		}
		
		if(count > 0) {
			return "countFail";
		}else {
			int result = mainService.insertOnTime(at2);
			return (result > 0) ? "success" : "fail";
		}
		
	}
	
	//퇴근 등록
	@ResponseBody
	@RequestMapping(value = "insertOffTime.ma", method = RequestMethod.POST)
	public String insertOffTime(HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		int result = mainService.insertOffTime(userNo);
		
		return (result > 0) ? "success" : "fail";
	}
	
	//출근 수정(나중에 완성 시키자)
	@ResponseBody
	@RequestMapping(value = "mainUpdateOnTime.ma", method = RequestMethod.POST)
	public String mainUpdateOnTime(HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		int result = mainService.mainUpdateOnTime(userNo);
		
		return (result > 0) ? "success" : "fail";
	}
	
	//임직원 조회 -> 프로필 모달에서 쪽지 쓰기
	@RequestMapping(value="insertMsg.ma", method=RequestMethod.GET)
	public String msgEnrollForm(@RequestParam("userId") String userId, @RequestParam("userName") String userName, @RequestParam("userNo") String userNo) {
//		System.out.println(userId);
//		System.out.println(userName);
//		System.out.println(userNo);
		return "messenger/msgReplyForm";
	}
	
	//프로필 사진 조회하기
	@ResponseBody
	@RequestMapping(value = "selectProfile.ma", produces = "application/json; charset=UTF-8")
	public String selectProfile(HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<Member> mList = mainService.selectProfile(userNo);

		return new Gson().toJson(mList);
	}
}
