package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMakerById;
import com.spring.command.SearchCriteriaById;
import com.spring.dao.RmailDAO;
import com.spring.dto.RmailVO;

public class RmailServiceImpl implements RmailService{

	private RmailDAO rmailDAO;
	public void setRmailDAO(RmailDAO rmailDAO) {
		this.rmailDAO = rmailDAO;
	}

	
	@Override
	public List<RmailVO> selectRMailListById(String empId) throws SQLException {
		
		List<RmailVO> rmailList=rmailDAO.selectRMailListById(empId);
		
		return rmailList;
	}

	@Override
	public void receiveMail(RmailVO rmail) throws SQLException {
		
		rmailDAO.receiveMail(rmail);
		
	}


	@Override
	public RmailVO selectRmailInfo(String rmCode) throws SQLException {
		RmailVO rmail = rmailDAO.selectRmailInfo(rmCode);
		rmailDAO.readRmail(rmCode);
		
		return rmail;
	}


	@Override
	public void deleteRmail(String rmCode) throws SQLException {
		
		rmailDAO.deleteRmail(rmCode);
		
	}


	@Override
	public void readRmail(String rmCode) throws SQLException {
		
		rmailDAO.readRmail(rmCode);
		
	}


	@Override
	public void deleteAllRmail(String rmCode) throws SQLException {
		rmailDAO.deleteAllRmail(rmCode);
		
	}


	@Override
	public RmailVO selectLastRMailById(String empId) throws SQLException {
		RmailVO lastRMail = rmailDAO.selectLastRMailById(empId);
		
		return lastRMail;
	}

}
