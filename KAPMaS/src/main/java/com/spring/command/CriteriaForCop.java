package com.spring.command;

public class CriteriaForCop {

	private int page = 1;
	private int perPageNum = 5;
	private int startRowNum;
	private int endRowNum;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page < 1)
			page = 1;
		this.page = page;
	}

	public void setPage(String page) {
		if (page != null && !page.isEmpty()) {
			setPage(Integer.parseInt(page));
		} else {
			this.page = 1;
		}
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if(perPageNum < 1) perPageNum=1;
		this.perPageNum=perPageNum;
	}
	public void setPerPageNum(String perPageNum) {
		if(perPageNum!=null && !perPageNum.isEmpty()) {
			setPerPageNum(Integer.parseInt(perPageNum));
		}else {
			this.perPageNum=10;			
		}
	}

	public int getStartRowNum() {
		this.startRowNum=(this.page-1)*perPageNum;
		return this.startRowNum;
	}

	public int getEndRowNum() {
		this.endRowNum=this.startRowNum+this.perPageNum-1;
		return this.endRowNum;
	}

}
