package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMakerById;
import com.spring.command.SearchCriteriaById;
import com.spring.dao.SmailDAO;
import com.spring.dto.DepEmpVO;
import com.spring.dto.SmailVO;

public class SmailServiceImple implements SmailService{

	
	private SmailDAO smailDAO;
	public void setSmailDAO(SmailDAO smailDAO) {
		this.smailDAO = smailDAO;
	}

	
	
	
	@Override
	public List<SmailVO> selectSMailListById(String empId) throws SQLException {
		
		List<SmailVO> smailList=smailDAO.selectSMailListById(empId);
		
		
		return smailList;
	}

	@Override
	public void sendMail(SmailVO smail) throws SQLException {
		
		smailDAO.sendMail(smail);
		
	}




	@Override
	public List<DepEmpVO> getDepEmpList(String depCode) throws SQLException {
		
		 List<DepEmpVO> depEmpList = smailDAO.getDepEmpList(depCode);
		
		
		return depEmpList;
	}




	@Override
	public SmailVO selectSmailInfo(String smCode) throws SQLException {
		
		SmailVO smail = smailDAO.selectSmailInfo(smCode);
		
		smailDAO.readSmail(smCode);
		
		return smail;
	}




	@Override
	public void deleteSmail(String smCode) throws SQLException {
		
		smailDAO.deleteSmail(smCode);
		
		
		
		
		
	}




	@Override
	public void deleteAllSmail(String smCode) throws SQLException {
		smailDAO.deleteAllSmail(smCode);
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
