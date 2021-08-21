package com.spring.command;

import com.spring.dto.DfolderVO;

public class CreateFolderCommand {

	private String empId;
	private String name ;
	
	
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
	public DfolderVO toDfolderVO() {
		DfolderVO df = new DfolderVO();
		df.setEmpId(empId);
		df.setfName(name);
		
		return df;
	}
	
	
	
	
	
	
	
	
	
	
	
}
