package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.JobDAO;
import com.spring.dto.JobVO;

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
	public List<JobVO> getJobListById(JobVO job) throws SQLException {
		List<JobVO> jobList = jobDAO.getJobListById(job);
		
		
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

}
