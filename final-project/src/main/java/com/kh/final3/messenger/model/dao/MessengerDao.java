package com.kh.final3.messenger.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;
import com.kh.final3.messenger.model.vo.Messenger;

@Repository
public class MessengerDao {
	
	//보낸 쪽지 개수 세어오는 메소드 
	public int recvListCount(SqlSession sqlSession, int userNo) {

		return sqlSession.selectOne("msgMapper.recvListCount", userNo);
	}
	
	//받은 쪽지 목록 조회 메소드 
	public ArrayList<Messenger> selectRecvList(SqlSession sqlSession, PageInfo pi, int userNo) {

		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("msgMapper.selectRecvList", userNo, rowBounds);
	}

	//보낸 쪽지 개수 세어오는 메소드 
	public int sendListCount(SqlSession sqlSession, int userNo) {

		return sqlSession.selectOne("msgMapper.sendListCount", userNo);
	}

	//보낸 쪽지 목록 조회 메소드 
	public ArrayList<Messenger> selectSendList(SqlSession sqlSession, PageInfo pi, int userNo) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("msgMapper.selectSendList", userNo, rowBounds);
	}

	//휴지통 쪽지 개수 세어오는 메소드 
	public int trashListCount(SqlSession sqlSession, int userNo) {
		
		//삭제된 보낸 쪽지 개수 
		int sDelete = sqlSession.selectOne("msgMapper.sendDeleteListCount", userNo);
		//삭제된 받은 쪽지 개수 
		int rDelete = sqlSession.selectOne("msgMapper.recvDeleteListCount", userNo);
		
		// 두개 결과값 합쳐서 반환
		return sDelete+rDelete;
	}
	
	//휴지통 목록 조회 메소드 
	public ArrayList<Messenger> selectTrashList(SqlSession sqlSession, PageInfo pi, int userNo) {

		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("msgMapper.selectTrashList", userNo , rowBounds);
	}


	//주소록 검색 메소드
	public ArrayList<Member> searchName(SqlSession sqlSession, HashMap<String, String> key) {

		return (ArrayList)sqlSession.selectList("msgMapper.searchName", key);
	}
	
	//쪽지 발송 메소드 
	public int insertMessage(SqlSession sqlSession, ArrayList<Messenger> mList) {
		
		int result = 1;
		for(Messenger msg : mList ) {
			
			result *= sqlSession.insert("msgMapper.insertMessage", msg);
		}
		
		return result;
	}
	
	//읽음 처리 메소드 
	public int updateReadStatus(SqlSession sqlSession, int msgNo) {

		return sqlSession.update("msgMapper.updateReadStatus", msgNo);
	}
	
	//쪽지 내용 조회 메소드 
	public Messenger selectMessage(SqlSession sqlSession, int msgNo) {
		
		return sqlSession.selectOne("msgMapper.selectMessage", msgNo);
	}

	//받은 쪽지 삭제 메소드 
	public int recvMsgUpdate(SqlSession sqlSession, int[] msgNoArr) {
		
		int result =1; 
				
		for(int msgNo : msgNoArr) {
			
			result *= sqlSession.update("msgMapper.recvMsgUpdate", msgNo);
		}
		
		return result;
	}
	
	//보낸 쪽지 삭제 메소드
	public int sendMsgUpdate(SqlSession sqlSession, int[] msgNoArr) {
		
		int result =1; 
		
		for(int msgNo : msgNoArr) {
			
			result *= sqlSession.update("msgMapper.sendMsgUpdate", msgNo);
		}
		
		return result;
	}
	
	//받은 쪽지 복구 메소드
	public int recvMsgRecover(SqlSession sqlSession, int[] msgNoArr) {
		int result =1; 
		
		for(int msgNo : msgNoArr) {
			
			result *= sqlSession.update("msgMapper.recvMsgRecover", msgNo);
		}
		
		return result;
	}

	//보낸 쪽지 복구 메소드 
	public int sendMsgRecover(SqlSession sqlSession, int[] msgNoArr) {
		
		int result =1; 
		
		for(int msgNo : msgNoArr) {
			
			result *= sqlSession.update("msgMapper.sendMsgRecover", msgNo);
		}
		
		return result;
	}
	
	//조건별 검색 메소드(받은 쪽지) 
	public int selectSearchListCount(SqlSession sqlSession, HashMap<String, Object> key) {

		return sqlSession.selectOne("msgMapper.selectSearchListCount", key);
	}
	
	//조건별 쪽지 목록 조회 메소드(받은 쪽지) 
	public ArrayList<Messenger> selectSearchList(SqlSession sqlSession, HashMap<String, Object> key, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("msgMapper.selectSearchList", key, rowBounds);
	}
	
	//조건별 검색 메소드(보낸 쪽지)
	public int sendSearchListCount(SqlSession sqlSession, HashMap<String, Object> key) {

		return sqlSession.selectOne("msgMapper.sendSearchListCount", key);
	}
	
	//조건별 검색 목록 조회 메소드(보낸 쪽지)
	public ArrayList<Messenger> sendSearchList(SqlSession sqlSession, HashMap<String, Object> key, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("msgMapper.sendSearchList", key, rowBounds);
	}

	//조건별 검색 메소드 (휴지통)
	public int trashSearchListCount(SqlSession sqlSession, HashMap<String, Object> key) {

		return sqlSession.selectOne("msgMapper.trashSearchListCount", key);
	}
	
	//조건별 검색 목록 조회 메소드(휴지통)
	public ArrayList<Messenger> trashSearchList(SqlSession sqlSession, HashMap<String, Object> key, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("msgMapper.trashSearchList", key, rowBounds);
	}
	
	//읽지않은 쪽지 수 조회(받은쪽지함)
	public int selectCountRecvMsg(SqlSession sqlSession, int userNo) {
		
		return sqlSession.selectOne("msgMapper.selectCountRecvMsg", userNo);
	}
	
	
	
	

	
	
	

	
	
	
	

}
