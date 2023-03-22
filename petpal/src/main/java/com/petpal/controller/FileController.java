package com.petpal.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.petpal.dao.AttachmentDao;
import com.petpal.dao.BoardDao;
import com.petpal.dao.BoardImageDao;
import com.petpal.dto.AttachmentDto;
import com.petpal.dto.BoardDto;
import com.petpal.dto.BoardImageDto;

@Controller
public class FileController {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private BoardImageDao boardImageDao;
	
	private File dir;
	
	@PostMapping("/upload")
	public String upload(@ModelAttribute BoardDto dto,
						 @RequestParam MultipartFile attach) throws IllegalStateException, IOException {
		
		// 공지사항 등록
		boardDao.insert(dto);
		
		if(!attach.isEmpty()) {
			int attachmentNo = attachmentDao.sequence();
			
			File target = new File(dir,String.valueOf(attachmentNo));
			attach.transferTo(target);
			
			attachmentDao.insert(AttachmentDto.builder()
								.attachmentNo(attachmentNo)
								.attachmentName(attach.getOriginalFilename())
								.attachmentType(attach.getContentType())
								.attachmentSize(attach.getSize())
								.build());
			// 공지사항과 첨부파일 정보를 연결
			boardImageDao.insert(BoardImageDto.builder()
									.boardNo(dto.getBoardNo())
									.attachmentNo(attachmentNo)
									.build());
			
		}
		
		return "redirect:/contact/notice";
	}

}
