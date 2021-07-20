package com.spring.command;

import com.spring.dto.LikeVO;

public class LikeCommand {
	
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
	public LikeVO toLikeVO() {
		LikeVO like = new LikeVO();
		like.setEmpId(this.empId);
		like.setBdCode(this.bdCode);
		
		return like;
	}

}
