package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.DailyReportVO;
import com.spring.dto.JobVO;
import com.spring.dto.WeeklyReportVO;

public interface JobService {
	//------------------업무등록------------------
	//프로젝트 해당 업무 리스트
	List<JobVO> getJobList(String pCode)throws SQLException;
	
	//해당 사원의 전체 업무 리스트
	List<JobVO> getJobListById(String empId)throws SQLException;
	
	//프로젝트 해당인원 업무 리스트
	List<JobVO> getProJobListById(JobVO job)throws SQLException;
	
	//프로젝트 해당인원 업무 리스트
	List<JobVO> getProJobListById2(JobVO job)throws SQLException;
	
	//프로젝트 업무 담당자 인수인계
	void updateEmp(JobVO job)throws SQLException;
	
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
	
	
	
	//------------------업무보고------------------
	// 일일 업무 보고 조회
	List<DailyReportVO> getDailyReportList(String pCode) throws SQLException;
	
	// 일일 업무 보고 상세 조회
	DailyReportVO getDailyReport(String drCode) throws SQLException;
	
	// 일일 업무 보고 등록
	void insertDailyReport(DailyReportVO dr) throws SQLException;
	
	// 일일 업무 보고 수정
	void updateDailyReport(DailyReportVO dr) throws SQLException;
	
	// 일일 업무 보고 삭제
	void deleteDailyReport(String drCode) throws SQLException;
	
	
	// 주간 업무 보고 조회
	List<WeeklyReportVO> getWeeklyReportList(String pCode) throws SQLException;
	
	// 주간 업무 보고 상세 조회
	WeeklyReportVO getWeeklyReport(String wrCode) throws SQLException;
	
	// 주간 업무 보고 등록
	void insertWeeklyReport(WeeklyReportVO wr) throws SQLException;
	
	// 주간 업무 보고 수정
	void updateWeeklyReport(WeeklyReportVO wr) throws SQLException;
	
	// 주간 업무 보고 삭제
	void deleteWeeklyReport(String wrCode) throws SQLException;
	
}
