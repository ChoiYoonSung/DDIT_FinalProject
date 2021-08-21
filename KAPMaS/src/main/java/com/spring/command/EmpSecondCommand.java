package com.spring.command;

import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.EmpVO;

public class EmpSecondCommand {

	private String empId; // id
	private String depCode; // 부서코드
	private String rnkCode; // 직급코드
	private String empName; // 이름
	private String empPwd; // 비번
	private String empEmail; // 이메일
	private String empPhone; // 폰

	private MultipartFile empImg; // 프로필 사진 경로
	private String oldImg; // 이전 사진
	private String uploadImg; // 바꾼 사진

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getDepCode() {
		return depCode;
	}

	public void setDepCode(String depCode) {
		this.depCode = depCode;
	}

	public String getRnkCode() {
		return rnkCode;
	}

	public void setRnkCode(String rnkCode) {
		this.rnkCode = rnkCode;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public String getEmpPwd() {
		return empPwd;
	}

	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getEmpPhone() {
		return empPhone;
	}

	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}

	public MultipartFile getEmpImg() {
		return empImg;
	}

	public void setEmpImg(MultipartFile empImg) {
		this.empImg = empImg;
	}

	public String getOldImg() {
		return oldImg;
	}

	public void setOldImg(String oldImg) {
		this.oldImg = oldImg;
	}

	public String getUploadImg() {
		return uploadImg;
	}

	public void setUploadImg(String uploadImg) {
		this.uploadImg = uploadImg;
	}
	

	public EmpVO toParseEmp() {
		EmpVO emp = new EmpVO();
		emp.setEmpId(this.empId);
		emp.setDepCode(this.depCode);
		emp.setRnkCode(this.rnkCode);
		emp.setEmpName(this.empName);
		emp.setEmpEmail(this.empEmail);
		emp.setEmpPhone(this.empPhone.replace("-", ""));
		emp.setEmpPwd(empPwd);

		return emp;
	}
}
