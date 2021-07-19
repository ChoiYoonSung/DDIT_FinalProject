package com.spring.command;

import com.spring.dto.DepVO;
import com.spring.dto.RankVO;

public class GetCodeCommand {

	private String depCode;
	private String rnkCode;
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
	
	
	public DepVO toDepVO() {
		DepVO dep = new DepVO();
		dep.setDepCode(depCode);
		
		return dep;
	}
	
	
	public RankVO toRankVO() {
		RankVO rank = new RankVO();
		rank.setRnkCode(rnkCode);
		
		return rank;
		
	}
	



	
}
