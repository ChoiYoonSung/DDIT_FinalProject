package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.DocumentVO;

public class DocumentDAOImpl implements DocumentDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void insertDocument(DocumentVO doc) throws SQLException {
		
		session.update("Document-Mapper.insertDocument", doc);
		
	}

	@Override
	public List<DocumentVO> selectFileListByFolder(DocumentVO doc) throws SQLException {
		List<DocumentVO> docList = session.selectList("Document-Mapper.selectFileListByFolder",doc); 
		
		return docList;
	}

	@Override
	public void deleteDocument(String docCode) throws SQLException {
		session.update("Document-Mapper.deleteDocument", docCode);
		
	}

	@Override
	public void updateDocument(DocumentVO doc) throws SQLException {
		session.update("Document-Mapper.updateDocument", doc);
		
	}

	@Override
	public DocumentVO selectImfoDocument(String docCode) throws SQLException {
		DocumentVO doc = session.selectOne("Document-Mapper.selectImfoDocument", docCode);
		return doc;
	}

	@Override
	public List<DocumentVO> selectFileListById(String empId) throws SQLException {
		List<DocumentVO> docList = session.selectList("Document-Mapper.selectFileListById", empId);
		return docList;
	}

}
