package com.kh.final3.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.final3.board.model.vo.Board;
import com.kh.final3.board.model.vo.BoardAttachment;
import com.kh.final3.board.model.vo.Reply;
import com.kh.final3.common.vo.PageInfo;

public interface NoticeService {
	// 총 게시글 개수
	int selectListCount(HashMap<String, String> map);
	// 게시글 정보 조회
	ArrayList<Board> selectList(PageInfo pi, HashMap<String, String> map);
	// 조회수 증가
	int increaseCount(int boardNo);
	// 게시물 하나 조회
	Board selectNotice(int boardNo);
	// 첨부파일 조회
	BoardAttachment selectAttachment(int boardNo);
	// 게시물작성
	int insertNotice(BoardAttachment at, Board b);
	// 댓글 조회
	ArrayList<Reply> selectReplyList(int boardNo);
	// 댓글작성
	int insertReply(Reply reply);
	// 댓글 수정
	int updateReply(Reply reply);
	// 댓글삭제
	int deleteReply(int replyNo);
	// 게시글삭제
	int deleteBoard(int boardNo, String filePath);
	// 즐겨찾기 여부 조회
	int selectBookmark(HashMap<String, Integer> map);
	// 즐겨찾기 해제
	int deleteBookmark(HashMap<String, Integer> map);
	// 즐겨찾기 등록
	int insertBookmark(HashMap<String, Integer> map);
	// 즐겨찾기 한 게시물 갯수
	int selectBookmarkCount(int userNo);
	// 즐겨찾기 리스트 조회
	ArrayList<Board> selectBookmarkList(PageInfo pi, int userNo);
	// 게시글 수정
	int updateBoard(Board b, BoardAttachment at);

	
}
