package com.spring.command;

import com.spring.dto.PjmVO;

public class proDeleteMem {
	private String empId;

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}
	
	
	
	
	public PjmVO toPjmVO() {
		PjmVO pjm = new PjmVO();
		pjm.setEmpId(empId);
		
		return pjm;
	}
	
	
	
	
}
