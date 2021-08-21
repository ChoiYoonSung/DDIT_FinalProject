package com.spring.command;

import com.spring.dto.LikeVO;

public class LikeCommand {
	
	private String empId;
	private String bdCode;
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
	public LikeVO toLikeVO() {
		LikeVO like = new LikeVO();
		like.setEmpId(empId);
		like.setBdCode(bdCode);
		
		return like;
	}

}
