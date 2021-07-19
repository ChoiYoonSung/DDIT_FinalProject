package com.spring.command;

import com.spring.dto.JobVO;

public class GetJobInfo {
	
	
	private String pCode  ;
	private String empId  ;
	private String jobCode;
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
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	
	
	
	public JobVO toJobVO() {
		JobVO job= new JobVO();
		
		
		return job;
	}
	
	
	
	
	
	
}
