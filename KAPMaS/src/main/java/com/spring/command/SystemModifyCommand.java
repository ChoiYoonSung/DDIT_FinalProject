package com.spring.command;

import com.spring.dto.SystemVO;

public class SystemModifyCommand {
	private String sgCode   ;
	private String sgTitle  ;
	private String sgContent;
	private String sgType   ;
	
	
	public String getSgCode() {
		return sgCode;
	}
	public void setSgCode(String sgCode) {
		this.sgCode = sgCode;
	}
	public String getSgTitle() {
		return sgTitle;
	}
	public void setSgTitle(String sgTitle) {
		this.sgTitle = sgTitle;
	}
	public String getSgContent() {
		return sgContent;
	}
	public void setSgContent(String sgContent) {
		this.sgContent = sgContent;
	}
	public String getSgType() {
		return sgType;
	}
	public void setSgType(String sgType) {
		this.sgType = sgType;
	}
	
	public SystemVO toSystemVO() {
		SystemVO system = new SystemVO();
		system.setSgCode(sgCode);
		system.setSgTitle(sgTitle);
		system.setSgContent(sgContent);
		system.setSgType(sgType);
		
		return system;
	}
	
	
	
	
	
}
