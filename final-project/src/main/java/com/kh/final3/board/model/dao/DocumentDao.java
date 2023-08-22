package com.kh.final3.board.model.dao;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.final3.board.model.vo.Board;
import com.kh.final3.board.model.vo.BoardAttachment;
import com.kh.final3.common.vo.PageInfo;

@Repository
public class DocumentDao {

	//게시글 개수 조회 메소드 
	public int selectDocumentListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("documentMapper.selectDocumentListCount");
	}
	
	//검색 게시글 개수 조회 메소드 
	public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> searchMap) {
		
		return sqlSession.selectOne("documentMapper.selectSearchCount", searchMap);
	}

	//게시글 목록 조회 메소드
	public ArrayList<Board> selectDocumentList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
	
		return (ArrayList)sqlSession.selectList("documentMapper.selectDocumentList", null, rowBounds);
	}
	
	//검색 게시글 목록 조회 메소드 
	public ArrayList<Board> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> searchMap,
			PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("documentMapper.selectSearchList", searchMap, rowBounds);
	}
	// 게시글 조회수 증가 
	public int boardCount(SqlSessionTemplate sqlSession, int bno) {

		return sqlSession.update("documentMapper.boardCount", bno);
	}
	//게시글 조회 메소드(상세페이지)
	public Board selectDocument(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.selectOne("documentMapper.selectDocument", bno);
	}

	//첨부파일 목록 조회 메소드 
	public ArrayList<BoardAttachment> selectBoardAttachmentList(SqlSessionTemplate sqlSession, int bno) {
		
		return (ArrayList)sqlSession.selectList("documentMapper.selectBoardAttachmentList", bno);
	}

	//첨부파일 삭제 메소드 
	public int deleteAttachment(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("documentMapper.updateAttachment", boardNo);
	}
	
	//삭제된 첨부파일 목록 조회 메소드 
	public ArrayList<BoardAttachment> selectDeleteAttachList(SqlSessionTemplate sqlSession, int bno) {

		return (ArrayList)sqlSession.selectList("documentMapper.selectDeleteAttachList", bno);
	}
	

	
	
	

	

	

}
