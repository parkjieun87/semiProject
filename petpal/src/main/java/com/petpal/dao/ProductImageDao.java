package com.petpal.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.petpal.dto.ProductImageDto;

@Repository
public class ProductImageDao {

	@Autowired private JdbcTemplate jdbcTemplate;
	
	public void insert(ProductImageDto dto) {
		String sql = "insert into product_image(product_no, attachment_no) values(?,?) ";
		Object[] param = {dto.getProductNo(), dto.getAttachmentNo()};
		jdbcTemplate.update(sql, param);
	}
}
