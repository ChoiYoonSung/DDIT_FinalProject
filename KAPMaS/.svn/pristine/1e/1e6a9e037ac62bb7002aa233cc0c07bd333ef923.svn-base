package com.spring.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.spring.dto.EmpVO;

public class User implements UserDetails {
	
	private EmpVO emp;
	
	public User(EmpVO emp) {
		this.emp=emp;
	}
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		roles.add(new SimpleGrantedAuthority(emp.getEmpAuth()));
		
		return roles;
	}

	
	
	@Override
	public String getPassword() {
		return emp.getEmpPwd();
	}

	
	
	@Override
	public String getUsername() {
		return emp.getEmpId();
	}

	
	
	@Override
	public boolean isAccountNonExpired() {//기간제 계정의 경우 기간 만료 여부 : enabled = 4 가 기간만료
		return emp.getEmpEnabled() != 4;
	}

	
	
	@Override
	public boolean isAccountNonLocked() {//사용 정지 혹은 휴먼계정 : enabled = 3 가 기간만료
		return emp.getEmpEnabled() != 3;
	}
	
	
	@Override
	public boolean isCredentialsNonExpired() {//인증 정보 만료 여부 : enables =2
		return emp.getEmpEnabled() != 2;
	}

	
	
	@Override
	public boolean isEnabled() {//탈퇴 혹은 삭제 : enabled=0
		return emp.getEmpEnabled()== 1;
	}

	
	public EmpVO getMemberVO() {
		return this.emp;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

























