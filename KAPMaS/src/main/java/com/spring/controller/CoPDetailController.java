package com.spring.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dto.CoPVO;
import com.spring.dto.CopArchiveVO;
import com.spring.dto.CopFamilyDiscussionVO;
import com.spring.service.CoPService;

@Controller
@RequestMapping(value = "/cop/detail")
public class CoPDetailController {

	@Autowired
	private CoPService copService;

	@RequestMapping(value = "/main/{copCode}", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView mnv, @PathVariable String copCode) throws SQLException {
		String url = "cop_detail/main.open";

		Map<String, Object> dataMap = copService.getCopInfo(copCode);
		
		CoPVO copInfo = (CoPVO) dataMap.get("copInfo");
		
		List<CopArchiveVO> ca = copService.getCopArchiveList(copCode);
		List<CopFamilyDiscussionVO> cfd = copService.getCopDiscussionList(copCode);

		mnv.addObject("copInfo", copInfo);
		mnv.addObject("discussionList", cfd);
		mnv.addObject("archiveList", ca);

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value = "/discussion/{copCode}", method = RequestMethod.GET)
	public ModelAndView discussion(ModelAndView mnv, @PathVariable String copCode) throws SQLException {
		String url = "cop_detail/discussion.open";
		
		mnv.setViewName(url);		
		return mnv;
	}
	
	@RequestMapping(value = "/coppds/{copCode}", method = RequestMethod.GET)
	public ModelAndView coppds(ModelAndView mnv, @PathVariable String copCode) throws SQLException {
		String url = "cop_detail/coppds.open";
		copService.getCopArchiveList(copCode);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value = "/shareProject/{copCode}", method = RequestMethod.GET)
	public ModelAndView shareProject(ModelAndView mnv, @PathVariable String copCode) throws SQLException {
		String url = "cop_detail/shareProject.open";
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value = "/copManage/{copCode}", method = RequestMethod.GET)
	public ModelAndView copManage(ModelAndView mnv, @PathVariable String copCode) throws SQLException {
		String url = "cop_detail/copManage.open";
		
		mnv.setViewName(url);
		return mnv;
	}

}
