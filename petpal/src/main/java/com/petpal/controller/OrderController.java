package com.petpal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.petpal.dao.OrderDao;
import com.petpal.dto.OrderDetailDto;
import com.petpal.dto.ProductOrderDto;

@Controller
public class OrderController {
	@Autowired
	private OrderDao orderDao;

}
