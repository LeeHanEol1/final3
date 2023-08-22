package com.kh.final3.messenger.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;
import com.kh.final3.messenger.model.dao.MessengerDao;
import com.kh.final3.messenger.model.vo.Messenger;

@Service
public class MessengerServiceImpl implements MessengerService{
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	MessengerDao msgDao;

	//쪽지 개수 세어오는 메소드 
	@Override
	public int recvListCount(int userNo) {

		return msgDao.recvListCount(sqlSession, userNo);
	}
	
	//받은 쪽지 목록 조회 메소드 
	@Override
	public ArrayList<Messenger> selectRecvList(PageInfo pi, int userNo) {

		return msgDao.selectRecvList(sqlSession, pi, userNo);
	}
	
	//보낸 쪽지 개수 세어오는 메소드 
	@Override
	public int sendListCount(int userNo) {

		return msgDao.sendListCount(sqlSession, userNo);
	}
	
	//보낸 쪽지 목록 조회 메소드 
	@Override
	public ArrayList<Messenger> selectSendList(PageInfo pi, int userNo) {

		return msgDao.selectSendList(sqlSession,pi,userNo);
	}
	
	//휴지통 쪽지 개수 세어오는 메소드 
	@Override
	public int trashListCount(int userNo) {

		return msgDao.trashListCount(sqlSession, userNo);
	}
	
	//휴지통 목록 조회 메소드 
	@Override
	public ArrayList<Messenger> selectTrashList(PageInfo pi, int userNo) {
		
		ArrayList<Messenger> tList = msgDao.selectTrashList(sqlSession, pi, userNo);
		
		return tList;
	}

	
	//주소록 검색 목록 메소드 
	@Override
	public ArrayList<Member> searchName (HashMap<String, String> key) {

		ArrayList<Member> mList = msgDao.searchName(sqlSession, key);
		
		return mList;
	}
	//쪽지 발송 메소드 
	@Override
	public int insertMessage(ArrayList<Messenger> mList) {

		return msgDao.insertMessage(sqlSession, mList);
	}

	//쪽지 내용 조회 메소드 
	@Override
	public Messenger selectMessage(int msgNo) {
			
		return msgDao.selectMessage(sqlSession, msgNo);
	}
	
	//읽음처리 메소드 
	@Override
	public int updateReadStatus(int msgNo) {

		return msgDao.updateReadStatus(sqlSession, msgNo);
	}
	
	//받은 쪽지 삭제 메소드
	@Override
	public int recvMsgUpdate(int[] msgNoArr) {

		return msgDao.recvMsgUpdate(sqlSession, msgNoArr);
	}

	//보낸 쪽지 삭제 메소드
	@Override
	public int sendMsgUpdate(int[] msgNoArr) {
		
		return msgDao.sendMsgUpdate(sqlSession, msgNoArr);
	}
	
	//받은 쪽지 복구 메소드
	@Override
	public int recvMsgRecover(int[] msgNoArr) {

		return msgDao.recvMsgRecover(sqlSession, msgNoArr);
	}

	//보낸 쪽지 삭제 메소드 
	@Override
	public int sendMsgRecover(int[] msgNoArr) {

		return msgDao.sendMsgRecover(sqlSession, msgNoArr);
	}
	
	//조건별 검색 메소드(받은 쪽지) 
	@Override
	public int selectSearchListCount(HashMap<String, Object> key) {

		return msgDao.selectSearchListCount(sqlSession, key);
	}
	
	//조건별 검색 목록 조회 메소드(받은 쪽지) 
	@Override
	public ArrayList<Messenger> selectSearchList(HashMap<String, Object> key, PageInfo pi) {
		
		return msgDao.selectSearchList(sqlSession, key, pi);
	}
	
	//조건별 검색 메소드(보낸 쪽지)
	@Override
	public int sendSearchListCount(HashMap<String, Object> key) {

		return msgDao.sendSearchListCount(sqlSession, key);
	}
	//조건별 검색 목록 조회 메소드(보낸 쪽지)
	@Override
	public ArrayList<Messenger> sendSearchList(HashMap<String, Object> key, PageInfo pi) {
		
		return msgDao.sendSearchList(sqlSession, key, pi);
	}
	
	//조건별 검색 메소드(휴지통)
	@Override
	public int trashSearchListCount(HashMap<String, Object> key) {
		
		return msgDao.trashSearchListCount(sqlSession, key);
	}

	//조건별 검색 목록 조회 메소드(휴지통)
	@Override
	public ArrayList<Messenger> trashSearchList(HashMap<String, Object> key, PageInfo pi) {
		return msgDao.trashSearchList(sqlSession, key, pi);
	}
	
	//읽지않은 쪽지 개수 조회(받은 쪽지)
	@Override
	public int selectCountRecvMsg(int userNo) {

		return msgDao.selectCountRecvMsg(sqlSession, userNo);
	}
	
	

	
	

	
}
