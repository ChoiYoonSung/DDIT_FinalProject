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
import org.springframework.web.bind.annotation.RestController;

import com.spring.command.PageMaker;
import com.spring.command.TkReplyModifyCommand;
import com.spring.command.TkReplyRegistCommand;
import com.spring.command.SearchCriteria;
import com.spring.dto.TkReplyVO;
import com.spring.service.TkReplyService;

@RestController
@RequestMapping("/tkReplies")
public class TkReplyController {
	
	@Autowired
	private TkReplyService service;
	
	@RequestMapping(value="/{tkCode}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> replyList(@PathVariable("tkCode") String tkCode, @PathVariable("page")int page)throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(page);
		
		try {
			Map<String, Object>dataMap = service.getTkReplyList(tkCode, cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody TkReplyRegistCommand registReq)	throws Exception {
		ResponseEntity<String> entity = null;

		TkReplyVO tkReply = registReq.toTkReplyVO();	
		try {
			service.registTkReply(tkReply);

			SearchCriteria cri = new SearchCriteria();

			Map<String, Object> dataMap = service.getTkReplyList(tkReply.getTkCode(),cri);
			PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");
			int realEndPage = pageMaker.getRealEndPage();

			entity = new ResponseEntity<String>("SUCCESS,"+realEndPage,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),
					HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}	


	@RequestMapping(value = "/{tkRpCode}", method = {RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> modify(@PathVariable("tkRpCode") int tkRpCode,@RequestBody TkReplyModifyCommand modifyReq) 
																					throws Exception {
		ResponseEntity<String> entity = null;
		
		TkReplyVO tkReply = modifyReq.toTkReplyVO();
		tkReply.setTkRpCode(tkRpCode);
		
		try {
			service.modifyTkReply(tkReply);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	@RequestMapping(value="/{tkCode}/{tkRpCode}/{page}",method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("tkRpCode") int tkRpCode,
										 @PathVariable("tkCode") String tkCode,
										 @PathVariable("page") int page) throws Exception{
		ResponseEntity<String> entity=null;
		try{
			service.removeTkReply(tkRpCode);
			
			SearchCriteria cri= new SearchCriteria();
						
			Map<String,Object> dataMap=service.getTkReplyList(tkCode, cri);
			PageMaker pageMaker = (PageMaker)dataMap.get("pageMaker");
			
			int realEndPage=pageMaker.getRealEndPage();
			if(page>realEndPage){page=realEndPage;}
			
			
			entity=new ResponseEntity<String>(""+page,HttpStatus.OK);
		}catch(SQLException e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}	
}
