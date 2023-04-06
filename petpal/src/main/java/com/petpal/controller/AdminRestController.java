package com.petpal.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.petpal.dao.SalesDao;
import com.petpal.dto.DailySalesDto;
import com.petpal.dto.MonthlySalesDto;

@CrossOrigin(origins = {"*"})
@RestController
@RequestMapping("/admin")
public class AdminRestController {
	
	@Autowired
	private SalesDao salesDao;
	
	@GetMapping("/dailysales")
	public Map<String, List<Object>> dailySales() {
		List<DailySalesDto> list = salesDao.selectDailyList();
		
		List<Object> days = new ArrayList<>();
		List<Object> totals = new ArrayList<>();
		
		for(DailySalesDto dto : list) {
			days.add(dto.getDay());
			totals.add(dto.getTotal());
		}
		
		Map<String, List<Object>> map = new HashMap<>();
		map.put("label", days);
		map.put("data", totals);
		return map;
	}
	
	@GetMapping("/monthlysales")
	public Map<String, List<Object>> monthlySales() {
		List<MonthlySalesDto> list = salesDao.selectMonthlyList();
		
		List<Object> months = new ArrayList<>();
		List<Object> totals = new ArrayList<>();
		
		for(MonthlySalesDto dto : list) {
			months.add(dto.getMonth());
			totals.add(dto.getTotal());
		}
		
		Map<String, List<Object>> map = new HashMap<>();
		map.put("label", months);
		map.put("data", totals);
		return map;
	}
}
