package com.spring.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.ProVO;
import com.spring.dto.RelegateVO;


public class RelegateCommand{
	
	private String pCode;
	private String pName;
	private String empId;
	private List<MultipartFile> finalFile;
	private int[] relegateFile;
	
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


	public RelegateVO toRelegateVO() {
		RelegateVO rlvo = new RelegateVO();
		rlvo.setEmpId(empId);
		rlvo.setpCode(pCode);
		return rlvo;
	}
	
}
