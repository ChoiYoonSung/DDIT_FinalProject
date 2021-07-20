package com.spring.dto;

import java.util.List;

public class CopArchiveVO {

	private String caCode;
	private String copCode;
	private String empId;
	private String caTitle;
	private String caContent;
	private String caRegdate;
	private String caType;
	private String caEnabled;
	private String caViewcnt;
	private String empName;
	private String copName;

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	private List<caAttachVO> attachList;

	public List<caAttachVO> getAttachList() {
		return attachList;
	}

	public void setAttachList(List<caAttachVO> attachList) {
		this.attachList = attachList;
	}

	public String getCopName() {
		return copName;
	}

	public void setCopName(String copName) {
		this.copName = copName;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
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

	public String getCaRegdate() {
		return caRegdate;
	}

	public void setCaRegdate(String caRegdate) {
		this.caRegdate = caRegdate;
	}

	public String getCaType() {
		return caType;
	}

	public void setCaType(String caType) {
		this.caType = caType;
	}

	public String getCaEnabled() {
		return caEnabled;
	}

	public void setCaEnabled(String caEnabled) {
		this.caEnabled = caEnabled;
	}

	public String getCaViewcnt() {
		return caViewcnt;
	}

	public void setCaViewcnt(String caViewcnt) {
		this.caViewcnt = caViewcnt;
	}

}
