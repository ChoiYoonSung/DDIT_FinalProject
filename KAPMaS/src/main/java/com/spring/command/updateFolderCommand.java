package com.spring.command;

import com.spring.dto.DocumentVO;

public class updateFolderCommand {
	private String docCode;
	private String folder ;
	private String name ;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDocCode() {
		return docCode;
	}
	public void setDocCode(String docCode) {
		this.docCode = docCode;
	}
	public String getFolder() {
		return folder;
	}
	public void setFolder(String folder) {
		this.folder = folder;
	}
	
	
	public DocumentVO toDocumentVO() {
		DocumentVO doc = new DocumentVO();
		doc.setDocCode(docCode);
		doc.setDocFolder(folder);
		
		return doc;
	}
	
	
	
	
	
	
	
	
}
