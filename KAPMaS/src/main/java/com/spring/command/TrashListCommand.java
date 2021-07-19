package com.spring.command;

import com.spring.dto.TrashVO;

public class TrashListCommand extends TrashVO{
	private String trTable;
	private String empId;
	
	
	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}


	public String getTrTable() {
		return trTable;
	}

	public void setTrTable(String trTable) {
		this.trTable = trTable;
	}

	public TrashVO toTrashVO() {
		 TrashVO trash = new TrashVO();
		 trash.setTrTable(this.trTable);
		 trash.setEmpId(this.empId);
		 return trash;
	}
}
