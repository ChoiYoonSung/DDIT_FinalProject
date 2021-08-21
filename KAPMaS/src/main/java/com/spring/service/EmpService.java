package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.spring.dto.EmpVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundIDException;

public interface EmpService {
	
	//로그인
	void login(String empId,String empPwd)throws SQLException, NotFoundIDException, 
															InvalidPasswordException;
	
	//회원 정보 조회
	EmpVO getEmpById(String empId) throws SQLException;
	EmpVO getEmpByDep(String depCode) throws SQLException;
	
	//회원등록
	public void regist(EmpVO emp)throws SQLException;
	
	//회원수정
	void modify(EmpVO emp)throws SQLException;
	
	void remove(String empId) throws SQLException;
	
	//회원 이메일 보내기
	void sendMail(ModelAndView mnv,String email,String pwd)throws Exception;
	
	//비밀번호 초기화
	void reset(EmpVO emp)throws SQLException;
	
	//초기 로그인
	public void seccondEmp(EmpVO emp)throws SQLException;
	
	//전체 회원 조회 
	List<EmpVO> getListEmps()throws SQLException;
}
