package com.spring.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.CopArchiveVO;

public class copArchiveRegistCommand {

	private String caCode;
	private String copCode;
	private String empId;
	private String empName;
	private String caTitle;
	private String caContent;
	private String caType;
	private List<MultipartFile> uploadFile;

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getCaCode() {
		return caCode;
	}

	public void setCaCode(String caCode) {
		this.caCode = caCode;
	}

	public String getCopCode() {
		return copCode;
	}

	public void setCopCode(String copCode) {
		this.copCode = copCode;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getCaTitle() {
		return caTitle;
	}

	public void setCaTitle(String caTitle) {
		this.caTitle = caTitle;
	}

	public String getCaContent() {
		return caContent;
	}

	public void setCaContent(String caContent) {
		this.caContent = caContent;
	}

	public String getCaType() {
		return caType;
	}

	public void setCaType(String caType) {
		this.caType = caType;
	}

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}

	public CopArchiveVO toArchiveVO() {

		CopArchiveVO ca = new CopArchiveVO();
		ca.setCopCode(this.copCode);
		ca.setEmpId(this.empId);
		ca.setCaTitle(this.caTitle);
		ca.setCaContent(this.caContent);
		ca.setCaType(this.caType);
		ca.setEmpName(this.empName);

		return ca;
	}

}
