package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.DailyReportVO;
import com.spring.dto.JobVO;
import com.spring.dto.WeeklyReportVO;

public class JobDAOImpl implements JobDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<JobVO> getJobList(String pCode) throws SQLException {
		List<JobVO> jobList = session.selectList("Job-Mapper.getJobList", pCode);
		
		return jobList;
	}
	
	
	@Override
	public List<JobVO> getJobListById(String empId) throws SQLException {
		List<JobVO> jobList = session.selectList("Job-Mapper.getJobListById", empId);
		
		return jobList;
	}
	
	@Override
	public List<JobVO> getProJobListById(JobVO job) throws SQLException {
		List<JobVO> jobList = session.selectList("Job-Mapper.getProJobListById", job);
		
		return jobList;
	}
	
	@Override
	public JobVO getJobInfo(String jobCode) throws SQLException {
		JobVO job = session.selectOne("Job-Mapper.getJobInfo", jobCode);
		
		return job;
	}
	
	@Override
	public void insertJob(JobVO job) throws SQLException {
		
		session.update("Job-Mapper.insertJob", job);
		
	}
	
	@Override
	public void updateJob(JobVO job) throws SQLException {
		
		session.update("Job-Mapper.updateJob", job);
		
	}
	
	@Override
	public void doNotJob(String jobCode) throws SQLException {
		
		session.update("Job-Mapper.doNotJob", jobCode);
		
	}
	
	@Override
	public void doJob(String jobCode) throws SQLException {
		
		session.update("Job-Mapper.doJob", jobCode);
		
	}

	@Override
	public List<JobVO> getServiceList(JobVO job) throws SQLException {
		
		List<JobVO> serviceList=session.selectList("Job-Mapper.getServiceList", job);
		
		return serviceList;
	}

	
	//------------------업무 보고-----------------
	// 일일
	@Override
	public List<DailyReportVO> getDailyReportList(String pCode) throws SQLException {
		List<DailyReportVO> drList = session.selectList("JR-Mapper.selectDailyReportList",pCode);
		return drList;
	}

	@Override
	public DailyReportVO getDailyReport(String drCode) throws SQLException {
		DailyReportVO dr = session.selectOne("JR-Mapper.selectDailyReport",drCode);
		return dr;
	}

	@Override
	public void insertDailyReport(DailyReportVO dr) throws SQLException {
		session.update("JR-Mapper.insertDailyReport",dr);
	}

	@Override
	public void updateDailyReport(DailyReportVO dr) throws SQLException {
		session.update("JR-Mapper.updateDailyReport",dr);
	}

	@Override
	public void deleteDailyReport(String drCode) throws SQLException {
		session.update("JR-Mapper.deleteDailyReport",drCode);
	}

	// 일일
	@Override
	public List<WeeklyReportVO> getWeeklyReportList(String pCode) throws SQLException {
		List<WeeklyReportVO> wrList = session.selectList("JR-Mapper.selectWeeklyReportList",pCode);
		return wrList;
	}

	@Override
	public WeeklyReportVO getWeeklyReport(String wrCode) throws SQLException {
		WeeklyReportVO wr = session.selectOne("JR-Mapper.selectWeeklyReport",wrCode);
		return wr;
	}

	@Override
	public void insertWeeklyReport(WeeklyReportVO wr) throws SQLException {
		session.update("JR-Mapper.insertWeeklyReport",wr);
	}

	@Override
	public void updateWeeklyReport(WeeklyReportVO wr) throws SQLException {
		session.update("JR-Mapper.updateWeeklyReport",wr);
	}

	@Override
	public void deleteWeeklyReport(String wrCode) throws SQLException {
		session.update("JR-Mapper.deleteWeeklyReport",wrCode);
	}

	@Override
	public List<JobVO> getProJobListById2(JobVO job) throws SQLException {
		
		List<JobVO> jobList = session.selectList("Job-Mapper.getProJobListById2",job);
		
		return jobList;
	}

	@Override
	public void updateEmp(JobVO job) throws SQLException {
		
		session.update("Job-Mapper.updateMember", job);
		
	}

	
}
