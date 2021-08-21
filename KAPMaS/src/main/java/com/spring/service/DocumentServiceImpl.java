package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.DocumentDAO;
import com.spring.dto.DocumentVO;

public class DocumentServiceImpl implements DocumentService{

	private DocumentDAO documentDAO;
	public void setDocumentDAO(DocumentDAO documentDAO) {
		this.documentDAO = documentDAO;
	}

	
	@Override
	public void insertDocument(DocumentVO doc) throws SQLException {
		
		documentDAO.insertDocument(doc);
		
	}

	@Override
	public List<DocumentVO> selectFileListByFolder(DocumentVO doc) throws SQLException {
		List<DocumentVO> docList = documentDAO.selectFileListByFolder(doc);
		
		return docList;
	}

	@Override
	public void deleteDocument(String docCode) throws SQLException {
		documentDAO.deleteDocument(docCode);
		
	}

	@Override
	public void updateDocument(DocumentVO doc) throws SQLException {
		documentDAO.updateDocument(doc);
		
	}


	@Override
	public DocumentVO selectImfoDocument(String docCode) throws SQLException {
		
		DocumentVO doc = documentDAO.selectImfoDocument(docCode);
		return doc;
	}


	@Override
	public List<DocumentVO> selectFileListById(String empId) throws SQLException {
		List<DocumentVO> docList = documentDAO.selectFileListById(empId);
		return docList;
	}

}
