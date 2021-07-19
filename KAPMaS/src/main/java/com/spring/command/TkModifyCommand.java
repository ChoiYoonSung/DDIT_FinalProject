package com.spring.command;

import com.spring.dto.TotalKnowledgeVO;

public class TkModifyCommand extends TkRegistCommand{
	
	private String tkCode;
	private int[] deleteFile;

	public String getTkCode() {
		return tkCode;
	}
	public void setTkCode(String tkCode) {
		this.tkCode = tkCode;
	}
	public int[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(int[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	
	@Override
	public TotalKnowledgeVO toTotalKnowledgeVO() {
		TotalKnowledgeVO tk = super.toTotalKnowledgeVO();
		tk.setTkCode(this.tkCode);
		
		return tk;
	}
	
	

}
