package com.spring.dto;

/**
 * @author PC-06
 *
 */
public class ProPjmVO {

	private String pCode;
	private String pName;
	private String pEnddate;
	private String pStartdate;
	private String pmAuthority;
	
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
	public String getpEnddate() {
		return pEnddate;
	}
	public void setpEnddate(String pEnddate) {
		this.pEnddate = pEnddate;
	}
	public String getPmAuthority() {
		return pmAuthority;
	}
	public void setPmAuthority(String pmAuthority) {
		this.pmAuthority = pmAuthority;
	}
	public String getpStartdate() {
		return pStartdate;
	}
	public void setpStartdate(String pStartdate) {
		this.pStartdate = pStartdate;
	}
	
}
