package com.petpal.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.petpal.dto.MemberDto;

@Repository
public class MemberDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void insert(MemberDto memberDto) {
		String sql = "insert into member("
				+ "member_id, member_pw, member_name"
				+ "member_email, member_tel, member_nick"
				+ "adminck, member_regdate, member_post"
				+ "member_basic_addr, member_detail_addr"
				+ ")value("
				+ "?, ?, ?, ?, ?, ?, 0, sysdate, ?, ?, ?"
				+ ")";
		Object[] param = {
				memberDto.getMemberId(), memberDto.getMemberPw(),
				memberDto.getMemberName(), memberDto.getMemberEmail(),
				memberDto.getMemberTel(), memberDto.getMemberNick(),
				memberDto.getAdminck(), memberDto.getMemberRegdate(),
				memberDto.getMemberPost(), memberDto.getMemberBasicAddr(),
				memberDto.getMemberDetailAddr()
		};
		jdbcTemplate.update(sql, param);			
		}
		
		
	}
	

