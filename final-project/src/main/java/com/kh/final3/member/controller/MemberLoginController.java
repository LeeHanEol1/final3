package com.kh.final3.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.final3.member.model.service.MemberService;
import com.kh.final3.member.model.vo.Member;

@Controller
public class MemberLoginController {
	
	@Autowired
	private MemberService memberService;
	
	//관리자 가입 페이지로 이동
	@GetMapping("/adminEnroll")
	public String adminEnrollForm() {
		
		return "member/adminEnrollForm";
	}
	
	//회원 가입 페이지로 이동
	@GetMapping("/memberEnroll")
	public String memberEnrollForm() {
		
		return "member/memberEnrollForm";
	}
	
	@GetMapping("/secu/loginPage")
	public void loginInput(String error, String logout, Model model){

	    if(error != null){
	    	model.addAttribute("error", "로그인 에러: 계정을 확인하십쇼.");
	    }
	    if(logout != null){
	    	model.addAttribute("logout", "로그아웃됨");
	    }
	}
	
	//관리자 가입
	@PostMapping("/adminInsert")
	public ModelAndView insertAdmin(ModelAndView mv, Member member, HttpSession session) {
		
		int result = memberService.adminInsert(member);
		
		if(result>0) {
			mv.setViewName("redirect:/");
		}else {
			
		}
		
		return mv;
	}
}
