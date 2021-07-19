package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteriaById;
import com.spring.dto.DepEmpVO;
import com.spring.dto.SmailVO;

public class SmailDAOImpl implements SmailDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	

	@Override
	public List<SmailVO> selectSMailListById(SearchCriteriaById crid) throws SQLException {
		int offset = crid.getStartRowNum();
		int limit = crid.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<SmailVO>smailList = session.selectList("SMail-Mapper.getSendMailListById", crid, rowBounds);

		
		
		return smailList;
	}

	@Override
	public int selectSMailCounrListById(SearchCriteriaById crid) throws SQLException {
		int count = 0;
		count=session.selectOne("SMail-Mapper.getSendMailListCountById",crid);
		
		return count;
	}

	@Override
	public void sendMail(SmailVO smail) throws SQLException {
		session.update("SMail-Mapper.sendMail",smail);
		
	}

	@Override
	public SmailVO selectSmailInfo(String smCode) throws SQLException {
		
		
		SmailVO smail = session.selectOne("SMail-Mapper.getSmailInfo", smCode);
		
		return smail;
	}



	@Override
	public List<DepEmpVO> getDepEmpList(String depCode) throws SQLException {
		
		 List<DepEmpVO> depEmpList = session.selectList("SMail-Mapper.getDepEmpList", depCode);
		
		
		return depEmpList;
	}

	

	@Override
	public void readSmail(String smCode) throws SQLException {
		
		session.update("SMail-Mapper.readSmail", smCode);
		
	}



	@Override
	public void deleteSmail(String smCode) throws SQLException {
		
		session.update("SMail-Mapper.deleteSmailList",smCode);
		
	}



	@Override
	public void deleteAllSmail(String smCode) throws SQLException {
		session.update("SMail-Mapper.deleteAllSmail",smCode);
		
	}


	
	
	

		
		
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
