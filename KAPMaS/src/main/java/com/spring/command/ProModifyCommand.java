package com.spring.command;

import com.spring.dto.ProVO;

public class ProModifyCommand {

	
	private String pCode;
	private String pName     ;
	private String pTitle    ;
	private String pSummary  ;
	private String pContent  ;
	
	
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpSummary() {
		return pSummary;
	}
	public void setpSummary(String pSummary) {
		this.pSummary = pSummary;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	
	
	
	public ProVO toProVO() {
		ProVO pro = new ProVO();
		
		pro.setpCode(pCode);
		pro.setpName(pName);
		pro.setpTitle(pTitle);
		pro.setpSummary(pSummary);
		pro.setpContent(pContent);

		return pro;
	}
	
	
	
	
}
