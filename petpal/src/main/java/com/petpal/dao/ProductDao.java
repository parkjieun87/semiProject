package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.ProductDto;

@Repository
public class ProductDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 상품 등록
	public void insert(ProductDto productDto) {
		String sql = "insert into product("
				+ "product_no, category_code, product_name, product_price, product_stock, "
				+ "product_desc, product_regdate, product_discount, product_views) "
				+ "values(product_seq.nextval, ?, ?, ?, ?, ?, sysdate, ?, 0)";
		Object[] param = {productDto.getCategoryCode(), productDto.getProductName(), productDto.getProductPrice(),
									productDto.getProductStock(), productDto.getProductDesc(), productDto.getProductDiscount()};
		jdbcTemplate.update(sql, param);
	}
	
	// 조회를 위한 RowMapper 구현
	private RowMapper<ProductDto> mapper = new RowMapper<ProductDto>() {
		@Override
		public ProductDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			ProductDto productDto = new ProductDto();
			productDto.setProductNo(rs.getInt("product_no"));
			productDto.setCategoryCode(rs.getString("category_no"));
			productDto.setProductName(rs.getString("product_name"));
			productDto.setProductPrice(rs.getInt("product_price"));
			productDto.setProductStock(rs.getInt("product_stock"));
			productDto.setProductDesc(rs.getString("product_desc"));
			productDto.setProductRegdate(rs.getDate("product_regdate"));
			productDto.setProductDiscount(rs.getInt("product_discount"));
			productDto.setProductViews(rs.getInt("product_views"));
			return productDto;
		}
	};
	
	// 상품 조회
	public List<ProductDto> selectList(){
		String sql = "select * from product order by product_regdate desc"; 
		return jdbcTemplate.query(sql, mapper);
	}
	
	public ProductDto selectOne(int productNo) {
		String sql = "select * from product where product_no=?";
		Object[] param = {productNo};
		List<ProductDto> list = jdbcTemplate.query(sql, mapper, param);
		return list.isEmpty() ? null:list.get(0); 
	}
	
	// 상품 정보 수정
	public boolean changeProductInfo(ProductDto productDto) {
		String sql = "update product set "
				+ "product_price=?, product_stock=?, product_desc=?, product_discount=? "
				+ "where product_no=?";
		Object[] param = {
				productDto.getProductPrice(), productDto.getProductStock(),
				productDto.getProductDesc(), productDto.getProductDiscount()
				};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	// 상품 삭제
	public boolean delete(int productNo) {
		String sql = "delete product where product_no=?";
		Object[] param = {productNo};
		return jdbcTemplate.update(sql, param)>0;
	}
}
