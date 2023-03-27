package com.petpal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.petpal.dto.OrderDetailDto;
import com.petpal.dto.ProductOrderDto;

@Controller
public class OrderController {

	@Autowired
	private ProductOrderDto productOrderDto;
	
	@Autowired
	private OrderDetailDto orderDetailDto;
	
	
}
