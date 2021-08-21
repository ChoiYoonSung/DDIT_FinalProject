package com.spring.command;


public class SearchCriteriaByPro extends Criteria {

	private String orderType=""; // 검색구분
	private String keyword=""; //검색어
	private String empId="";
	
	
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	
	public SearchCriteriaByPro toSearchCriteriaByPro() {
		SearchCriteriaByPro sp = new SearchCriteriaByPro();
		sp.setEmpId(this.empId);
		sp.setKeyword(this.keyword);
		sp.setOrderType(this.orderType);
		return sp;
	}

	
	
}
