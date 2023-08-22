package com.kh.final3.member.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.attribute.AclEntry.Builder;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.final3.board.model.service.FreeForumService;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.common.template.Pagination;
import com.kh.final3.common.template.SaveFile;
import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.service.MemberService;
import com.kh.final3.member.model.vo.CustomUserDetails;
import com.kh.final3.member.model.vo.Member;
import com.kh.final3.member.model.vo.MemberAttachment;



@Controller
@RequestMapping(value = {"/member", "/admin", "/manager"})
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/managerPage.me")
	public String managerPage(Principal p, Model model) {
		
		return "main/managerMain";
	}
	
	@GetMapping("/main.me")
	public String mainPage() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		CustomUserDetails userDetails = (CustomUserDetails)principal;
		if(userDetails.getAuth().equals("ROLE_MEMBER")) {
			return "redirect:/member/mainPage.me";
		}else {
			return "redirect:/admin/mainPage.me";
		}
		
	}
	
	@GetMapping("/mainPage.me")
	public ModelAndView MemberLogin(ModelAndView mv, Principal p, HttpSession session) {
		if(session.getAttribute("loginUser") == null) {
			String userId = p.getName();
			Member member = memberService.selectMemberById(userId);
			System.out.println(member);
			session.setAttribute("loginUser", member);
		}
	
		mv.setViewName("main/userMain");
		
		return mv;
	}
	
	@GetMapping({"/myPage.me", "/updateForm.me"})
	public String myPage(Model model, HttpServletRequest request) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUserDetails userDetails = (CustomUserDetails)principal;
		
		String userNo = Integer.toString(userDetails.getUserNo());
		
		Member member = memberService.selectMemberByUserNo(userNo);
		
		int idx = member.getAddress().indexOf("/");
		String mainAddress = member.getAddress().substring(0, idx);
		String subAddress = member.getAddress().substring(idx+1);
		
		MemberAttachment memberAttachment = memberService.selectMemberAttachment(userNo);
		
		model.addAttribute("member", member);
		model.addAttribute("mainAddress", mainAddress);
		model.addAttribute("subAddress", subAddress);
		model.addAttribute("memberAttachment", memberAttachment);
		
		//요청한 requestMapping에 따라 다른 페이지로 보내기
		String requestUrl = (String)request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		
		if(requestUrl.contains("updateForm.me")) {
			return "member/memberUpdateForm";
		}
		return "member/memberMyPage";
	}
	
	@GetMapping("/list.me")
	public String memberList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
							 @RequestParam(value = "currentStatus", defaultValue = "USER_NO") String currentStatus,
							 String category, String searchWord, Model model) {
		
		
		Map<String, String> map = new HashMap<>();
		map.put("currentStatus", currentStatus);
		map.put("category", category);
		map.put("searchWord", searchWord);
		
		int listCount = memberService.selectListCount(map); 
		int pageLimit = 10; 
		int boardLimit = 20; 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Member> list = memberService.selectList(pi, map);
		
		model.addAttribute("pi", pi);
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		model.addAttribute("currentStatus", currentStatus);
		
		return "member/memberListView";
	}
	
	@GetMapping("/detailList.me")
	public String memberDetailList(String userNo, Model model) {
		
		Member member = memberService.selectMemberByUserNo(userNo);

		model.addAttribute("member", member);
		
		return "member/memberDetailListView";
	}
	
	@PostMapping("/update.me")
	public ModelAndView updateMember(ModelAndView mv, Member member, String detailAddress, MultipartFile upfile, MemberAttachment memberAttachment, HttpSession session
			,String deletePhotoCheck) {
		String check = "none";
		
		SaveFile saveFile = new SaveFile();
		//파일이 넘어온경우(청록이가 아닐 경우)
		if(!upfile.getOriginalFilename().equals("")) {
			//이미 업로드한 사진이 있는 경우 = update
			MemberAttachment match = memberService.selectMemberAttachment(Integer.toString(member.getUserNo()));
			if(match != null) {
				if(!match.getOriginName().equals("청록이.jpg")) {
					new File(session.getServletContext().getRealPath(match.getChangeName())).delete();				
				}
				check = "update";
			}else {
				check = "insert";
			}
			String changeName = saveFile.getSaveFile(upfile, session);
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/memberProfile/");
			
			try {
				upfile.transferTo(new File(savePath+changeName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			memberAttachment.setRefUno(member.getUserNo());
			memberAttachment.setOriginName(upfile.getOriginalFilename());
			memberAttachment.setChangeName("resources/uploadFiles/memberProfile/"+changeName);
		}else {
			MemberAttachment match = memberService.selectMemberAttachment(Integer.toString(member.getUserNo()));
			if(match != null && deletePhotoCheck.equals("true")) {
				new File(session.getServletContext().getRealPath(match.getChangeName())).delete();
				memberAttachment.setOriginName("청록이.jpg");
				memberAttachment.setChangeName("resources/image/청록이.jpg");
				
				Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				CustomUserDetails userDetails = (CustomUserDetails)principal;
				memberAttachment.setRefUno(userDetails.getUserNo());
				
				memberService.updateMemberAttachment(memberAttachment);
			}
		}
		
		
		
		member.setAddress(member.getAddress() + "/" + detailAddress);
		
		memberService.updateMember(member);
		
		if(check.equals("insert")) {
			memberService.insertMemberAttachment(memberAttachment);
		}else if(check.equals("update")){
			memberService.updateMemberAttachment(memberAttachment);
		}
		
		mv.setViewName("redirect:myPage.me");
		return mv;
	}
	
	@PostMapping("/delete.me")
	public String deleteMember(HttpSession session) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUserDetails userDetails = (CustomUserDetails)principal;
		
		
		int result = memberService.deleteMember(userDetails.getUserNo());
		
		if(result>0) {
			session.setAttribute("alertMsg", "탈퇴하셨습니다.");
			SecurityContextHolder.clearContext();
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/memberEnroll.me")
	public String memberEnroll() {
		
		return "member/memberEnrollForm";
	}
	
	@ResponseBody
	@GetMapping(value = "/idCheck.me", produces = "application/json; charset=UTF-8")
	public String idCheck(String userId) {
		
		Member member = memberService.selectMemberById(userId);
		
		if(member == null) {
			return new Gson().toJson("1");			
		}else {
			return new Gson().toJson("2");
		}
	}
	
	@PostMapping("/insert.me")
	public String insertMember(Member member, String detailAddress, HttpSession session) {
		
		if(member.getJobCode().equals("J1") || member.getJobCode().equals("J2") || member.getJobCode().equals("J3")
				|| member.getJobCode().equals("J4") || member.getJobCode().equals("J5")) {
			member.setAuth("ROLE_ADMIN");
		}else {
			member.setAuth("ROLE_MEMBER");
		}
		
		member.setAddress(member.getAddress()+ "/" +detailAddress);
		member.setUserPwd("1234");
		
		int result = memberService.insertMember(member);
		
		if(result>0) {
			session.setAttribute("alertMsg", "회원가입성공");
		}else {
			session.setAttribute("alertMsg", "회원가입실패");
		}
		
		
		return "redirect:mainPage.me";
	}
	
	@ResponseBody
	@GetMapping("/checkPwd.me")
	public String checkPwd(String password) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUserDetails userDetails = (CustomUserDetails)principal;
		
		String check = memberService.checkPwd(password, userDetails.getPassword());
		
		return check;
	}
	
	@GetMapping("/changePwdForm.me")
	public String changePwdForm() {
		
		return "member/memberChangePwdForm";
	}
	
	@PostMapping("/updatePwd.me")
	public ModelAndView updatePwd(String password, ModelAndView mv, HttpSession session) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUserDetails userDetails = (CustomUserDetails)principal;
		
		Member member = Member.builder().userPwd(password).userNo(userDetails.getUserNo()).build();
		int result = memberService.updatePwd(member);
		if(result>0) {
			mv.setViewName("redirect:/");
			SecurityContextHolder.clearContext();
			session.setAttribute("alertMsg", "비밀번호 변경완료. 다시 로그인 해주세요.");
		}else {
			
		}
		
		return mv;
	}
	
	@PostMapping("/updateOther.me")
	public String updateOther(Member member, HttpSession session) {
		System.out.println(member.getDepatureDate());
		if(member.getJobCode().equals("J6") || member.getJobCode().equals("J7")) {
			member.setAuth("ROLE_MEMBER");
		}else {
			member.setAuth("ROLE_ADMIN");
		}
		
		int result = memberService.updateOther(member);
		
		if(result>0) {
			session.setAttribute("alertMsg", "회원 정보 수정 성공");
		}else {
			session.setAttribute("alertMSg", "회원 정보 수정 실패");
		}
		
		return "redirect:list.me";
	}
	
}
