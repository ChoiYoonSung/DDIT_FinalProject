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
	public Map<String, Object> selectSMailListById(SearchCriteriaById crid) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String,Object>();
		PageMakerById pageMaker = new PageMakerById();
		pageMaker.setCrid(crid);
		pageMaker.setTotalCount(smailDAO.selectSMailCounrListById(crid));
		
		
		List<SmailVO> smailList=smailDAO.selectSMailListById(crid);
		
		dataMap.put("smailList",smailList );
		dataMap.put("pageMaker",pageMaker );
		
		return dataMap;
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
