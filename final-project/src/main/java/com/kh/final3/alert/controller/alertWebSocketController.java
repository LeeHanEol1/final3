package com.kh.final3.alert.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value={"/member","/admin"})
@Controller
public class alertWebSocketController {

	@GetMapping("/ws-alert")
	public String alert() {
		return "common/menubar";
	}
}
 