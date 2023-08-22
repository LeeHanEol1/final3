package com.kh.final3.messenger.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.final3.common.template.Pagination;
import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;
import com.kh.final3.messenger.model.service.MessengerService;
import com.kh.final3.messenger.model.vo.Messenger;

@Controller
@RequestMapping(value = {"/member", "/admin"})
public class MessengerController {

	@Autowired
	MessengerService msgService;
	
	//쪽지 페이지로 이동 메소드(받은쪽지함)
	@RequestMapping("list.mg")
	public String recvList(@RequestParam(value="currentPage",defaultValue="1") int currentPage, 
						   @RequestParam(value="keyword", defaultValue="") String keyword,
						   @RequestParam(value="category", defaultValue="") String category,
						   @RequestParam(value="startDate", defaultValue="") String startDate, 
						   @RequestParam(value="endDate", defaultValue="")  String endDate, HttpSession session, Model model){

		HashMap <String, Object> key = new HashMap<>();
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		key.put("keyword",keyword);
		key.put("userNo", userNo);
		key.put("category", category);
		key.put("startDate",startDate);
		key.put("endDate", endDate);
		
		int listCount = 0;
		int pageLimit =10;
		int boardLimit = 5;
		
		PageInfo pi = new PageInfo();
		ArrayList<Messenger> msgList = new ArrayList <>();
 		if(category.equals("")) { //검색조건이 비어있을경우 전체조회 
			listCount = msgService.recvListCount(userNo);
			pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			//페이지 정보 + 로그인 회원 번호 가지고 받은 쪽지 목록 조회해오기 
			msgList = msgService.selectRecvList(pi, userNo);
			
		}else { //검색조건이 있을경우 
			listCount = msgService.selectSearchListCount(key);
			pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			msgList = msgService.selectSearchList(key, pi);

			model.addAttribute("keyword", keyword);
			model.addAttribute("category", category);
			model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
		}
		
		model.addAttribute("msgList", msgList);
		model.addAttribute("pi",pi);
		
		
		return "messenger/receiveListView";
	}
	
	//보낸 편지함 목록 조회 
	@RequestMapping(value="slist.mg")
	public String sendList(@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
						   @RequestParam(value="keyword", defaultValue="") String keyword,
						   @RequestParam(value="category", defaultValue="") String category,
						   @RequestParam(value="startDate", defaultValue="") String startDate,
						   @RequestParam(value="endDate", defaultValue="") String endDate, HttpSession session, Model model) {
		
		HashMap <String, Object> key = new HashMap<>();
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		key.put("keyword",keyword);
		key.put("userNo", userNo);
		key.put("category", category);
		key.put("startDate",startDate);
		key.put("endDate", endDate);
		
		int listCount = 0;
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = new PageInfo();
		ArrayList<Messenger> msgList = new ArrayList <>();
		
		if(category.equals("")) { //검색조건이 비어있을경우 전체조회 
			listCount = msgService.sendListCount(userNo);
			pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			msgList = msgService.selectSendList(pi, userNo);
		
		}else { //검색조건이 있을경우 조회 
			listCount = msgService.sendSearchListCount(key);
			pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			msgList = msgService.sendSearchList(key,pi);
			model.addAttribute("keyword", keyword);
			model.addAttribute("category", category);
			model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
		}
		
		model.addAttribute("msgList", msgList);
		model.addAttribute("pi", pi);
		
		return "messenger/sendListView";
	}
	
	//휴지통 목록 조회 
	@RequestMapping(value="tlist.mg")
	public String trashList(@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
						    @RequestParam(value="keyword", defaultValue="") String keyword,
						    @RequestParam(value="category", defaultValue="") String category,
						    @RequestParam(value="startDate", defaultValue="") String startDate,
						    @RequestParam(value="endDate", defaultValue="") String endDate, HttpSession session, Model model) {
		HashMap <String, Object> key = new HashMap<>();
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		key.put("keyword",keyword);
		key.put("userNo", userNo);
		key.put("category", category);
		key.put("startDate",startDate);
		key.put("endDate", endDate);
		
		int listCount = 0;
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = new PageInfo();
		ArrayList<Messenger> tList = new ArrayList <>();
		if(category.equals("")) {
			listCount = msgService.trashListCount(userNo);
			pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			tList = msgService.selectTrashList(pi,userNo);
		
		}else {
			
			listCount = msgService.trashSearchListCount(key);
			pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit); 
			tList = msgService.trashSearchList(key,pi);
			model.addAttribute("keyword", keyword);
			model.addAttribute("category", category);
			model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
		}
		
		
		model.addAttribute("tList", tList);
		model.addAttribute("pi",pi);
		
		return "messenger/trashListView";
	}
	
	//쪽지 작성 페이지로 이동
	@RequestMapping(value="insert.mg", method=RequestMethod.GET)
	public String msgEnrollForm() {
		
		return "messenger/msgEnrollForm";
	}
	
	//주소록 검색 목록 조회 메소드
	@ResponseBody
	@RequestMapping(value="searchName.mg", produces="application/json; UTF-8")
	public String searchName(String keyword, String deptCode) {
		
		HashMap<String, String> key = new HashMap<>(); 
		
		key.put("keyword", keyword);
		key.put("deptCode", deptCode);
		
		ArrayList<Member> mList = msgService.searchName(key);
		
		return new Gson().toJson(mList);
	}
	
	//쪽지 작성 메소드 
	@RequestMapping(value="insert.mg", method=RequestMethod.POST)
	public String insertMessage(Messenger msg, HttpSession session) {
		//메신저 객체 담아줄 list생성 
		ArrayList <Messenger> mList = new ArrayList<>();
		
		for (int i = 0 ; i<msg.getRecvUno().length ; i++ ) {
			//객체 생성 
			Messenger m = new Messenger();

			//배열로 받아온 받는 회원 번호 하나씩 꺼내주기 
			String userNo = (msg.getRecvUno()[i]);
			
			//새로운 객체에 넘겨받은 정보 대입 + userNo 대입  
			m.setSender(msg.getSender());
			m.setReceiver(userNo);
			m.setMsgTitle(msg.getMsgTitle());
			m.setMsgContent(msg.getMsgContent());
			m.setEmcStatus(msg.getEmcStatus());
			
			mList.add(i, m);
		}
		
		int result = msgService.insertMessage(mList);
		
		if(result>0) {
			session.setAttribute("alertMsg", "쪽지 발송이 완료되었습니다.");
		}else {
			session.setAttribute("errorMsg", "쪽지 발송에 실패하였습니다. ");
		}
		
		return "redirect:/member/list.mg";
	}
	
	//쪽지 상세페이지 이동(보낸쪽지)
	@RequestMapping("messenger.mg")
	public ModelAndView detailMessage(int msgNo, ModelAndView mv, HttpSession session) {
		
		//쪽지 내용 조회 메소드 
		Messenger msg = msgService.selectMessage(msgNo);
		
		if(msg != null) {
			mv.addObject("msg", msg).setViewName("messenger/msgDetailView");
		}else {
			session.setAttribute("errorMsg", "조회에 실패하였습니다 다시 시도해 주세요");
			mv.setViewName("redirect:/member/slist.mg");
		}
		
		return mv;
	}
	
	//쪽지 상세페이지 이동(받은 쪽지/읽음처리를 위해서 메소드 따로 생성)
	@RequestMapping("recvMessage.mg")
	public ModelAndView recvMessage(int msgNo, ModelAndView mv, HttpSession session) {
		
		int result = msgService.updateReadStatus(msgNo);
		
		if(result>0) {
			//쪽지 내용 조회
			Messenger msg = msgService.selectMessage(msgNo);
			mv.addObject("msg", msg).setViewName("messenger/msgDetailView");
		}else {
			session.setAttribute("errorMsg", "조회에 실패하였습니다 다시 시도해 주세요");
			mv.setViewName("redirect:/member/slist.mg");
		}
		
		return mv;
	}
	
	//받은 쪽지 선택 삭제 
	@RequestMapping("recvMsgUpdate.mg")
	@ResponseBody
	public String recvMsgDelete(int[] msgNoArr, HttpSession session) {

		int result = msgService.recvMsgUpdate(msgNoArr);
		
		if(result > 0 ) {
			return "YYYY";
		}else {
			
			return "NNNN";
		}
	}
	
	//보낸 쪽지 선택 삭제 
	@RequestMapping("sendMsgUpdate.mg")
	@ResponseBody
	public String sendMsgUpdate(int[] msgNoArr, HttpSession session) {

		int result = msgService.sendMsgUpdate(msgNoArr);
		
		if(result > 0 ) {
			return "YYYY";
		}else {
			
			return "NNNN";
		}
	}
	
	//받은 쪽지 선택 복구 
	@RequestMapping("recvMsgRecover.mg")
	@ResponseBody
	public String recvMsgRecover(int[] msgNoArr, HttpSession session) {
		
		int result = msgService.recvMsgRecover(msgNoArr);
		
		if(result > 0 ) {
			return "YYYY";
		}else {
			
			return "NNNN";
		}
		
	}
	
	//보낸 쪽지 선택 복구 
	@RequestMapping("sendMsgRecover.mg")
	@ResponseBody
	public String sendMsgRecover(int[] msgNoArr, HttpSession session) {
		
		int result = msgService.sendMsgRecover(msgNoArr);
		
		if(result > 0 ) {
			return "YYYY";
		}else {
			
			return "NNNN";
		}
		
	}
	
	//답장하기 메소드 
	@RequestMapping("relpyMsg.mg")
	public ModelAndView replyMsg(int msgNo, ModelAndView mv, HttpSession session) {
		
		Messenger m = msgService.selectMessage(msgNo);
		
		if(m != null) {
			mv.addObject("m", m).setViewName("messenger/msgReplyForm");
			
		}else {
			session.setAttribute("errorMsg", "답장하기 페이지로 이동이 실패하였습니다 다시 시도해주세요");
			mv.setViewName("redirect:/member/list.mg");
		}
		
		return mv;
	}
	
	//읽지않은 쪽지 개수 조회(받은 쪽지함)
	@ResponseBody
	@RequestMapping("countRecvMsg.mg")
	public int countRecvMsg(int userNo) {
		
		int count = msgService.selectCountRecvMsg(userNo);
		
		return count;
	}
	
	//삭제된 쪽지 개수 조회(휴지통)
	@ResponseBody
	@RequestMapping("countTrashMsg.mg")
	public int countTrashMsg(int userNo) {
		
		int count = msgService.trashListCount(userNo);
		
		return count;
	}
}
