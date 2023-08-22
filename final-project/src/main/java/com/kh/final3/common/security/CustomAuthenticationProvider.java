package com.kh.final3.common.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import com.kh.final3.member.model.service.CustomUserDetailsService;
import com.kh.final3.member.model.vo.CustomUserDetails;

public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	@Autowired
	private CustomUserDetailsService customUserDetailsService;
	
	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String username = (String) authentication.getPrincipal();	//화면에서 입력한 아이디를 username에 저장
		String password = (String) authentication.getCredentials();	//화면에서 입력한 비밀번호를 password에 저장
		
		//아이디로 DB에 있는 정보를 UserDetails형으로 member에 저장
		CustomUserDetails member = (CustomUserDetails)customUserDetailsService.loadUserByUsername(username);
		
		//화면에 입력한 비밀번호와 DB에서 조회해온 비밀번호가 일치하는지 비교. 일치하지 않으면 예외 던짐
        if(!matchPassword(password, member.getPassword())) {
            throw new BadCredentialsException(username);
        }
 
        if(!member.isEnabled()) {
            throw new BadCredentialsException(username);
        }
		
        //계정 인증이 완료 됐다면 UsernamePasswordAuthenticationToken 객체에 화면에서 입력한 정보와 DB에서 가져온 권한을 담아 리턴
        return new UsernamePasswordAuthenticationToken(username, password, member.getAuthorities());
	}
	
	//비밀번호 비교 메서드
	private boolean matchPassword(String loginPwd, String password) {
		return loginPwd.equals(password);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

}
