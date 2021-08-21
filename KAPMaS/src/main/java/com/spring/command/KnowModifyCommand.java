package com.spring.command;

import com.spring.dto.KnowVO;

public class KnowModifyCommand {
	
	
	
	private String tkCode   ;
	private String tkKeyword;
	private String tkTitle  ;
	private String emp      ;
	private String tkContent;
	
	public String getTkCode() {
		return tkCode;
	}
	public void setTkCode(String tkCode) {
		this.tkCode = tkCode;
	}
	public String getTkKeyword() {
		return tkKeyword;
	}
	public void setTkKeyword(String tkKeyword) {
		this.tkKeyword = tkKeyword;
	}
	public String getTkTitle() {
		return tkTitle;
	}
	public void setTkTitle(String tkTitle) {
		this.tkTitle = tkTitle;
	}
	public String getEmp() {
		return emp;
	}
	public void setEmp(String emp) {
		this.emp = emp;
	}
	public String getTkContent() {
		return tkContent;
	}
	public void setTkContent(String tkContent) {
		this.tkContent = tkContent;
	}
	
	
	public KnowVO toKnow() {
		KnowVO know = new KnowVO();
		know.setKhCode(tkCode);
		know.setKhContent(tkContent);
		know.setKhCategory(emp);
		know.setKhKeyword(tkKeyword);
		know.setKhTitle(tkTitle);
		
		return know;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}

