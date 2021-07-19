package com.spring.dao;

import java.sql.SQLException;


import com.spring.dto.EmpVO;

public interface EmpDAO {
	
	//회원정보 아이디로 조회
	EmpVO selectEmpById(String empId) throws SQLException;
	
	//회원정보 부서로 조회
	EmpVO selectEmpByDep(String depCode) throws SQLException;
	
	//회원추가
	public void insertEmp(EmpVO emp)throws SQLException;
	
	//회원수정
	public void updateEmp(EmpVO emp)throws SQLException;
	
	//비밀번호 초기화
	public void updateEmpPwd(EmpVO emp)throws SQLException;
	
}
