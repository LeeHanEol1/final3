package com.kh.final3.member.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;

@SuppressWarnings("serial")
@Getter
public class CustomUserDetails implements UserDetails{
	
	//security 정보
    private String userId;	//회원 아이디
    private String userPwd;	//회원 비밀번호
    private String auth;	//회원 권한
    
    //멤버 정보들
    private int userNo;
    private String userName;
	private String phone;//	PHONE	VARCHAR2(15 BYTE)
	private String email;//	EMAIL	VARCHAR2(50 BYTE)
	private String address;//	ADDRESS	VARCHAR2(300 BYTE)
	private Date birth;//	BIRTH	DATE
	private String deptCode;//	DEPT_CODE	VARCHAR2(4 BYTE)
	private String jobCode;//	JOB_CODE	VARCHAR2(4 BYTE)
	private Date empolymentDate;//	EMPOLYMENT_DATE	DATE
	private Date depatureDate;//	DEPATURE_DATE	DATE
	private int enabled;//	ENABLED	NUMBER(1,0)
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	
	private String deptName;
	private String jobName;
    
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
        ArrayList<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
        String[] auths = auth.split(", ");
        for(int i=0; i<auths.length; i++) {
        	authority.add(new SimpleGrantedAuthority(auths[i]));        	
        }
        
        return authority;
	}

	@Override
	public String getPassword() {
		return userPwd;
	}

	@Override
	public String getUsername() {
		return userId;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}

	public void setEmpolymentDate(Date empolymentDate) {
		this.empolymentDate = empolymentDate;
	}

	public void setDepatureDate(Date depatureDate) {
		this.depatureDate = depatureDate;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	
	
}
