package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.SalesDto;
import com.petpal.vo.PaginationVO;

@Repository
public class SalesDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	RowMapper<SalesDto> mapper = new RowMapper<SalesDto>() {

		@Override
		public SalesDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			SalesDto dto = new SalesDto();
			dto.setOrderDate(rs.getDate("order_date"));
			dto.setProductPrice(rs.getInt("product_price"));
			dto.setProductCount(rs.getInt("product_count"));
			return dto;
		}
	};
	
	// 기본 조회
	public List<SalesDto> selectList(){
		String sql = "select * from sales order by order_date desc";
		return jdbcTemplate.query(sql, mapper);
	}
	
	// 조건에 따른 정렬
	public List<SalesDto> selectList(PaginationVO vo){
		String sql = "select * from("
                + "select rownum rn, TMP.* from("
                + "select * from sales)TMP"
                + ")where rn between ? and ?";
        
        Object[] param = {vo.getBegin(), vo.getEnd()};
        
        return jdbcTemplate.query(sql, mapper, param);
	}
	
	// 판매 카운트
	public int selectCount() {
		String sql = "select count(*) from sales";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	
}
