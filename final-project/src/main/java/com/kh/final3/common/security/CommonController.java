package com.kh.final3.common.security;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {
	
	@GetMapping("/accessDenied") //권한이 없는 url에 접근 할 경우 보내버릴 페이지
	public String accessDenied() {
		
		return "common/accessDenied";
	}
	
	@GetMapping("/mainPage")
	public String mainPage() {
		
		return "main/mainPage";
	}
}
