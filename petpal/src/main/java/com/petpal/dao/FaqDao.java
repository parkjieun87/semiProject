package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.BoardDto;
import com.petpal.dto.FaqDto;
import com.petpal.vo.PaginationVO;

@Repository
public class FaqDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<FaqDto> mapper = new RowMapper<FaqDto>() {

		@Override
		public FaqDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			FaqDto dto = new FaqDto();
			
			dto.setFaqNo(rs.getInt("faq_no"));
			dto.setFaqTitle(rs.getString("faq_title"));
			dto.setFaqAnswer(rs.getString("faq_answer"));
			dto.setFaqCategory(rs.getInt("faq_category"));
			dto.setFaqCategoryName(rs.getString("faq_category_name"));
			
			return dto;
		}
	};
	
	// 전체 목록
	public List<FaqDto> selectList(){
		String sql = "select * from faq";
		
		return jdbcTemplate.query(sql,mapper);
	}
	
	// FAQ 리스트
	public List<FaqDto> selectList(PaginationVO vo){
		
		if(vo.isSearch()) {
			String sql = "select * from("
					+ "select rownum rn, TMP.* from("
					+ "select * from faq where instr(#1,?) > 0"
					+ ")TMP"
					+ ")where rn between ? and ?";
			sql = sql.replace("#1","faq_title");
			Object[] param = {vo.getKeyword(), vo.getBegin(), vo.getEnd()};
			return jdbcTemplate.query(sql,mapper,param);
		}else {
			String sql = "select * from("
					+ "select rownum rn, TMP.* from("
					+ "select * from faq"
					+" )TMP"
					+ ")where rn between ? and ?";
			
			Object[] param = {vo.getBegin(), vo.getEnd()};
					
			return jdbcTemplate.query(sql,mapper,param);
		}	
		
	}
	
		// 전체 게시물 개수 
		public int totalPageCnt() {
			String sql = "select count(*) from faq";
			
			return jdbcTemplate.queryForObject(sql,int.class);
		}
	
	
	
	// 카테고리 별 목록
	public List<FaqDto> selectList(int faqCategory){
		String sql = "select * from faq where faq_category = ?";
		Object[] param = {faqCategory};
		
		return jdbcTemplate.query(sql, mapper,param);
	}

}
