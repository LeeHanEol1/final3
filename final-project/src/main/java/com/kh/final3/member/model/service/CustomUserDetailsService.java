package com.kh.final3.member.model.service;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kh.final3.member.model.dao.MemberDao;
import com.kh.final3.member.model.vo.CustomUserDetails;


public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired(required=false)
	private MemberDao memberDao;
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		CustomUserDetails member = memberDao.selectMember(sqlSession, username);
		
		if(member==null) {
			throw new UsernameNotFoundException("없습니다.");
		}

		return member;
	}

}
