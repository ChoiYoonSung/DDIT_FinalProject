package com.spring.command;

import com.spring.dto.CopArchiveVO;

public class CopArchiveModifyCommand extends copArchiveRegistCommand {

	private String copCode;
	private String caCode;
	private int[] deleteFile;

	public String getCopCode() {
		return copCode;
	}

	public void setCopCode(String copCode) {
		this.copCode = copCode;
	}

	public String getCaCode() {
		return caCode;
	}

	public void setCaCode(String caCode) {
		this.caCode = caCode;
	}

	public int[] getDeleteFile() {
		return deleteFile;
	}

	public void setDeleteFile(int[] deleteFile) {
		this.deleteFile = deleteFile;
	}

	@Override
	public CopArchiveVO toArchiveVO() {
		CopArchiveVO ca = super.toArchiveVO();
		ca.setCaCode(this.caCode);
		ca.setCopCode(this.copCode);
		return ca;
	}

}
