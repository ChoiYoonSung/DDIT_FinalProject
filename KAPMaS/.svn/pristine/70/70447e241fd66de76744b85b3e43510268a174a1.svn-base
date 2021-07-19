package com.spring.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.TotalKnowledgeVO;

public class TkRegistCommand {

	private String tkTitle;
	private String tkContent;
	private String empId;
	private String tkKeyword;
	private List<MultipartFile> uploadFile;

	public String getTkTitle() {
		return tkTitle;
	}

	public void setTkTitle(String tkTitle) {
		this.tkTitle = tkTitle;
	}

	public String getTkContent() {
		return tkContent;
	}

	public void setTkContent(String tkContent) {
		this.tkContent = tkContent;
	}

	public String getTkKeyword() {
		return tkKeyword;
	}

	public void setTkKeyword(String tkKeyword) {
		this.tkKeyword = tkKeyword;
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

	public TotalKnowledgeVO toTotalKnowledgeVO() {
		TotalKnowledgeVO tk = new TotalKnowledgeVO();
		tk.setTkContent(this.tkContent);
		tk.setTkTitle(this.tkTitle);
		tk.setEmpId(this.empId);
		tk.setTkKeyword(this.tkKeyword);
		
		return tk;
	}


}
