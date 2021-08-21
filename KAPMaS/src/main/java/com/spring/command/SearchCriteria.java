package com.spring.command;

public class SearchCriteria extends Criteria {

	private String searchType=""; // 검색구분
	private String keyword=""; //검색어
	private String[] userArray;
	
	
	public String[] getUserArray() {
		return userArray;
	}
	public void setUserArray(String[] userArray) {
		this.userArray = userArray;
	}
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
	
	
}
