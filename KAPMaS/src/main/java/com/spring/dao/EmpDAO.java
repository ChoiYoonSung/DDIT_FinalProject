package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

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

	//초기 로그인
	public void seccondEmp(EmpVO emp)throws SQLException;
	
	//전체 회원 조회 
	List<EmpVO> getListEmps()throws SQLException;
	
}
