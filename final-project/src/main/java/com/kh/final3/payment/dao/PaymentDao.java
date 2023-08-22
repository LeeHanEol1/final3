package com.kh.final3.payment.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;
import com.kh.final3.payment.model.vo.Payment;

@Repository
public class PaymentDao {
	
	//관리자 - 전체 회원수 조회 
	public int selectMemberCount(SqlSession sqlSession) {

		return sqlSession.selectOne("paymentMapper.selectMemberCount");
	}
	
	//관리자 - 회원 목록 조회 
	public ArrayList<Member> selectMemberList(SqlSession sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("paymentMapper.selectMemberList", null, rowBounds);
	}
	
	//관리자 - 회원 기본 정보 조회 
	public Member selectMemberInfo(SqlSession sqlSession, int userNo) {

		return sqlSession.selectOne("paymentMapper.selectMemberInfo", userNo);
	}
	
	//월별 비교 메소드 - 관리자 
	public int compareMonthly(SqlSession sqlSession, HashMap<String, Object> key) {

		return sqlSession.selectOne("paymentMapper.compareMonthly", key);
	}
	
	//관리자 - 급여 입력
	public int insertPayment(SqlSession sqlSession, Payment pay) {

		return sqlSession.insert("paymentMapper.insertPayment", pay);
	}
	
	//관리자 - 급여 목록 조회 
	public ArrayList<Payment> selectPaymentList(SqlSession sqlSession, int userNo) {

		return (ArrayList)sqlSession.selectList("paymentMapper.selectPaymentList", userNo);
	}
	
	//관리자 - 급여계좌 미등록, 변경 신청 개수 조회 
	public int selectAccount(SqlSession sqlSession) {

		return sqlSession.selectOne("paymentMapper.selectAccount");
	}
	
	//관리자 -계좌 미등록, 계좌 변경 신청 회원 목록 조회 
	public ArrayList<Member> selectAccountList(SqlSession sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("paymentMapper.selectAccoutList", null, rowBounds);
	}

	//관리자 - 필터에 해당하는 회원수 조회 
	public int selectSearchMemberCount(SqlSession sqlSession, HashMap<String, String> key) {

		return sqlSession.selectOne("paymentMapper.selectSearchMemberCount", key);
	}
	
	//관리자 - 필터에 해당하는 회원 목록 조회 
	public ArrayList<Member> selectSearchMemberList(SqlSession sqlSession, PageInfo pi,HashMap<String, String> key) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("paymentMapper.selectSearchMemberList", key, rowBounds);
	}
	
	//회원 - 계좌 변경/등록 신청 메소드 
	public int insertAccount(SqlSession sqlSession, HashMap<String, Object> bankInfo) {

		return sqlSession.update("paymentMapper.insertAccount", bankInfo);
	}

	public Payment monthPayment(SqlSession sqlSession, Payment info) {

		return sqlSession.selectOne("paymentMapper.monthPayment", info);
	}
	
	//가장 최근 명세서 조회 
	public Payment newestPayment(SqlSession sqlSession, int userNo) {

		return sqlSession.selectOne("paymentMapper.newestPayment", userNo);
	}
	
	//관리자 - 급여 계좌 관리 검색 필터 개수 조회 
	public int accountSearch(SqlSession sqlSession, HashMap<String, String> key) {
		
		return sqlSession.selectOne("paymentMapper.accountSearch", key);
	}

	//관리자 - 급여 계좌 관리 검색 필터 
	public ArrayList<Member> accountSearchList(SqlSession sqlSession, PageInfo pi, HashMap<String, String> key) {

		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("paymentMapper.accountSearchList", key, rowBounds);
	}

	
	

}
