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
import com.spring.command.PiReplyModifyCommand;
import com.spring.command.PiReplyRegistCommand;
import com.spring.command.SearchCriteria;
import com.spring.dto.PIReplyVO;
import com.spring.service.PiReplyService;

@RestController
@RequestMapping("/piReplies")
public class PiReplyController {
	
	@Autowired
	private PiReplyService piReplyService;
	//-------------------------------------------
		@RequestMapping(value="/{piCode}/{page}", method = RequestMethod.GET)
		public ResponseEntity<Map<String, Object>> replyList(@PathVariable("piCode") String piCode, @PathVariable("page")int page)throws Exception{
			
			ResponseEntity<Map<String, Object>> entity = null;
			
			SearchCriteria cri = new SearchCriteria();
			cri.setPage(page);
			
			try {
				Map<String, Object>dataMap = piReplyService.getPiReplyList(piCode, cri);
				entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
			} catch (SQLException e) {
				e.printStackTrace();
				entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			return entity;
		}
		
		@RequestMapping(value = "/register", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
		public ResponseEntity<String> register(@RequestBody PiReplyRegistCommand registReq)	throws Exception {
			ResponseEntity<String> entity = null;

			PIReplyVO piReply = registReq.toPiReplyVO();	
			try {
				piReplyService.registPiReply(piReply);

				SearchCriteria cri = new SearchCriteria();

				Map<String, Object> dataMap = piReplyService.getPiReplyList(piReply.getPiCode(),cri);
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


		@RequestMapping(value = "/{piRpCode}", method = {RequestMethod.PUT,RequestMethod.PATCH})
		public ResponseEntity<String> modify(@PathVariable("piRpCode") int piRpCode,@RequestBody PiReplyModifyCommand modifyReq) 
																						throws Exception {
			ResponseEntity<String> entity = null;
			
			PIReplyVO piReply = modifyReq.toPiReplyVO();
			piReply.setPiRpCode(piRpCode);
			
			try {
				piReplyService.modifyPiReply(piReply);
				entity = new ResponseEntity<String>("성공", HttpStatus.OK);
			} catch (SQLException e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			}

			return entity;
		}
		
		@RequestMapping(value="/{piCode}/{piRpCode}/{page}", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
		public ResponseEntity<String> remove(@PathVariable("piRpCode") int piRpCode, @PathVariable("piCode") String piCode,
											 @PathVariable("page") int page) throws Exception{
			ResponseEntity<String> entity=null;
			try{
				piReplyService.removePiReply(piRpCode);
				
				SearchCriteria cri= new SearchCriteria();
							
				Map<String,Object> dataMap=piReplyService.getPiReplyList(piCode, cri);
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
		
		//-------------------------------------------	
}
