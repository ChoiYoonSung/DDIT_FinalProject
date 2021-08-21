package com.spring.controller;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.command.AnswerDeleteCommand;
import com.spring.command.AnswerLikeCommand;
import com.spring.command.AnswerLikeCommand2;
import com.spring.command.AnswerModifyCommand;
import com.spring.command.AnswerRegistCommand;
import com.spring.command.LikeCommand;
import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.command.TkReplyModifyCommand;
import com.spring.dto.AnswerLikeVO;
import com.spring.dto.AnswerVO;
import com.spring.dto.LikeVO;
import com.spring.dto.TkReplyVO;
import com.spring.service.AnswerService;

@RestController
@RequestMapping("/answer")
public class AnswerController {

	@Autowired
	private AnswerService anserService;
	
	@RequestMapping(value="/{khCode}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> replyList(@PathVariable("khCode") String khCode, @PathVariable("page")int page)throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(page);
		
		try {
			Map<String, Object>dataMap = anserService.selectAnswerListPage(khCode, cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST, produces="application/json")
	public ResponseEntity<String> register(@RequestBody AnswerRegistCommand registAn)	throws Exception {
		ResponseEntity<String> entity = null;

		AnswerVO answer = registAn.toAnswerVO();
		
		try {
			anserService.insertAnswer(answer);

			SearchCriteria cri = new SearchCriteria();

			Map<String, Object> dataMap = anserService.selectAnswerListPage(answer.getKhCode(), cri);
			PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");
			int realEndPage = pageMaker.getRealEndPage();

			entity = new ResponseEntity<String>(""+realEndPage,HttpStatus.OK);
		} catch (SQLException e) {
//			anserService.insertAnswer(answer);
			
			SearchCriteria cri = new SearchCriteria();
			
			Map<String, Object> dataMap = anserService.selectAnswerListPage(answer.getKhCode(), cri);
			PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");
			int realEndPage = pageMaker.getRealEndPage();
			entity = new ResponseEntity<String>(""+realEndPage,HttpStatus.OK);
			e.printStackTrace();
//			entity = new ResponseEntity<String>(e.getMessage(),
//					HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}	
	
	@RequestMapping(value = "/AnswerModify", method = RequestMethod.POST)
	public ResponseEntity<String> modify(@RequestBody AnswerModifyCommand anm)throws Exception {
		ResponseEntity<String> entity = null;
		
		
		AnswerVO answer = anm.toAnswerVO();
		
		anserService.updateAnswer(answer);
		
		entity = new ResponseEntity<String>("SUCCESS,"+answer.getKhCode(), HttpStatus.OK);

		return entity;
	}
	
	@RequestMapping(value="/AnswerRemove",method = RequestMethod.POST)
	public ResponseEntity<String> remove(@RequestBody AnswerDeleteCommand and ) throws Exception{
		ResponseEntity<String> entity=null;
					
		
		AnswerVO answer = and.toAnswerVO();
		
		anserService.deleteAnswer(answer.getaCode(), answer.getKhCode());
		
		entity=new ResponseEntity<String>("SUCCESS,"+answer.getKhCode(),HttpStatus.OK);
		
		return entity;
	}	
	

	@RequestMapping(value="/likeCount", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> likeCount(@RequestBody AnswerLikeCommand2 get)throws Exception{
		ResponseEntity<Integer> entity = null;
		
		AnswerLikeVO aLike = get.toLikeVO();
		
		
		try {
			int count = anserService.answerLikeCount(aLike);
			System.out.println("count카운트 : " + count);
			entity = new ResponseEntity<Integer>(count, HttpStatus.OK);
		} catch(Exception e) {
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/like", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> like(@RequestBody AnswerDeleteCommand get) throws Exception{
		ResponseEntity<String> entity = null;
		AnswerLikeVO aLike = new AnswerLikeVO();
		aLike.setaCode(get.getaCode());
		aLike.setEmpId(get.getEmpId());
		anserService.increaseCnt(get.getaCode(), aLike);
		
		try {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/likeCancel", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> likeCancel(@RequestBody AnswerDeleteCommand get) throws Exception{
		ResponseEntity<String> entity = null;
		AnswerLikeVO aLike = new AnswerLikeVO();
		aLike.setaCode(get.getaCode());
		aLike.setEmpId(get.getEmpId());		
		
		anserService.decreaseCnt(get.getaCode(), aLike);
		
		try { 
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}


























