package com.spring.command;

import com.spring.dto.CoPVO;

public class CopRegistCommand {

	private String copCode; // 시퀀스
	private String copName; // 입력받기
	private String copRegdate; // sysdate
	private String copType; // 체크박스 입력
	private String copDetail; // 입력받기
	private String copSubject; // 입력받기
	private String copOwner; // loginUser
	private String copBannerimg; // 입력받기
	private String copProfileimg;// 입력받기

	public String getCopBannerimg() {
		return copBannerimg;
	}

	public void setCopBannerimg(String copBannerimg) {
		this.copBannerimg = copBannerimg;
	}

	public String getCopProfileimg() {
		return copProfileimg;
	}

	public void setCopProfileimg(String copProfileimg) {
		this.copProfileimg = copProfileimg;
	}

	public String getCopCode() {
		return copCode;
	}

	public void setCopCode(String copCode) {
		this.copCode = copCode;
	}

	public String getCopName() {
		return copName;
	}

	public void setCopName(String copName) {
		this.copName = copName;
	}

	public String getCopRegdate() {
		return copRegdate;
	}

	public void setCopRegdate(String copRegdate) {
		this.copRegdate = copRegdate;
	}

	public String getCopType() {
		return copType;
	}

	public void setCopType(String copType) {
		this.copType = copType;
	}

	public String getCopDetail() {
		return copDetail;
	}

	public void setCopDetail(String copDetail) {
		this.copDetail = copDetail;
	}

	public String getCopSubject() {
		return copSubject;
	}

	public void setCopSubject(String copSubject) {
		this.copSubject = copSubject;
	}

	public String getCopOwner() {
		return copOwner;
	}

	public void setCopOwner(String copOwner) {
		this.copOwner = copOwner;
	}

	@Override
	public String toString() {
		return "CopRegistCommand [copBannerimg=" + copBannerimg + ", copProfileimg=" + copProfileimg + ", copCode="
				+ copCode + ", copName=" + copName + ", copRegdate=" + copRegdate + ", copType=" + copType
				+ ", copDetail=" + copDetail + ", copSubject=" + copSubject + ", copOwner=" + copOwner + "]";
	}

	public CoPVO toCopVO() {

		CoPVO cop = new CoPVO();
		cop.setCopCode(this.copCode);
		cop.setCopDetail(this.copDetail);
		cop.setCopName(this.copName);
		cop.setCopOwner(this.copOwner);
		cop.setCopRegdate(this.copRegdate);
		cop.setCopType(this.copType);
		cop.setCopSubject(this.copSubject);
		cop.setCopBannerimg(this.copBannerimg);
		cop.setCopProfileimg(this.copProfileimg);

		return cop;
	}

}