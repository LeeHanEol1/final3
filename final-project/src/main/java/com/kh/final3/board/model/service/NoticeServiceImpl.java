package com.kh.final3.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.final3.board.model.dao.NoticeDao;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.board.model.vo.BoardAttachment;
import com.kh.final3.board.model.vo.Reply;
import com.kh.final3.common.vo.PageInfo;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 공지사항 총 게시글 개수 조회
	@Override
	public int selectListCount(HashMap<String, String> map) {
		return noticeDao.selectListCount(sqlSession, map);
	}
	// 게시글 리스트 조회
	@Override
	public ArrayList<Board> selectList(PageInfo pi, HashMap<String, String> map) {
		return noticeDao.selectList(sqlSession, pi, map);
	}
	// 조회수증가
	@Override
	public int increaseCount(int boardNo) {
		return noticeDao.increaseCount(sqlSession, boardNo);
	}
	// 게시물 하나 조회
	@Override
	public Board selectNotice(int boardNo) {
		return noticeDao.selectNotice(sqlSession, boardNo);
	}
	// 첨부파일 조회
	@Override
	public BoardAttachment selectAttachment(int boardNo) {
		return noticeDao.selectAttachment(sqlSession, boardNo);
	}

	// 게시물작성
	@Override
	public int insertNotice(BoardAttachment at, Board b) {
		
		int result1 = noticeDao.insertNotice(sqlSession, b);
		int result2 = 0;
		
		if(at == null) { // 첨부파일이 없는 경우 : 게시글만 작성
			result2 = 1;
		}else { // 첨부파일이 있는 경우 : 게시글 작성 및 첨부파일 등록
			result2 = noticeDao.insertAttachment(sqlSession, at);
		}
		
		return result1 * result2;
	}
	// 댓글조회
	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		return noticeDao.selectReplyList(sqlSession, boardNo);
	}
	// 댓글작성
	@Override
	public int insertReply(Reply reply) {
		return noticeDao.insertReply(sqlSession, reply);
	}

	// 댓글수정
	@Override
	public int updateReply(Reply reply) {
		return noticeDao.updateReply(sqlSession, reply);
	}
	// 댓글삭제
	@Override
	public int deleteReply(int replyNo) {
		return noticeDao.deleteReply(sqlSession, replyNo);
	}
	// 게시글삭제
	@Override
	public int deleteBoard(int boardNo, String filePath) {
		
		int result1 = noticeDao.deleteBoard(sqlSession, boardNo);
		int result2 = 0;
		
		if(filePath == null) { // 첨부파일이 없는 경우 : 게시글만 삭제
			result2 = 1;
		}else { // 첨부파일이 있는 경우 : 게시글 삭제 및 첨부파일 삭제
			result2 = noticeDao.deleteBoardAttachment(sqlSession, boardNo);
		}
		return result1 * result2;
	}
	// 즐겨찾기 여부 조회
	@Override
	public int selectBookmark(HashMap<String, Integer> map) {
		return noticeDao.selectBookmark(sqlSession, map);
	}
	// 즐겨찾기 해제
	@Override
	public int deleteBookmark(HashMap<String, Integer> map) {
		return noticeDao.deleteBookmark(sqlSession, map);
	}
	// 즐겨찾기 등록
	@Override
	public int insertBookmark(HashMap<String, Integer> map) {
		return noticeDao.insertBookmark(sqlSession, map);
	}
	// 즐겨찾기 한 게시물 갯수
	@Override
	public int selectBookmarkCount(int userNo) {
		return noticeDao.selectBookmarkCount(sqlSession, userNo);
	}
	// 즐겨찾기 리스트 조회
	@Override
	public ArrayList<Board> selectBookmarkList(PageInfo pi, int userNo) {
		return noticeDao.selectBookmarkList(sqlSession, pi, userNo);
	}
	// 개시글 수정
	@Override
	public int updateBoard(Board b, BoardAttachment at) {
		
		int result1 = noticeDao.updateBoard(sqlSession, b);
		int result2 = 0;
		
		if(at == null) { // 새로 첨부하는 사진 없음
			result2 = 1;
		}else { // 새로 첨부하는 사진 있음
			
			if(at.getAttachmentNo() == 0) { // 기존에 사진 없었으면
				result2 = noticeDao.insertNewAttachment(sqlSession, at);
			}else {
				result2 = noticeDao.updateBoardAttachment(sqlSession, at);
			}
		}
		
		return result1 * result2;
	}
	
	


}
