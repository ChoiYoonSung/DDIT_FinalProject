package com.spring.command;

import com.spring.dto.ScrapVO;

public class ScrapDeleteCommand {
	
	private String empId;
	private String scUrl;
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getScUrl() {
		return scUrl;
	}
	public void setScUrl(String scUrl) {
		this.scUrl = scUrl;
	}
	public ScrapVO toScrapVO() {
		ScrapVO scr = new ScrapVO();
		scr.setEmpId(this.empId);
		scr.setScUrl(this.scUrl);
		
		return scr;
	}

}
