package com.spring.command;

import com.spring.dto.ReportVO;

public class ReportCommand {
	
	private String empId;
	private String bdCode;
	private String tkCode;
	public String getBdCode() {
		return bdCode;
	}
	public void setBdCode(String bdCode) {
		this.bdCode = bdCode;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	
	public String getTkCode() {
		return tkCode;
	}
	public void setTkCode(String tkCode) {
		this.tkCode = tkCode;
	}
	public ReportVO toReportVO() {
		ReportVO rep = new ReportVO();
		rep.setEmpId(this.empId);
		rep.setBdCode(this.bdCode);
		
		return rep;
	}

}
