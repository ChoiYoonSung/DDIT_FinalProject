package com.spring.command;

import com.spring.dto.DfolderVO;

public class DeleteFolderCommand {
	private String fId;

	public String getfId() {
		return fId;
	}

	public void setfId(String fId) {
		this.fId = fId;
	}
	
	
	
	public DfolderVO toDfolderVO() {
		DfolderVO df = new DfolderVO();
		df.setfId(fId);
		
		return df;
	}
	
	
	
	
	
}
