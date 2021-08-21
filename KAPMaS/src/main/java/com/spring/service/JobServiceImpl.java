package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.JobDAO;
import com.spring.dto.DailyReportVO;
import com.spring.dto.JobVO;
import com.spring.dto.WeeklyReportVO;

public class JobServiceImpl implements JobService{

	
	private JobDAO jobDAO;
	public void setJobDAO(JobDAO jobDAO) {
		this.jobDAO = jobDAO;
	}

	
	@Override
	public List<JobVO> getJobList(String pCode) throws SQLException {
		List<JobVO> jobList = jobDAO.getJobList(pCode);
		
		
		return jobList;
	}

	@Override
	public List<JobVO> getJobListById(String empId) throws SQLException {
		List<JobVO> jobList = jobDAO.getJobListById(empId);
		
		
		return jobList;
	}

	@Override
	public List<JobVO> getProJobListById(JobVO job) throws SQLException {
		List<JobVO> jobList = jobDAO.getProJobListById(job);
		
		
		return jobList;
	}

	@Override
	public JobVO getJobInfo(String jobCode) throws SQLException {
		JobVO job = jobDAO.getJobInfo(jobCode);
		
		
		return job;
	}

	@Override
	public void insertJob(JobVO job) throws SQLException {
		jobDAO.insertJob(job);
		
	}

	@Override
	public void updateJob(JobVO job) throws SQLException {

		jobDAO.updateJob(job);
	}

	@Override
	public void doNotJob(String jobCode) throws SQLException {

		jobDAO.doNotJob(jobCode);
	}

	@Override
	public void doJob(String jobCode) throws SQLException {

		jobDAO.doJob(jobCode);
	}


	@Override
	public List<JobVO> getServiceList(JobVO job) throws SQLException {
		
		List<JobVO> serviceList= jobDAO.getServiceList(job);
		
		return serviceList;
	}


	//------------------일일 업무 보고-------------------
	@Override
	public List<DailyReportVO> getDailyReportList(String pCode) throws SQLException {
		List<DailyReportVO> drList = jobDAO.getDailyReportList(pCode);
		return drList;
	}


	@Override
	public DailyReportVO getDailyReport(String drCode) throws SQLException {
		DailyReportVO dr = jobDAO.getDailyReport(drCode);
		return  dr;
	}


	@Override
	public void insertDailyReport(DailyReportVO dr) throws SQLException {
		jobDAO.insertDailyReport(dr);
	}


	@Override
	public void updateDailyReport(DailyReportVO dr) throws SQLException {
		jobDAO.updateDailyReport(dr);
	}


	@Override
	public void deleteDailyReport(String drCode) throws SQLException {
		jobDAO.deleteDailyReport(drCode);
	}

	
	//------------------주간 업무 보고-------------------
	@Override
	public List<WeeklyReportVO> getWeeklyReportList(String pCode) throws SQLException {
		List<WeeklyReportVO> wrList = jobDAO.getWeeklyReportList(pCode);
		return wrList;
	}


	@Override
	public WeeklyReportVO getWeeklyReport(String wrCode) throws SQLException {
		WeeklyReportVO wr = jobDAO.getWeeklyReport(wrCode);
		return wr;
	}


	@Override
	public void insertWeeklyReport(WeeklyReportVO wr) throws SQLException {
		jobDAO.insertWeeklyReport(wr);
	}


	@Override
	public void updateWeeklyReport(WeeklyReportVO wr) throws SQLException {
		jobDAO.updateWeeklyReport(wr);
	}


	@Override
	public void deleteWeeklyReport(String wrCode) throws SQLException {
		jobDAO.deleteWeeklyReport(wrCode);
	}


	@Override
	public List<JobVO> getProJobListById2(JobVO job) throws SQLException {
		List<JobVO> jobList = jobDAO.getProJobListById2(job);
		
		
		return jobList;
	}


	@Override
	public void updateEmp(JobVO job) throws SQLException {
		jobDAO.updateEmp(job);
		
	}
	
}
