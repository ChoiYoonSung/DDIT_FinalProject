package com.spring.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public class RelegateVO {
	private String pCode;
	private String pName;
	private String empId;
	private List<MultipartFile> finalFile;
	private int[] relegateFile;
	private String prAttachPath;
	private String finalAttachPath;
	
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
	public List<MultipartFile> getFinalFile() {
		return finalFile;
	}
	public void setFinalFile(List<MultipartFile> finalFile) {
		this.finalFile = finalFile;
	}
	public int[] getRelegateFile() {
		return relegateFile;
	}
	public void setRelegateFile(int[] relegateFile) {
		this.relegateFile = relegateFile;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getPrAttachPath() {
		return prAttachPath;
	}
	public void setPrAttachPath(String prAttachPath) {
		this.prAttachPath = prAttachPath;
	}
	public String getFinalAttachPath() {
		return finalAttachPath;
	}
	public void setFinalAttachPath(String finalAttachPath) {
		this.finalAttachPath = finalAttachPath;
	}
	
	
	
}
