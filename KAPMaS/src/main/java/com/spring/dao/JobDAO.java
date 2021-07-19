package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.JobVO;

public interface JobDAO {

	//프로젝트 해당 업무 리스트
	List<JobVO> getJobList(String pCode)throws SQLException;
	
	//해당 사원의 전체 업무 리스트
	List<JobVO> getJobListById(JobVO job)throws SQLException;
	
	//프로젝트 해당인원 업무 리스트
	List<JobVO> getProJobListById(JobVO job)throws SQLException;
	
	//업무 정보 
	JobVO getJobInfo(String jobCode)throws SQLException;
	
	//업무등록
	void insertJob(JobVO job)throws SQLException;
	
	//업무 수정
	void updateJob(JobVO job)throws SQLException;
	
	//업무 비활성화
	void doNotJob(String jobCode)throws SQLException;
	
	//업무 활성화
	void doJob(String jobCode)throws SQLException;
	
	//기능별 업무 리스트
	List<JobVO> getServiceList(JobVO job)throws SQLException;
	
}
