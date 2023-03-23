package com.petpal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.petpal.dao.MemberDao;

//회원 관련 비동기 처리위한 컨트롤러(형석 2023.03.23)

@CrossOrigin(origins = {"http://127.0.0.1:5500"})
@RestController
@RequestMapping("/rest/member")
public class MemberRestController {
	
	@Autowired
	private MemberDao memberDao;
	
	//사용이 가능하면(아이디가 DB에 없으면) Y
	//사용이 불가하면(아이디가 DB에 있으면) N 
	@GetMapping("/memberId/{memberId}")
	public String findId(@PathVariable String memberId) {
		return memberDao.selectOne(memberId) == null ? "Y":"N";
	}
	
	@GetMapping("/memberNick/{memberNick}")
	public String findNickname(@PathVariable String memberNick) {
		return memberDao.selectByNickname(memberNick) == null ? "Y":"N";
	}
}
