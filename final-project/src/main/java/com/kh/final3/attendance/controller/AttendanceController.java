package com.kh.final3.attendance.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.final3.approval.model.vo.Leave;
import com.kh.final3.attendance.model.service.AttendanceService;
import com.kh.final3.attendance.model.vo.AttRequest;
import com.kh.final3.attendance.model.vo.Attendance;
import com.kh.final3.attendance.model.vo.Record;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.common.template.Pagination;
import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;

@Controller
@RequestMapping(value = { "/member", "/admin" })
public class AttendanceController {

	@Autowired
	private AttendanceService attendanceService;

	// 오늘의 근무계획 및 출퇴근 데이터 불러오기
	@RequestMapping("userAtt.at")
	public String attendanceMain(HttpSession session, Model model) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		// 출퇴근시간, 근무유형, 투두리스트
		Attendance att = attendanceService.attendanceMain(userNo);
		if (att == null) {
			session.setAttribute("alertMsg", "출근등록 하셨나요?");
		} else {
			model.addAttribute("att", att);
		}
		return "attendance/attendanceMain";
	}

	@ResponseBody
	@RequestMapping(value = "attList.at", produces = "application/json; charset=UTF-8")
	public String attendanceList(int userNo) {
		ArrayList<Attendance> list = attendanceService.attendanceList(userNo);
		return new Gson().toJson(list);
	}

	@ResponseBody
	@RequestMapping("insert.at")
	public String insertTodo(Attendance att) {
		// 작성글이 있으면 수정, 아니면 삽입
		int result = 0;

		if (attendanceService.selectTodo(att.getUserNo()) == null) {
			result = attendanceService.insertTodo(att);
		} else {
			result = attendanceService.updateTodo(att);
		}
		return (result > 0) ? "success" : "fail";
	}

	@ResponseBody
	@RequestMapping(value = "select.at", produces = "text/html; charset=UTF-8")
	public String selectTodo(int userNo) {
		Attendance att = attendanceService.selectTodo(userNo);
		if (att != null) {
			return att.getTodoContent();
		} else {
			return null;
		}
	}

	// 휴가리스트 불러오기
	@ResponseBody
	@RequestMapping(value = "leaveList.at", produces = "application/json; charset=UTF-8")
	public String selectLeaveList(int userNo) {
		ArrayList<Leave> list = attendanceService.selectLeaveList(userNo);
		return new Gson().toJson(list);
	}

	// 근무 실적 계산 - 결과에 하루의 계획과 실적 담아가기(배열)
	@ResponseBody
	@RequestMapping(value = "selectAtt.at", produces = "application/json; charset=UTF-8")
	public String selectAtt(Attendance att) {
		// 신청한 근태유형조회(연차휴가/병가/오전반차/오후반차/휴무일/육아휴직/외근/출장)
		// 조회결과가 없다면 (정상근무)
		Attendance att2 = attendanceService.selectLeave(att);

		Record r = new Record();

		if (att2 == null || att2.getLeaveType().equals("외근") || att2.getLeaveType().equals("출장")) { // 미출근,정상근무,외근,출장 :
																									// 계획 8시간, 실적은 출퇴근시간
			r.setWorkPlan(8 * 60); // 계획(분단위)
			if (attendanceService.selectAtt(att) != null || att2.getLeaveType().equals("정상근무")) {
				r.setWorkRecord(attendanceService.selectAtt(att).getWorkRecord() - 60); // 실적조회(분 단위) - 점심시간제외
			}else {
				r.setWorkRecord(attendanceService.selectAtt(att).getWorkRecord());
			}
		} else if (att2.getLeaveType().equals("오전반차") || att2.getLeaveType().equals("오후반차")) { // 반차근무
			r.setWorkPlan(4 * 60);
			if (attendanceService.selectAtt(att) != null) {
				r.setWorkRecord(attendanceService.selectAtt(att).getWorkRecord()); // 실적조회(분 단위)
			}
		} else { // 휴가, 병가, 휴무일, 육아휴직
			r = null; // 근무 계획 및 실적 없음
		}
		return new Gson().toJson(r);
	}

	// 근무실적 정정 폼
	@RequestMapping("attRequest.at")
	public String insertRequest(AttRequest ar, Model model, HttpSession session) {
		// 이미 신청내역 있는지 refAtno로 조회하면 좋을 것 같음.
		int result = attendanceService.insertRequest(ar);
		if (result > 0) {
			session.setAttribute("alertMsg", "정정신청이 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "죄송합니다. 다시 시도해주세요.");
		}
		return "attendance/attendanceMain";
	}

	// 근무정정신청리스트 페이지로 이동
	@RequestMapping("requestList.at")
	public ModelAndView myRequestList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		int listCount = attendanceService.selectMyRequestListCount(userNo);
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		// 근무 정정 신청 리스트 조회
		ArrayList<AttRequest> list = attendanceService.selectMyRequestList(pi, userNo);
		mv.addObject("pi", pi);	
		mv.addObject("list", list);
		mv.setViewName("attendance/attUpdateRequestList");

		return mv;
	}

	// 근무정정신청 승인 페이지로 이동
	@RequestMapping("approveRequest.at")
	public ModelAndView requestList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		int listCount = attendanceService.selectRequestListCount();
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		// 전체 사원 근무 정정 신청 리스트 조회(미승인인것)
		ArrayList<AttRequest> list = attendanceService.selectRequestList(pi);
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("attendance/approveAttendanceList");
		return mv;
	}

	// 근무정정승인
	@ResponseBody
	@RequestMapping(value = "approveAtt.at")
	public String approveAtt(String checkBoxArr) {

		JsonArray chkarr = new JsonParser().parse(checkBoxArr).getAsJsonArray();

		ArrayList<Attendance> list = new ArrayList<>();

		for (int i = 0; i < chkarr.size(); i++) {
			JsonObject item = chkarr.get(i).getAsJsonObject();
			Attendance attendance = Attendance.builder().attRecordNo(item.get("refAtno").getAsInt())
					.userNo(item.get("userNo").getAsInt()).leaveCode(item.get("leaveCode").getAsString())
					.onTime(item.get("workDate").getAsString() + item.get("updateOnTime").getAsString())
					.offTime(item.get("workDate").getAsString() + item.get("updateOffTime").getAsString()).build();
			list.add(attendance);
		}
		int result = attendanceService.approveAtt(list);

		return (result > 0) ? "Y" : "N";
	}
	// 근무정정반려
	@ResponseBody
	@RequestMapping(value="rejectAtt.at")
	public String rejectAtt(int[] checkBoxArr) {
		int result = attendanceService.rejectAtt(checkBoxArr);
		return (result > 0) ? "Y" : "N";
	}
	// 직원 근태관리 페이지 이동
	@RequestMapping("manageAtt.at")
	public ModelAndView managerSelectAttLsit(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String selectedDate, ModelAndView mv){
		// 근태목록 조회(날짜로 검색)
		int listCount = attendanceService.selectManagerAttListCount(selectedDate);
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
				
		ArrayList<Attendance> list = attendanceService.selectManagerAttList(pi, selectedDate);
		
		mv.addObject("list",list);
		mv.addObject("pi", pi);
		mv.addObject("selectedDate", selectedDate);
		
		mv.setViewName("attendance/attManagement");
		
		return mv;
	}
	

}
