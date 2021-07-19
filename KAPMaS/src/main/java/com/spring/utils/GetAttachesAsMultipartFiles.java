package com.spring.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.PAAttachVO;
import com.spring.dto.TkAttachVO;


public class GetAttachesAsMultipartFiles {

	
	/*
	public static List<AttachVO> save(List<MultipartFile> multiFiles,String savePath) throws Exception{

		List<AttachVO> attachList = new ArrayList<AttachVO>();
		
		if(multiFiles != null) {
			for(MultipartFile multi : multiFiles) {
				String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
				File target = new File(savePath,fileName);
				
				target.mkdirs();
				
				multi.transferTo(target);
				
				AttachVO attach = new AttachVO();
				attach.setUploadPath(savePath);
				attach.setFileName(fileName);
				attach.setFileType(fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase());
				
				attachList.add(attach);
				
			}
		}
		
		return attachList;
		
		
		
	}
	*/
		
	
	public static List<PAAttachVO> paSave(List<MultipartFile> multiFiles,String savePath) throws Exception{
		// 프로젝트 자료실 
		List<PAAttachVO> attachList = new ArrayList<PAAttachVO>();
		
		if(multiFiles != null) {
			for(MultipartFile multi : multiFiles) {
				String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
				File target = new File(savePath,fileName);
				
				target.mkdirs();
				
				multi.transferTo(target);
				
				PAAttachVO attach = new PAAttachVO();
				attach.setPaAtPath(savePath);
				attach.setPaAtName(fileName);
				attach.setPaAtType(fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase());
				
				attachList.add(attach);
				
			}
		}
		
		return attachList;
		
		
		
	}
	
	public static List<TkAttachVO> tkSave(List<MultipartFile> multiFiles,String savePath) throws Exception{
		
		List<TkAttachVO> attachList = new ArrayList<TkAttachVO>();
		
		if(multiFiles != null) {
			for(MultipartFile multi : multiFiles) {
				String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
				File target = new File(savePath,fileName);
				
				target.mkdirs();
				
				multi.transferTo(target);
				
				TkAttachVO attach = new TkAttachVO();
				attach.setTkAtPath(savePath);
				attach.setTkAtName(fileName);
				attach.setTkAtType(fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase());
				
				attachList.add(attach);
				
			}
		}
		
		return attachList;
		
		
		
	}
	
	
	
	
	
}
