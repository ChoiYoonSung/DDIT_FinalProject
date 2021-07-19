package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.JobVO;

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
	public List<JobVO> getJobListById(JobVO job) throws SQLException {
		List<JobVO> jobList = session.selectList("Job-Mapper.getJobListById", job);
		
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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
