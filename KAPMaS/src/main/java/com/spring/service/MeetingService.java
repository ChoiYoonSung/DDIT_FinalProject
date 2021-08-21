package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.MeetingVO;

public interface MeetingService {
	
	
	//해당 프로젝트 회의목록 출력
	List<MeetingVO> getMeetingListByPro(String pCode)throws SQLException;
	
	//회의록 등록
	void insertMeeting(MeetingVO meeting)throws SQLException;
	
	//회의록 삭제
	void deleteMeeting(String mtCode)throws SQLException;
	//회의정보 가져오기 
	MeetingVO selectMeetingByCode(String mtCode)throws SQLException;
}
