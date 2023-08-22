package com.kh.final3.email.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.final3.approval.model.service.ApprovalService;
import com.kh.final3.common.template.SaveFile;
import com.kh.final3.member.model.vo.Member;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.MimeMessageHelper;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value = {"/member", "/admin"}, method= {RequestMethod.GET,RequestMethod.POST})
public class EmailController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("email.em")
	public String emailEnrollForm(ModelAndView mv) {
		
		return "email/emailEnroll";
	}
	
	@PostMapping("send.em")
	public ModelAndView sendMail(HttpServletRequest request, HttpSession session, ModelAndView mv, MultipartFile upfile) {
		String title = request.getParameter("emailTitle");
		String content = request.getParameter("emailContent");
		String from = request.getParameter("sender");
		String to = request.getParameter("receiver");
		String[] arrTo = to.split(",");
		String changeName ="";
		String filePath ="";
		
		for(int i=0; i<arrTo.length;i++) {
			log.debug(arrTo[i]);
		
			try {
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
				//true = 멀티파트 메세지를 사용하겠다라는 의미
				
				mailHelper.setFrom(from);
				mailHelper.setTo(arrTo[i]);
				mailHelper.setSubject(title);
				mailHelper.setText(content, true);
				
				if(!upfile.getOriginalFilename().equals("")) {
					changeName = new SaveFile().getSaveFile(upfile,session);
					
					filePath = session.getServletContext().getRealPath("/resources/uploadFiles/emailDoc/");
					
					try {
						upfile.transferTo(new File(filePath+changeName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					FileSystemResource file = new FileSystemResource(new File(filePath+changeName));
					mailHelper.addAttachment(upfile.getOriginalFilename(),file);
				}
	
				
				mailSender.send(mail);
				
			} catch (MessagingException e1) {
				e1.printStackTrace();
			}
		}
		
		mv.addObject("title", title).addObject("arrTo", arrTo).setViewName("email/completeEmail");
		
		return mv;
	}
}
