package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.FaqDto;

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
	
	// 카테고리 별 목록
	public List<FaqDto> selectList(int faqCategory){
		String sql = "select * from faq where faq_category = ?";
		Object[] param = {faqCategory};
		
		return jdbcTemplate.query(sql, mapper,param);
	}

}
