package com.petpal.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.annotation.PostConstruct;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.petpal.configuration.CustomFileuploadProperties;
import com.petpal.dao.ProductAttachmentDao;
import com.petpal.dto.AttachmentDto;

@RestController
@RequestMapping("/attachment")
public class AttachmentController {
	@Autowired private CustomFileuploadProperties fileuploadProperties;
	@Autowired ProductAttachmentDao productAttachmentDao;
	
	
	private File dir;
	@PostConstruct
	public void init() {
		dir = new File(fileuploadProperties.getPath());
	}
	
	
	@GetMapping("/download")
	public ResponseEntity<ByteArrayResource> download(
			@RequestParam int attachmentNo) throws IOException{
		AttachmentDto attachmentDto = productAttachmentDao.selectOne(attachmentNo);
		if(attachmentDto == null) {
			return ResponseEntity.notFound().build();
		}
		
		File target = new File(dir, String.valueOf(attachmentNo));
		
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		
		return ResponseEntity.ok()
					.contentType(MediaType.APPLICATION_OCTET_STREAM)
					.contentLength(attachmentDto.getAttachmentSize())
					.header(HttpHeaders.CONTENT_ENCODING,
								StandardCharsets.UTF_8.name())
					.header(HttpHeaders.CONTENT_DISPOSITION,
								ContentDisposition.attachment()
														.filename(
																	attachmentDto.getAttachmentName(),
																	StandardCharsets.UTF_8
																).build().toString()
							)
							.body(resource);
	}
	
}
