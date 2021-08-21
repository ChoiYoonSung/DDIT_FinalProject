package com.spring.command;

import com.spring.dto.JobVO;

public class deleteMEM {
	private String id  ;
	private String code;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	
	
	
	public JobVO toJobVO() {
		JobVO job = new JobVO();
		job.setEmpId(id);
		job.setJobCode(code);
		
		
		return job;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
