package com.spring.command;

import com.spring.dto.PjmVO;

public class ProjecterCome {

	
	 private String empId;
	 private String pCode;
	 private String rmCode;
	 
	 
	 
	public String getRmCode() {
		return rmCode;
	}
	public void setRmCode(String rmCode) {
		this.rmCode = rmCode;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	
	
	 public PjmVO toPjmVO(){
		 PjmVO pjm = new PjmVO();
		 pjm.setEmpId(empId);
		 pjm.setpCode(pCode);
		 
		 
		 return pjm;
	 }
	 
	 
	
	
}
