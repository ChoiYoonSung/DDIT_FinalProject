package com.spring.command;

import java.util.List;

import com.spring.dto.shareProjectVO;

public class projectShareCommand {

	private String projectName;
	private String projectNo;
	private String projectPL;
	private String projectPLID;

	private List<String> selectedFamily;
	private List<String> selectedName;

	// case loginUser != projectPL
	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getProjectPLID() {
		return projectPLID;
	}

	public void setProjectPLID(String projectPLID) {
		this.projectPLID = projectPLID;
	}

	public List<String> getSelectedName() {
		return selectedName;
	}

	public void setSelectedName(List<String> selectedName) {
		this.selectedName = selectedName;
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

	public shareProjectVO toShareProjectVO() {

		shareProjectVO sp = new shareProjectVO();
		sp.setProjectNo(this.projectNo);
		sp.setProjectName(this.projectName);
		sp.setProjectPL(this.projectPL);
		sp.setProjectPLID(this.projectPLID);
		sp.setSelectedFamily(this.selectedFamily);
		sp.setSelectedName(this.selectedName);
		sp.setContent(this.content);

		return sp;
	}

}
