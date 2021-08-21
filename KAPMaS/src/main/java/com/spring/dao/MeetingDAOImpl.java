package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.MeetingVO;

public class MeetingDAOImpl implements MeetingDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<MeetingVO> getMeetingListByPro(String pCode) throws SQLException {
		
		List<MeetingVO> meetingList = session.selectList("Meeting-Mapper.getMeetingListByPro",pCode);
		
		
		return meetingList;
	}

	@Override
	public void insertMeeting(MeetingVO meeting) throws SQLException {
		
		session.update("Meeting-Mapper.insertMeeting", meeting);
	}

	@Override
	public void deleteMeeting(String mtCode) throws SQLException {
		
		session.update("Meeting-Mapper.deleteMeeting", mtCode);
		
		
	}

	@Override
	public MeetingVO selectMeetingByCode(String mtCode) throws SQLException {
		
		MeetingVO meeting = session.selectOne("Meeting-Mapper.selectMeetingByCode",mtCode );
		
		
		return meeting;
	}

}
