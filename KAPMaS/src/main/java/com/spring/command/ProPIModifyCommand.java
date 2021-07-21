package com.spring.command;

import com.spring.dto.PIVO;

public class ProPIModifyCommand {
	private String piCode;
	private String empId;
	private String piTitle;
	private String piContent;
	private String piMileStone;
	
	public String getPiCode() {
		return piCode;
	}
	public void setPiCode(String piCode) {
		this.piCode = piCode;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getPiTitle() {
		return piTitle;
	}
	public void setPiTitle(String piTitle) {
		this.piTitle = piTitle;
	}
	public String getPiContent() {
		return piContent;
	}
	public void setPiContent(String piContent) {
		this.piContent = piContent;
	}
	public String getPiMileStone() {
		return piMileStone;
	}
	public void setPiMileStone(String piMileStone) {
		this.piMileStone = piMileStone;
	}
	
	public PIVO toPiVO() {
		PIVO pi = new PIVO();
		pi.setPiCode(this.piCode);
		pi.setEmpId(this.empId);
		pi.setPiTitle(this.piTitle);
		pi.setPiContent(this.piContent);
		pi.setPiMileStone(this.piMileStone);
		
		return pi;
	}
}
