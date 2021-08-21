package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.DfolderDAO;
import com.spring.dto.DfolderVO;

public class DfolderServiceImpl implements DfolderService{
	
	private DfolderDAO dfolder;
	public void setDfolder(DfolderDAO dfolder) {
		this.dfolder = dfolder;
	}

	@Override
	public void createFolder(DfolderVO df) throws SQLException {
		dfolder.createFolder(df);
		
	}

	@Override
	public void deleteFolder(String fId) throws SQLException {
		dfolder.deleteFolder(fId);
		
	}

	@Override
	public List<DfolderVO> findFolderById(String empId) throws SQLException {
		List<DfolderVO> dfList = dfolder.findFolderById(empId);
		return dfList;
	}

}
