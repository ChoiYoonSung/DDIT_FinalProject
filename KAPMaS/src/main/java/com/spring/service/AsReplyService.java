package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.AsReplyVO;

public interface AsReplyService {
	
		//앤서 댓글 등록
		void insertAsReply(AsReplyVO asReply)throws SQLException;
		
		//앤서 댓글 수정
		void updateAsReply(AsReplyVO asReply)throws SQLException;
		
		//앤서 댓글 삭제
		void deleteAsReply(String aRpCode)throws SQLException;
		
		//앤서 댓글 리스트 가져오기
		List<AsReplyVO> selectAsReplyListPage(String aCode)throws SQLException;
	

}
