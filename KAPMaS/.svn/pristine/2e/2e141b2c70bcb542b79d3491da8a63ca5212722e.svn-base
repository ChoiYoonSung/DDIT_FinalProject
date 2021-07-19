package com.spring.command;

import com.spring.dto.EmpVO;

public class EmpRegistCommand {

	private String empName ;
	private String empId   ;
	private String empEmail;
	private String dep     ;
	private String rank    ;
	
	
	
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	public String getDep() {
		return dep;
	}
	public void setDep(String dep) {
		this.dep = dep;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	
	
	
	public EmpVO toEmpVO() {
		EmpVO emp=new EmpVO();
		emp.setEmpId(empId);
		emp.setEmpEmail(empEmail);
		emp.setEmpName(empName);
		emp.setDepCode(dep);
		emp.setRnkCode(rank);
		return emp;
		
	}
	
	
	
	public EmpVO toEmpVO2() {
		EmpVO emp=new EmpVO();
		emp.setEmpId(empId);
		emp.setEmpEmail(empEmail);
		return emp;
		
	}
	
	
	
	
}












