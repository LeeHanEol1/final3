package com.kh.final3.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.final3.board.model.vo.Board;
import com.kh.final3.board.model.vo.BoardAttachment;
import com.kh.final3.common.vo.PageInfo;

public interface DocumentService {
	
	//게시글 개수 조회 메소드
	int selectDocumentListCount();
	
	//게시글 검색 개수 조회 메소드 
	int selectSearchCount(HashMap<String, String> searchMap);
	
	//검색 리스트 조회 메소드 
	ArrayList<Board> selectSearchList(HashMap<String, String> searchMap, PageInfo pi);
	
	//게시글 목록 조회 메소드 
	ArrayList<Board> selectDocumentList(PageInfo pi);
	
	//다운로드 할 파일 목록 조회 메소드 
	ArrayList<BoardAttachment> selectBoardAttachmentList(int bno);
	
	//게시글 조회수 증가 
	int boardCount(int bno);

	//게시글 조회 메소드(상세페이지)
	Board selectDocument(int bno);

	//게시글 작성 메소드 
	int insertDocument(Board b, ArrayList<BoardAttachment> atList);
	
	//게시글 수정 메소드 
	int updateDocument(Board b, ArrayList<BoardAttachment> atList);
	
	//첨부파일 삭제 메소드 
	int deleteAttachment(int boardNo);
	
	//게시글 삭제 메소드 
	int deleteDocument(int bno);
	
	//게시글 선택 삭제 메소드 
	int selectDelete(int[] bnoArr);
	
	//삭제된 첨부파일 조회 메소드(업로드 파일삭제용도)
	ArrayList<BoardAttachment> selectDeleteAttachList(int bno);
	






}
