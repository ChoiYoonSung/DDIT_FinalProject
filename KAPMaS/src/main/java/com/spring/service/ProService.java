package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.SearchCriteriaByPA;
import com.spring.dto.PAAttachVO;
import com.spring.dto.PAVO;
import com.spring.dto.PIVO;
import com.spring.dto.PjmVO;
import com.spring.dto.ProEmpVO;
import com.spring.dto.ProPjmVO;
import com.spring.dto.ProVO;
import com.spring.dto.RelegateVO;

public interface ProService {
	
		//아이디로 내가 들어가있는 프로젝트 리스트 검색(참여중 + 옵저버)
		List<ProPjmVO> getListProById(String empId) throws SQLException;
	
		//아이디로 내가 참여중인 프로젝트 리스트 검색
		List<ProVO> getListDoProById(String empId)throws SQLException;
		
		//아이디로 내가 옵저버중인 프로젝트 리스트 검색
		List<ProVO> getListAopProById(String empId)throws SQLException;
		
		//아이디로 내가 참여중인 비활성화 프로젝트 리스트 검색
		List<ProVO> getListNotProById(String empId)throws SQLException;
		
		//프로젝트 증록
		public void insertProject(ProVO pro)throws SQLException;
		
		//프로젝트 정보 수정
		public void updateProject(ProVO pro)throws SQLException;
		
		//프로젝트 비활성화
		public void notDoProject(String pCode)throws SQLException;
	
		//프로젝트 활성화
		public void DoProject(String pCode)throws SQLException;
		
		//프로젝트 등록시 PL추가
		public void insertPL(PjmVO pjm)throws SQLException;
		
		//프로젝트 참여자 추가
		public void insertMember(PjmVO pjm)throws SQLException;
		
		//프로젝트 참여자 역활 추가
		void updateAu(PjmVO pjm)throws SQLException;
		
		//최근등록된 프로젝트 코드 가져오기
		public String getPcode()throws SQLException;

		//프로젝트 코드로 정보 가져오기
		public ProVO getProInfo(String pCode)throws SQLException;
		
		// 자료실 글 등록
		void registPA(PAVO pa) throws SQLException;

		// 자료실 리스트 검색
		public Map<String, Object> getPAList(SearchCriteriaByPA cri) throws SQLException;

		// 자료실 상세조회
		PAVO getPA(String pacode) throws SQLException;
		
		//프로젝트 참여 인원 검색
		List<ProEmpVO> selectProMemberList(String pCode)throws SQLException;
		
		// 프로젝트 이관 자료 불러오기
		public List<PAAttachVO> getPAAllAttachesBypCode(String pCode) throws SQLException; 

		// 프로젝트 이관 저장
		void registRelegate(RelegateVO rlvo) throws SQLException;
		
		// 프로젝트 이관 유무
		public RelegateVO selectRelegate(String pCode) throws SQLException;
		
		// 프로젝트 이관 삭제
		void removeRelegate(String pCode) throws SQLException;
		
		// 자료실 상세조회 첨부파일 불러오기
		PAAttachVO getAttachByPaAtNo(int paatno) throws SQLException;

		// 자료실 수정 파일 삭제
		void removeAttachByPaAtNo(int paatno) throws SQLException;

		// 자료실 수정
		void modifyPA(PAVO pa) throws SQLException;
		
		// 자료실 삭제
		void remove(String pacode) throws SQLException;

		// 프로젝트 완료일 알림 프로젝트 불러오기
		List<ProVO> getCompletionDateProList() throws SQLException;

		//프로젝트 기능 카테고리 업데이트
		void updateService(ProVO pro)throws SQLException;

		//프로젝트 이슈
		// 프로젝트 이슈 리스트 조회(프로젝트 내)
		public List<PIVO> selectPIList(String pCode) throws SQLException;
		// 프로젝트 마일스톤 리스트 조회(프로젝트 내)
		public List<Object> selectPIMileStoneList(String pCode) throws SQLException;
		// 이슈 조회
		public PIVO selectPI(String piCode) throws SQLException;
		//이슈 등록(기존 마일스톤)
		public void insertPI(PIVO pi) throws SQLException;
		//이슈 등록(새 마일스톤)
		public void insertPINew(PIVO pi) throws SQLException;
		//이슈 수정
		public void updatePI(PIVO pi) throws SQLException;
		//이슈 완료
		public void completePI(String piCode) throws SQLException;
		//이슈 삭제
		public void deletePI(String piCode) throws SQLException;
}
