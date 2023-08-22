package com.kh.final3.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.final3.board.model.dao.DocumentDao;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.board.model.vo.BoardAttachment;
import com.kh.final3.common.vo.PageInfo;


@Service
public class DocumentServiceImple implements DocumentService{

	@Autowired
	public DocumentDao documentDao;
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	//게시글 개수 조회 메소드 
	@Override
	public int selectDocumentListCount() {
		
		int result = documentDao.selectDocumentListCount(sqlSession);
		
		return result;
	}
	
	//게시글 검색 개수 조회 메소드 
	@Override
	public int selectSearchCount(HashMap<String, String> searchMap) {
		
		return documentDao.selectSearchCount(sqlSession, searchMap);
	}
	
	//게시글 목록 조회 메소드
	@Override
	public ArrayList<Board> selectDocumentList(PageInfo pi) {
		
		ArrayList<Board> bList = documentDao.selectDocumentList(sqlSession, pi);
		
		return bList;
	}
	
	//검색 게시글 조회 메소드 
	@Override
	public ArrayList<Board> selectSearchList(HashMap<String, String> searchMap, PageInfo pi) {
	
		ArrayList<Board> searchList = documentDao.selectSearchList(sqlSession, searchMap, pi);
		
		return searchList; 
	}
	
	//게시글 조회수 증가 
	@Override
	public int boardCount(int bno) {

		return documentDao.boardCount(sqlSession, bno);
	}
	
	//게시글 조회 메소드 (상세페이지) 
	@Override
	public Board selectDocument(int bno) {

		Board b = documentDao.selectDocument(sqlSession, bno);
		
		return b;
	}
	
	//다운로드할 파일 목록 조회 
	@Override
	public ArrayList<BoardAttachment> selectBoardAttachmentList(int bno) {

		ArrayList<BoardAttachment> atList = documentDao.selectBoardAttachmentList(sqlSession, bno);
		
		return atList;
	}
	
	//게시글 작성 메소드
	@Override
	@Transactional
	public int insertDocument(Board b, ArrayList<BoardAttachment> atList) {
		
		int result1 = sqlSession.insert("documentMapper.insertDocument", b);

		int result2 = 1; 
		
		for(BoardAttachment at : atList) {
			//atList에 담긴 attachment 반복시켜 하나씩 insert 해주기
			result2 *= sqlSession.insert("documentMapper.insertDocumentAttachment",at);
		
		}
		
		return result1*result2;
	}

	//게시글 수정 메소드 
	@Override
	@Transactional
	public int updateDocument(Board b, ArrayList<BoardAttachment> atList) {

		int result1 = sqlSession.update("documentMapper.updateDocument", b);
		
		int result2 = 1;
		
		for(BoardAttachment at: atList) {
			
			result2 *= sqlSession.insert("documentMapper.updateDocumentAttachment",at);
			
		}
		
		return result1*result2;
	}

	//게시글 삭제 메소드 
	@Override
	@Transactional
	public int deleteDocument(int boardNo) {
		
		//게시글 삭제 
		int result1 = sqlSession.update("documentMapper.deleteDocument", boardNo);
		
		//첨부파일 삭제 
		int result2 = sqlSession.update("documentMapper.updateAttachment", boardNo);
		
		return result1*result2;
	}
	
	//게시글 선택 삭제 메소드
	@Override
	@Transactional
	public int selectDelete(int[] bnoArr) {
		
		int result1 = 1;
		
		int result2 = 1;
		
		for(int boardNo : bnoArr) {
			
			result1 *= sqlSession.update("documentMapper.deleteDocument", boardNo);
			
			result2 *= sqlSession.update("documentMapper.updateAttachment", boardNo);
			
		}
		
		return result1*result2;
	}
	
	//첨부파일 삭제 메소드
	@Override
	public int deleteAttachment(int boardNo) {

		return documentDao.deleteAttachment(sqlSession, boardNo);
	}
	
	//삭제된 첨부파일 조회 메소드 
	@Override
	public ArrayList<BoardAttachment> selectDeleteAttachList(int bno) {

		return documentDao.selectDeleteAttachList(sqlSession,bno);
	}


	

	



	


	

	
}
