package com.spring.command;

import com.spring.dto.PAVO;

public class ProPAModifyCommand extends ProPARegistCommand{
	
	private String pCode;
	private String paCode;
	private int[] deleteFile;
	
	
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getPaCode() {
		return paCode;
	}
	public void setPaCode(String paCode) {
		this.paCode = paCode;
	}
	public int[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(int[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	
	@Override
	public PAVO toPAVO(){
		PAVO pa = super.toPAVO();
		pa.setPaCode(this.paCode);	
		pa.setpCode(this.pCode);
		return pa;
	}
	
}
