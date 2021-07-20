package com.spring.command;

import com.spring.dto.ScrapVO;

public class ScrapInsertCommand {
	
	private String empId;
	private String scTitle;
	private String scUrl;
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getScTitle() {
		return scTitle;
	}
	public void setScTitle(String scTitle) {
		this.scTitle = scTitle;
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
		scr.setScTitle(this.scTitle);
		scr.setScUrl(this.scUrl);
		
		return scr;
	}

}
