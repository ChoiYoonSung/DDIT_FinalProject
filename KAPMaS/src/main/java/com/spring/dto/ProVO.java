package com.spring.dto;

public class ProVO {

	private String pCode;
	private String pName;
	private String pTitle;
	private String pSummary;
	private String pContent;
	private String pStartdate;
	private String pEnddate;
	private int pEnabled;
	private int pStatus;
	private String pmAuthority;
	private String pJob;
	private String totalPrograss;

	private String empName;
	private String empId;

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getpJob() {
		return pJob;
	}

	public void setpJob(String pJob) {
		this.pJob = pJob;
	}

	public String getPmAuthority() {
		return pmAuthority;
	}

	public void setPmAuthority(String pmAuthority) {
		this.pmAuthority = pmAuthority;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpSummary() {
		return pSummary;
	}

	public void setpSummary(String pSummary) {
		this.pSummary = pSummary;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public String getpStartdate() {
		return pStartdate;
	}

	public void setpStartdate(String pStartdate) {
		this.pStartdate = pStartdate;
	}

	public String getpEnddate() {
		return pEnddate;
	}

	public void setpEnddate(String pEnddate) {
		this.pEnddate = pEnddate;
	}

	public int getpEnabled() {
		return pEnabled;
	}

	public void setpEnabled(int pEnabled) {
		this.pEnabled = pEnabled;
	}

	public int getpStatus() {
		return pStatus;
	}

	public void setpStatus(int pStatus) {
		this.pStatus = pStatus;
	}

	public String getTotalPrograss() {
		return totalPrograss;
	}

	public void setTotalPrograss(String totalPrograss) {
		this.totalPrograss = totalPrograss;
	}

}
