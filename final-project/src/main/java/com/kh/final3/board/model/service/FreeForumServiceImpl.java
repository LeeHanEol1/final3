package com.kh.final3.board.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.final3.board.model.dao.FreeForumDao;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.board.model.vo.BoardAttachment;
import com.kh.final3.board.model.vo.Reply;
import com.kh.final3.common.vo.PageInfo;

@Service
public class FreeForumServiceImpl implements FreeForumService{

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	FreeForumDao freeForumDao;
	
	@Override
	public int selectListCount(Map<String, String> map) {
		
		return freeForumDao.selectListCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<Board> forumList(PageInfo pi, Map<String, String> map) {
		
		return freeForumDao.forumList(sqlSession, pi, map);
	}

	@Override
	public Board findForumDetails(int boardNo) {

		return freeForumDao.selectForumDetails(sqlSession, boardNo);
	}

	@Override
	public ArrayList<BoardAttachment> findAttachmentList(int boardNo) {
		
		return freeForumDao.selectAttachmentList(sqlSession, boardNo);
	}

	@Override
	public int increaseForumCount(int boardNo) {
		
		return freeForumDao.increaseForumCount(sqlSession, boardNo);
	}

	@Override
	public int addForum(Board board) {
		
		return freeForumDao.insertForum(sqlSession, board);
	}

	@Override
	public int checkRecommend(Map<String, Integer> map) {
		
		return freeForumDao.checkRecommend(sqlSession, map);
	}

	@Override
	public int addRecommend(Map<String, Integer> map) {
		
		return freeForumDao.insertRecommend(sqlSession, map);
	}

	@Override
	public int selectRecommendCount(int boardNo) {
		
		return freeForumDao.selectRecommendCount(sqlSession, boardNo);
	}

	@Override
	public int checkDeprecated(Map<String, Integer> map) {
		
		return freeForumDao.checkDeprecated(sqlSession, map);
	}

	@Override
	public int addDeprecated(Map<String, Integer> map) {
		
		return freeForumDao.insertDeprecated(sqlSession, map);
	}

	@Override
	public int selectDeprecatedCount(int boardNo) {
		
		return freeForumDao.selectDeprecatedCount(sqlSession, boardNo);
	}

	@Override
	public int insertReply(Reply reply) {
		
		return freeForumDao.insertReply(sqlSession, reply);
	}

	@Override
	public ArrayList<Reply> selectReplyList(PageInfo pi, Map<String, String> map) {
		
		return freeForumDao.selectReplyList(sqlSession, pi, map);
	}

	@Override
	public int replyCount(int boardNo) {
		
		return freeForumDao.selectReplyCount(sqlSession, boardNo);
	}

	@Override
	public int updateForum(Board board) {
		
		return freeForumDao.updateForum(sqlSession, board);
	}

	@Override
	public int deleteForum(int boardNo) {
		
		return freeForumDao.deleteForum(sqlSession, boardNo);
	}

	@Override
	public int updateReply(Reply reply) {
		
		return freeForumDao.updateReply(sqlSession, reply);
	}

	@Override
	public int deleteReply(int replyNo) {
		
		return freeForumDao.deleteReply(sqlSession, replyNo);
	}

	@Override
	public int replyCount(Map<String, String> map) {
		
		return freeForumDao.selectReplyCount(sqlSession, map);
	}


}
