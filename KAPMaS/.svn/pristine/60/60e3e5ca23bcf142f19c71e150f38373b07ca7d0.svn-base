package com.spring.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.EmpVO;

public class EmpDAOImpl implements EmpDAO{
	
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	

	@Override
	public EmpVO selectEmpById(String empId) throws SQLException {
		
		
		EmpVO emp=session.selectOne("Emp-Mapper.selectEmpById",empId);
		
		
		return emp;
	}

	
	
	@Override
	public EmpVO selectEmpByDep(String depCode) throws SQLException {
		EmpVO emp=session.selectOne("Emp-Mapper.selectEmpBydep",depCode);
		
		return emp;
	}

	
	
	@Override
	public void insertEmp(EmpVO emp) throws SQLException {
		session.update("Emp-Mapper.insertEmp",emp);
		
	}

	
	@Override
	public void updateEmp(EmpVO emp) throws SQLException {
		session.update("Emp-Mapper.updateEmp",emp);
		
	}


	@Override
	public void updateEmpPwd(EmpVO emp) throws SQLException {
		session.update("Emp-Mapper.updateEmpPwd",emp);
		
		
	}

	
	
	
	
}
