package com.kh.final3.member.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.dao.MemberDao;
import com.kh.final3.member.model.vo.Member;
import com.kh.final3.member.model.vo.MemberAttachment;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Override //관리자 가입. 비밀번호 처리 후 dao로 보냄
	public int adminInsert(Member member) {

		String encodedPwd = bcryptPasswordEncoder.encode(member.getUserPwd());
		member.setUserPwd(encodedPwd);
		int result = memberDao.adminInsert(sqlSession, member);
		
		return result;
	}

	@Override
	public Member selectMemberById(String userId) {
		
		return memberDao.selectMemberById(sqlSession, userId);
	}

	@Override
	public int selectListCount(Map<String, String> map) {
		
		return memberDao.selectListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Member> selectList(PageInfo pi, Map<String, String> map) {
		
		return memberDao.selectList(sqlSession, pi, map);
	}

	@Override
	public Member selectMemberByUserNo(String userNo) {
		
		return memberDao.selectMemberByUserNo(sqlSession, userNo);
	}

	@Override
	public int updateMember(Member member) {
		
		return memberDao.updateMember(sqlSession, member);
	}

	@Override
	public int insertMember(Member member) {
		
		String encodedPwd = bcryptPasswordEncoder.encode(member.getUserPwd());
		member.setUserPwd(encodedPwd);
		
		return memberDao.insertMember(sqlSession, member);
	}

	@Override
	public MemberAttachment selectMemberAttachment(String userNo) {
		
		return memberDao.selectMemberAttachment(sqlSession, userNo);
	}

	@Override
	public int updateMemberAttachment(MemberAttachment memberAttachment) {
		
		return memberDao.updateMemberAttachment(sqlSession, memberAttachment);
	}

	@Override
	public int insertMemberAttachment(MemberAttachment memberAttachment) {
		
		return memberDao.insertMemberAttachment(sqlSession, memberAttachment);
	}

	@Override
	public String checkPwd(String rawPassword, String encodedPassword) {
		
		if(bcryptPasswordEncoder.matches(rawPassword, encodedPassword)) {
			return "true";
		}
		
		return "false";
	}

	@Override
	public int updatePwd(Member member) {
		
		String encodedPwd = bcryptPasswordEncoder.encode(member.getUserPwd());
		member.setUserPwd(encodedPwd);
		
		return memberDao.updatePwd(sqlSession, member);
	}

	@Override
	public int updateOther(Member member) {
		
		return memberDao.updateOther(sqlSession, member);
	}

	@Override
	public int deleteMember(int userNo) {
		
		return memberDao.deleteMember(sqlSession, userNo);
	}

}
