package com.spring.mail;


import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;


public class MimeAttachNotifier {

	private JavaMailSender mailSender;
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	
	public void sendMail(String email,String pwd)throws Exception{
		//메세지 생성
		MimeMessage message = mailSender.createMimeMessage();
		
		//메세지 작성 헬퍼
		MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"utf-8");
		
		//받는 사람
		messageHelper.setTo(new InternetAddress(email));
		//보내는 사람
		messageHelper.setFrom("princebyun@naver.com","운영자");
		//제목
		messageHelper .setSubject("임시 비밀번호");
		//내용
		messageHelper.setText(pwd,true);
		 
		mailSender.send(message);
		
	}
	
}







