package com.spring.command;

import com.spring.dto.TrashVO;

public class TrashRestoreDeleteCommand {
	private String trTable;
	private String code;
	
	private String checked;
	
	
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getTrTable() {
		return trTable;
	}
	public void setTrTable(String trTable) {
		this.trTable = trTable;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public TrashVO toTrashVO() {
		TrashVO trash = new TrashVO();
		trash.setTrTable(trTable);
		
		return trash;
		
	}
}
