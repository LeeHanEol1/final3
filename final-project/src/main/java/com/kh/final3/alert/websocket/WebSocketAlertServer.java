package com.kh.final3.alert.websocket;

import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.kh.final3.alert.model.vo.Alert;
import com.kh.final3.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class WebSocketAlertServer extends TextWebSocketHandler {
	
    //private final ObjectMapper objectMapper = new ObjectMapper();
	
	//로그인한 전체 인원 전체에게 메시지를 보낼때 사용할 List  
	private ArrayList<WebSocketSession> sessions = new ArrayList<>();
		
	//1대 1로 보낼때 사용할 Map 
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
	
	//접속시 실행되는 메소드 (클라이언트와 서버가 연결) 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("WebSocket 연결이 확인되었습니다.");
		log.info("웹소켓세션 아이디 : {}",session.getId());
		sessions.add(session);
		log.info("현재 접속자 수 : {}", sessions.size());
		log.info("현재 접속한 ID : {} ", currentUserName(session));//현재 접속한 사람 (사용자 아이디나몽)
		String senderId = currentUserName(session);
		users.put(senderId, session);
		//users.put(session.getId(), session);
		
		//String senderId = session.getId();
		//log.info(senderId);
		//users.put(senderId, session);
	}
	
	//메세지 수신시 실행될 메소드(클라이언트에서 온 메세지를 받는 메서드)
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload(); //자바스크립트에서 넘어온 Msg
		log.info("msg : {}", msg);
		
		if(msg != null) {
			//Alert alert = objectMapper.readValue(msg, Alert.class);
			log.info("if문 안으로 들어왔나용 ");
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 6) {
				String cmd = strs[0];
				String sender = strs[1]; //전자결재 승인 자 
				String receiver = strs[2]; //전자결재 작성 자 
				String docNo = strs[3];
				String title = strs[4];
				String docType = strs[5];
				
				//WebSocketSession senderSession = users.get(sender); //전자 결재 승인 자 
				WebSocketSession receiverSession = users.get(receiver); //전자결재 작성 자
				System.out.println(users);
				System.out.println(receiverSession);
				 
				if("leaveApproval".equals(cmd) && receiverSession != null) {
					log.info("메세지 되나요? ");

					Alert alert = Alert.builder().cmd(cmd).sender(sender).receiver(receiver).docNo(docNo).content(title + "의 전자결재를 승인하셨습니다.").docType(docType).build();;
					log.info("Alert alert : "+alert);
					String text = new Gson().toJson(alert);
					log.info("text : "+ text);
					TextMessage newMessage = new TextMessage(text);
					log.info("newMessage : "+newMessage);
					receiverSession.sendMessage(newMessage);
					
				}else if("leaveUpdateReject".equals(cmd) && receiverSession != null) {
					log.info("메세지 되나요? ");
					
					Alert alert = Alert.builder().cmd(cmd).sender(sender).receiver(receiver).docNo(docNo).content(title + "의 전자결재를 반려하셨습니다.").docType(docType).build();;
					log.info("Alert alert : "+alert);
					String text = new Gson().toJson(alert);
					log.info("text : "+ text);
					TextMessage newMessage = new TextMessage(text);
					log.info("newMessage : "+newMessage);
					receiverSession.sendMessage(newMessage);
					
				}else if("itemApproval".equals(cmd) && receiverSession != null) {
					log.info("메세지 되나요? ");
					
					Alert alert = Alert.builder().cmd(cmd).sender(sender).receiver(receiver).docNo(docNo).content(title + "의 전자결재를 반려하셨습니다.").docType(docType).build();;
					log.info("Alert alert : "+alert);
					String text = new Gson().toJson(alert);
					log.info("text : "+ text);
					TextMessage newMessage = new TextMessage(text);
					log.info("newMessage : "+newMessage);
					receiverSession.sendMessage(newMessage);
					
				}else if("itemUpdateReject".equals(cmd) && receiverSession != null) {
					log.info("메세지 되나요? ");
					
					Alert alert = Alert.builder().cmd(cmd).sender(sender).receiver(receiver).docNo(docNo).content(title + "의 전자결재를 반려하셨습니다.").docType(docType).build();;
					log.info("Alert alert : "+alert);
					String text = new Gson().toJson(alert);
					log.info("text : "+ text);
					TextMessage newMessage = new TextMessage(text);
					log.info("newMessage : "+newMessage);
					receiverSession.sendMessage(newMessage);
				}
			}
		}
	}
	
	
	//사용자 접속 종료시 실행되는 메소드(연결 해제)
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("Socket 끊음 ");
		log.info(session.getId() + "연결 종료");
		users.remove(session.getId());
	}
	
	//웹소켓에 id 가져오기 
	private String currentUserName(WebSocketSession session) {
		//WebSocket 세션에 연결된 HTTP 세션 속성들 가지고 옴 
		Map<String, Object> httpSession = session.getAttributes();
		
		//"loginUser" 키로 저장된 속성 값을 가지고 옴(로그인한 사용자의 정보가 없으면 null로 반환)
		Member loginUser = (Member)httpSession.get("loginUser");
		
		//로그인 정보가 없을 경우  사용자의 이름 대신 WebSocket 세션 ID를 반환
		if(loginUser == null) {
			String userId = session.getId();
			return userId;
		}
		
		//로그인 정보 가 있을 때 로그인한 사용자의 실제 이름이나 ID를 반환함 
		String userId = String.valueOf(loginUser.getUserNo());
		return userId;
	}
	
}