package com.spring.dto;

import java.util.List;

public class shareProjectVO {

	private String projectName;
	private String projectNo;
	private String projectPL;
	private String projectPLID;

	private String family;
	private String familyID;

	private List<String> selectedFamily;
	private List<String> selectedName;

	// case loginUser != projectPL
	private String content;

	public String getProjectPLID() {
		return projectPLID;
	}

	public void setProjectPLID(String projectPLID) {
		this.projectPLID = projectPLID;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFamilyID() {
		return familyID;
	}

	public void setFamilyID(String familyID) {
		this.familyID = familyID;
	}

	public List<String> getSelectedName() {
		return selectedName;
	}

	public void setSelectedName(List<String> selectedName) {
		this.selectedName = selectedName;
	}

	public String getFamily() {
		return family;
	}

	public void setFamily(String family) {
		this.family = family;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}

	public String getProjectPL() {
		return projectPL;
	}

	public void setProjectPL(String projectPL) {
		this.projectPL = projectPL;
	}

	public List<String> getSelectedFamily() {
		return selectedFamily;
	}

	public void setSelectedFamily(List<String> selectedFamily) {
		this.selectedFamily = selectedFamily;
	}

}
