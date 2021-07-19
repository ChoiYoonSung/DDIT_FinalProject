package com.spring.scheduled;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.spring.command.GetSmailEmpList;
import com.spring.dto.ProEmpVO;
import com.spring.dto.ProVO;
import com.spring.dto.RmailVO;
import com.spring.dto.SmailVO;
import com.spring.service.EmpService;
import com.spring.service.ProService;
import com.spring.service.RmailService;
import com.spring.service.SmailService;

@Component
public class CompletionDateNotice {
	
	@Autowired
	private ProService proService;
	
	@Autowired
	private EmpService empService;
	
	@Autowired
	private RmailService rmailService;
	
	@Autowired
	private SmailService smailService;
	
	@Scheduled(cron="0 0 0 * * *") // 매일 자정
	public void mailScheduler() throws SQLException {
		GetSmailEmpList sm = new GetSmailEmpList();
		// 완료일 일주일 전 프로젝트 리스트
		List<ProVO> cdPro = proService.getCompletionDateProList();
		for(ProVO pro : cdPro) {
			List<ProEmpVO> pjmList = proService.selectProMemberList(pro.getpCode());
			for(ProEmpVO pjm : pjmList) {
				SmailVO smail = sm.toSmailVO();
				RmailVO rmail = sm.toRmailVO();
				
				smail.setEmpId("mimi"); // 관리자 아이디
				smail.setSmTitle("[KAPMas] 프로젝트 완료일 일주일 전 알림드립니다");
				smail.setSmContent("[KAPMas] " + pro.getpName() + "의 완료일은 " + pro.getpEnddate().split(" ")[0] + "로, 일주일 남았습니다.");
				smail.setSmReceiver(pjm.getEmpId());
				smail.setSmEnabled(1);
				smailService.sendMail(smail);
				
				rmail.setEmpId(pjm.getEmpId());
				rmail.setRmTitle("[KAPMas] 프로젝트 완료일 일주일 전 알림드립니다.");
				rmail.setRmContent("[KAPMas] " + pro.getpName() + "의 완료일은 " + pro.getpEnddate().split(" ")[0] + "로, 일주일 남았습니다.");
				rmail.setRmSender("mimi"); 
				rmail.setRmEnabled(1);
				rmailService.receiveMail(rmail);
			}
		}
	
	}
	
}
