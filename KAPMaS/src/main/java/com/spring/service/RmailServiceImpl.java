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
	public Map<String, Object> selectRMailListById(SearchCriteriaById crid) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String,Object>();
		PageMakerById pageMaker = new PageMakerById();
		pageMaker.setCrid(crid);
		pageMaker.setTotalCount(rmailDAO.selectSMailCounrListById(crid));
		
		List<RmailVO> rmailList=rmailDAO.selectRMailListById(crid);
		dataMap.put("rmailList",rmailList );
		dataMap.put("pageMaker",pageMaker );
		
		return dataMap;
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

}
