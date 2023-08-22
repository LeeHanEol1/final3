package com.kh.final3.messenger.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Messenger {
	private int messengerNo;				//MESSENGER_NO	NUMBER
	private String sender;				//SENDER	NUMBER
	private String receiver;				//RECEIVER	NUMBER
	private String msgTitle;		//MESSENGER_TITLE	VARCHAR2(100 BYTE)
	private String msgContent;	//MESSENGER_CONTENT	VARCHAR2(1000 BYTE)
	private String	sendDate;			//SEND_DATE	DATE
	private String 	recvDate;			//RECV_DATE	DATE
	private String 	sendDelete;			//SEND_DELETE	VARCHAR2(1 BYTE)
	private String 	recvDelete;			//RECV_DELETE	VARCHAR2(1 BYTE)
	private String 	readStatus;			//READ_STATUS	VARCHAR2(1 BYTE)
	private String  emcStatus;			//EMC_STATUS	VARCHAR2(1 BYTE)
	
	private String[] recvUno; // 여러사람한테 보내기 위해 view ->controller에서 넘어 올때 배열로 받기
	
	//로그인 회원 번호랑 보낸/받는 회원 번호 비교를 위해 생성
	private int senderUno;
	private int recvrUno;
	
	//받는사람,보내는사람 내역에서 보여주기 위해 생성 
	private String senderId; 
	private String recvrId;

	
}
