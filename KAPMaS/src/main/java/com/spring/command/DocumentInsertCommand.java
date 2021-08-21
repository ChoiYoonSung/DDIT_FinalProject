package com.spring.command;

import com.spring.dto.DocumentVO;

public class DocumentInsertCommand {

	private String fileName;
	

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	public DocumentVO toDocumentVO() {
		DocumentVO doc = new DocumentVO();
		doc.setDocName(fileName);
		
		return doc;
		
	}
	
	
	
}
