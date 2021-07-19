package com.spring.command;

public class SearchCriteriaByPA extends Criteria {

	private String searchType=""; // 검색구분
	private String keyword=""; //검색어
	private String pCode="";
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	
	
	
	
}
