package com.spring.command;

import com.spring.dto.PjmVO;

public class UpdatePjmAu {

	
	
	
	private String au  ;
	private String code;
	private String id  ;
	
	
	
	public String getAu() {
		return au;
	}
	public void setAu(String au) {
		this.au = au;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	public PjmVO toPjmVO() {
		PjmVO pjm = new PjmVO();
		pjm.setEmpId(id);
		pjm.setpCode(code);
		pjm.setPmAuthority(au);
		
		return pjm;
	}
	
	
	
	
	
	
	
	
	
	
	
}
