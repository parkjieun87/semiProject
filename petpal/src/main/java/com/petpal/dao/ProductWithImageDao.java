package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.ProductWithImageDto;

@Repository
public class ProductWithImageDao {
	@Autowired private JdbcTemplate jdbcTemplate;
	
	RowMapper<ProductWithImageDto> mapper = new RowMapper<ProductWithImageDto>() {

		@Override
		public ProductWithImageDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			return ProductWithImageDto.builder()
						.productNo(rs.getInt("product_no"))
						.productName(rs.getString("product_name"))
						.categoryCode(rs.getString("category_code"))
						.productPrice(rs.getInt("product_price"))
						.productStock(rs.getInt("product_stock"))
						.productDesc(rs.getString("product_desc"))
						.productRegdate(rs.getDate("product_regdate"))
						.productDiscount(rs.getInt("product_discount"))
						.productViews(rs.getInt("product_views"))
						.attachmentNo(rs.getInt("attachment_no"))
						.build();
		}
		
	};
	
	public List<ProductWithImageDto> selectList(String categoryCode){
		String sql = "select * from product_with_image where category_code=?";
		Object[] param = {categoryCode};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	public ProductWithImageDto selectOne(int productNo){
		String sql = "select * from product_with_image where product_no=?";
		Object[] param = {productNo};
		return jdbcTemplate.query(sql, mapper, param).get(0);
	}
}
