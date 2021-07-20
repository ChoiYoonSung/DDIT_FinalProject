package com.spring.command;

import com.spring.dto.JobVO;

public class JobModifyCommand {

	private String name    ;
	private String content ;
	private String start   ;
	private String end     ;
	private String emp     ;
	private int prograss;
	private String selbox  ;
	private String ser     ;
	private String jobCode;
	private String pCode;
	
	
	
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getEmp() {
		return emp;
	}
	public void setEmp(String emp) {
		this.emp = emp;
	}
	public int getPrograss() {
		return prograss;
	}
	public void setPrograss(int prograss) {
		this.prograss = prograss;
	}
	public String getSelbox() {
		return selbox;
	}
	public void setSelbox(String selbox) {
		this.selbox = selbox;
	}
	public String getSer() {
		return ser;
	}
	public void setSer(String ser) {
		this.ser = ser;
	}
	
	
	public JobVO toJobVO() {
		JobVO job = new JobVO();
		job.setEmpId(emp);
		job.setJobContent(content);
		job.setJobEnddate(end);
		job.setJobStartdate(start);
		job.setJobPrograss(prograss);
		job.setJobName(name);
		job.setJobCode(jobCode);
		job.setpCode(pCode);
		
		return job;
	}
	
	
	
	
	
	
	
	
}
