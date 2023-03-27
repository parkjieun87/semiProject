package com.petpal.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import com.petpal.interceptor.AdminInterceptor;
import com.petpal.interceptor.MemberInterceptor;
import com.petpal.interceptor.TestInterceptor;

@Configuration
public class InterceptorConfiguration {
	
	@Autowired
	private TestInterceptor testInterceptor;
	
	@Autowired
	private MemberInterceptor memberInterceptor;
	
	@Autowired
	private AdminInterceptor adminInterceptor;
	
	
}
