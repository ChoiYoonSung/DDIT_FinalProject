package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.command.AnswerDeleteCommand;
import com.spring.command.AnswerRegistCommand;
import com.spring.command.AsReplyDeleteCommand;
import com.spring.command.AsReplyGetListCommand;
import com.spring.command.AsReplyRegistCommand;
import com.spring.dto.AnswerVO;
import com.spring.dto.AsReplyVO;
import com.spring.service.AsReplyService;

@RestController
@RequestMapping("/asReply")
public class AsReplyController {

	@Autowired
	private AsReplyService asReplyService;
	
	
	@RequestMapping(value="getList",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	public ResponseEntity<Map<String, Object>> replyList(@RequestBody AsReplyGetListCommand as)throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		
		AsReplyVO asReply = as.toAsReplyVO();
		
		String aacode= asReply.getaCode();
		
		List<AsReplyVO> asReplyList = asReplyService.selectAsReplyListPage(aacode);
		
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("asReplyList", asReplyList);
		dataMap.put("aacode", aacode);
		entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody AsReplyRegistCommand registAsr)	throws Exception {
		ResponseEntity<String> entity = null;

		AsReplyVO asReply = registAsr.toAsReplyVO();
		
		asReplyService.insertAsReply(asReply);
		
		entity = new ResponseEntity<String>(asReply.getaCode(),HttpStatus.OK);

		return entity;
	}	
	
	
	@RequestMapping(value="/AsReplyRemove",method = RequestMethod.POST)
	public ResponseEntity<String> remove(@RequestBody AsReplyDeleteCommand asd ) throws Exception{
		ResponseEntity<String> entity=null;
					
		AsReplyVO asReply=asd.toAsReplyVO();
		
		asReplyService.deleteAsReply(asReply.getaRpCode());
		
		entity=new ResponseEntity<String>(asReply.getaCode(),HttpStatus.OK);
		
		return entity;
	}	
	
	
	
	
	
	
	
	
	
	
	
}
