package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.EmpDAO;
import com.spring.dto.EmpVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundIDException;
import com.spring.mail.MimeAttachNotifier;

public class EmpServiceImpl implements EmpService{
	
	private EmpDAO empDAO;
	public void setEmpDAO(EmpDAO empDAO) {
		this.empDAO = empDAO;
	}

	private MimeAttachNotifier notifier;
	public void setMimeAttachNotifier(MimeAttachNotifier notifier) {
		this.notifier = notifier;
	}
	
	
	
	
	@Override
	public void login(String empId, String empPwd) throws SQLException, NotFoundIDException, InvalidPasswordException {
		EmpVO emp=empDAO.selectEmpById(empId);
		if(emp == null) {
			throw new NotFoundIDException();
		}
		if(!empPwd.equals(emp.getEmpPwd())) {
			throw new InvalidPasswordException();
		}
		
	}


	@Override
	public EmpVO getEmpById(String empId) throws SQLException {
		EmpVO emp= empDAO.selectEmpById(empId);
		return emp;
	}






	@Override
	public EmpVO getEmpByDep(String depCode) throws SQLException {
		EmpVO emp= empDAO.selectEmpByDep(depCode);
		return emp;
	}

	
	

	@Override
	public void regist(EmpVO emp) throws SQLException {
		empDAO.insertEmp(emp);
		
	}

	
	@Override
	public void modify(EmpVO emp) throws SQLException {
		empDAO.updateEmp(emp);
		
	}
	
	
	@Override
	public void remove(String empId) throws SQLException {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void sendMail(ModelAndView mnv,String email,String pwd) throws Exception {
		
			notifier.sendMail(email,pwd);
		
	}




	@Override
	public void reset(EmpVO emp) throws SQLException {
		empDAO.updateEmpPwd(emp);
		
		
	}




	@Override
	public void seccondEmp(EmpVO emp) throws SQLException {
		
		empDAO.seccondEmp(emp);
		
	}




	@Override
	public List<EmpVO> getListEmps() throws SQLException {
		
		List<EmpVO> empList = empDAO.getListEmps();
		
		return empList;
	}











	
	
	
	
}




















