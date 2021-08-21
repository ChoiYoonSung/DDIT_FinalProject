package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.MeetingDAO;
import com.spring.dto.MeetingVO;

public class MeetingServiceImpl implements MeetingService{

	private MeetingDAO meetingDAO;
	public void setMeetingDAO(MeetingDAO meetingDAO) {
		this.meetingDAO = meetingDAO;
	}

	
	
	@Override
	public List<MeetingVO> getMeetingListByPro(String pCode) throws SQLException {
		List<MeetingVO> meetingList = meetingDAO.getMeetingListByPro(pCode);
		
		
		return meetingList;
	}

	
	
	@Override
	public void insertMeeting(MeetingVO meeting) throws SQLException {
		meetingDAO.insertMeeting(meeting);
	}

	
	
	@Override
	public void deleteMeeting(String mtCode) throws SQLException {
		meetingDAO.deleteMeeting(mtCode);
	}



	@Override
	public MeetingVO selectMeetingByCode(String mtCode) throws SQLException {
		
		
		MeetingVO meeting = meetingDAO.selectMeetingByCode(mtCode);
		
		return meeting;
	}

	
	
	
	
	
	
	
}
