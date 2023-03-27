package com.petpal.advice;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

public class ErrorController {

	@ExceptionHandler(Exception.class)
	public String error(Exception ex) {
		ex.printStackTrace();
		return "/WEB-INF/views/error/sorry.jsp";
	}
	
	//404 예외처리 메소드
	@ExceptionHandler(NoHandlerFoundException.class)
	public String notFound(Exception ex) {
		return "/WEB-INF/views/error/404.jsp";
	}
	
	//403번 대체 메소드
	@ExceptionHandler(RequirePermissionException.class)
	public String forbidden(Exception ex) {
		return "/WEB-INF/views/error/403.jsp";
	}
	
	//401번
	@ExceptionHandler(RequireLoginException.class)
	public String unAuthorized(Exception ex) {
		return "redirect:/member/login";
	}
	
}
