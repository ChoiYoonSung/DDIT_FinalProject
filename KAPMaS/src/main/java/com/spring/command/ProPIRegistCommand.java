package com.spring.command;

import com.spring.dto.PIVO;

public class ProPIRegistCommand {
	private String empId;
	private String pCode;
	private String piTitle;
	private String piContent;
	private String piMileStone;
	
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
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
		
		pi.setEmpId(this.empId);
		pi.setpCode(this.pCode);
		pi.setPiTitle(this.piTitle);
		pi.setPiContent(this.piContent);
		pi.setPiMileStone(this.piMileStone);
		
		return pi;
	}
}
