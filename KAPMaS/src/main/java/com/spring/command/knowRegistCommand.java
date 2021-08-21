package com.spring.command;

import com.spring.dto.KnowVO;

public class knowRegistCommand {

	
	private String empId    ;
	private String tkTitle  ;
	private String emp      ;
	private String tkContent;
	private String tkKeyword;
	
	
	
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
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
	public String getTkKeyword() {
		return tkKeyword;
	}
	public void setTkKeyword(String tkKeyword) {
		this.tkKeyword = tkKeyword;
	}
	
	
	public KnowVO toKnow() {
		KnowVO know= new KnowVO();
		know.setEmpId(empId);
		know.setKhCategory(emp);
		know.setKhContent(tkContent);
		know.setKhTitle(tkTitle);
		know.setKhKeyword(tkKeyword);
		
		
		return know;
	}
	
	
	
	
	
}
