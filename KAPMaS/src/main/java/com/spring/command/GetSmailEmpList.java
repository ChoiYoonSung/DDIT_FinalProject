package com.spring.command;

import com.spring.dto.RmailVO;
import com.spring.dto.SmailVO;

public class GetSmailEmpList {

	private String title;
	private String content;
	private String empList;

	private String receiver;

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getEmpList() {
		return empList;
	}

	public void setEmpList(String empList) {
		this.empList = empList;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public SmailVO toSmailVO() {
		SmailVO smail = new SmailVO();
		smail.setSmTitle(title);
		smail.setSmContent(content);
		smail.setSmReceiver(receiver);
		return smail;
	}

	public RmailVO toRmailVO() {
		RmailVO rmail = new RmailVO();
		rmail.setRmTitle(title);
		rmail.setRmContent(content);
		return rmail;

	}

}
