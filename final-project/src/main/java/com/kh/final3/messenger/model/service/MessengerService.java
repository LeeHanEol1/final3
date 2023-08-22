package com.kh.final3.messenger.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;
import com.kh.final3.messenger.model.vo.Messenger;

public interface MessengerService {
	
	// 받은 쪽지 개수 세어오는 메소드 
	int recvListCount(int userNo);
	
	//받은쪽지 목록 조회 메소드 
	ArrayList<Messenger> selectRecvList(PageInfo pi, int userNo);

	//보낸 쪽지 개수 세어오는 메소드 
	int sendListCount(int userNo);
	
	//보낸 쪽지 목록 조회 메소드 
	ArrayList<Messenger> selectSendList(PageInfo pi, int userNo);
	
	//휴지통 쪽지 개수 세어오는 메소드
	int trashListCount(int userNo);
	
	//휴지통 쪽지 목록 조회 메소드 
	ArrayList<Messenger> selectTrashList(PageInfo pi, int userNo);
	
	
	//주소록 검색 목록 조회 메소드 
	ArrayList<Member> searchName(HashMap<String, String> key);

	//쪽지 발송 메소드
	int insertMessage(ArrayList<Messenger> mList);

	//쪽지 내용 조회 메소드 
	Messenger selectMessage(int msgNo);

	//받은 쪽지 내용 선택 삭제(휴지통 이동) 
	int recvMsgUpdate(int[] msgNoArr);
	
	//보낸 쪽지 내용 선택 삭제 (휴지통 이동)
	int sendMsgUpdate(int[] msgNoArr);
	
	//받은 쪽지 복구 
	int recvMsgRecover(int[] msgNoArr);
	
	//보낸 쪽지 복구 
	int sendMsgRecover(int[] msgNoArr);
	
	//읽음 처리 메소드 
	int updateReadStatus(int msgNo);

	//조건별 검색 메소드(받은 쪽지) 
	int selectSearchListCount(HashMap<String, Object> key);
	
	//조건별 검색 쪽지 목록 조회 메소드(받은 쪽지) 
	ArrayList<Messenger> selectSearchList(HashMap<String, Object> key, PageInfo pi);
	
	//조건별 검색 메소드(보낸 쪽지)
	int sendSearchListCount(HashMap<String, Object> key);
	
	//조건별 검색 쪽지 목록 조회 메소드 (보낸 쪽지)
	ArrayList<Messenger> sendSearchList(HashMap<String, Object> key, PageInfo pi);

	int trashSearchListCount(HashMap<String, Object> key);

	ArrayList<Messenger> trashSearchList(HashMap<String, Object> key, PageInfo pi);
	
	//읽지않은 쪽지 개수 조회(받은쪽지) 
	int selectCountRecvMsg(int userNo);
	

	

	


	

}
