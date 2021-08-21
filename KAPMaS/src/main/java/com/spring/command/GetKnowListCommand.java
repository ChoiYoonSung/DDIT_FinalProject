package com.spring.command;

import com.spring.dto.KnowVO;

public class GetKnowListCommand {

	
	private String trTable;

	public String getTrTable() {
		return trTable;
	}

	public void setTrTable(String trTable) {
		this.trTable = trTable;
	}
	
	
	
	
	public KnowVO toKnowVO() {
		KnowVO know = new KnowVO();
		know.setKhCategory(trTable);
		
		return know;
	}
	
	
	
	
	
	
	
}
