package com.spring.security;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.spring.dto.EmpVO;



public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		User user = (User)authentication.getDetails();
		
		EmpVO loginUser = user.getMemberVO();
		
		//set loginUser to session
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", loginUser);
		session.setMaxInactiveInterval(-1);
		
		//log 작성
		logFile(loginUser,request);
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
	
	private void logFile(EmpVO loginUser,HttpServletRequest reqquest)throws IOException{
		//로그인 정보를 스트링으로 저장
		String tag = "[login:user]";
		String log = tag
					+loginUser.getEmpId()+","
					+loginUser.getEmpPhone()+","
					+loginUser.getEmpEmail()+","
					+reqquest.getRemoteAddr()+","
					+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		
		//로그파일 생성
		String savePath="d:\\log";
		File file=new File(savePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		String logFilePath = savePath+File.separator+"login_user_log.csv";
		BufferedWriter out = 
					new BufferedWriter(new FileWriter(logFilePath,true));
		
		//로그를 기록
		out.write(log);
		out.newLine();

		if(out != null)out.close();
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
