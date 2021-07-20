package com.spring.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.PAVO;

public class ProPARegistCommand {

	private String paCode;
	private String pCode;
	private String paTitle;
	private String paContent;
	private String empId;
	private List<MultipartFile> uploadFile;

	public String getPaCode() {
		return paCode;
	}

	public void setPaCode(String paCode) {
		this.paCode = paCode;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getPaTitle() {
		return paTitle;
	}

	public void setPaTitle(String paTitle) {
		this.paTitle = paTitle;
	}

	public String getPaContent() {
		return paContent;
	}

	public void setPaContent(String paContent) {
		this.paContent = paContent;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}

	public PAVO toPAVO() {

		PAVO pa = new PAVO();
		pa.setpCode(pCode);
		pa.setPaTitle(paTitle);
		pa.setPaContent(paContent);
		pa.setEmpId(empId);

		return pa;
	}

}
