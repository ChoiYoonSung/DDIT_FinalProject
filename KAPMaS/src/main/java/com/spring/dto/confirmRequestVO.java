package com.spring.dto;

import java.util.List;

public class confirmRequestVO {

	private List<String> familes;
	private List<String> names;
	private String projectPL;

	public String getProjectPL() {
		return projectPL;
	}

	public void setProjectPL(String projectPL) {
		this.projectPL = projectPL;
	}

	public List<String> getFamiles() {
		return familes;
	}

	public void setFamiles(List<String> familes) {
		this.familes = familes;
	}

	public List<String> getNames() {
		return names;
	}

	public void setNames(List<String> names) {
		this.names = names;
	}

}
