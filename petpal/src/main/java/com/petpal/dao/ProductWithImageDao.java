package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.ProductWithImageDto;
import com.petpal.vo.PaginationVO;

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
	
	RowMapper<ProductWithImageDto> parentMapper = new RowMapper<ProductWithImageDto>() {

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
					.categoryParent(rs.getString("category_parent"))
					.build();
		}
		
	}; 
	
	//카테고리코드 -> 리스트
	public List<ProductWithImageDto> selectList(String categoryCode){
		String sql = "select * from product_with_image where category_code=?";
		Object[] param = {categoryCode};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	//카테고리코드 -> 리스트 페이지네이션
		public List<ProductWithImageDto> selectList(String categoryCode, PaginationVO vo){
			String sql = "select * from(select rownum rn, TMP.* from(select * from product_with_image where category_code=?)TMP)where rn between ? and ?";
			Object[] param = {categoryCode, vo.getBegin(), vo.getEnd()};
			return jdbcTemplate.query(sql, mapper, param);
		}
	
	//부모카테코드 -> 리스트
	public List<ProductWithImageDto> selectListFromParent(String parent){
		String sql = "select * from product_with_image_parent where category_parent=?";
		Object[] param = {parent};
		return jdbcTemplate.query(sql, parentMapper, param);
	}
	
	//부모카테코드 -> 리스트 페이지네이션
		public List<ProductWithImageDto> selectListFromParent(String parent, PaginationVO vo){
			String sql = "select * from(select rownum rn, TMP.* from(select * from product_with_image_parent where category_parent=?)TMP)where rn between ? and ?";
			Object[] param = {parent, vo.getBegin(), vo.getEnd()};
			return jdbcTemplate.query(sql, parentMapper, param);
		}
	
	public ProductWithImageDto selectOne(int productNo){
		String sql = "select * from product_with_image where product_no=?";
		Object[] param = {productNo};
		return jdbcTemplate.query(sql, mapper, param).get(0);
	}
	
	//상품 검색(검색) - 2023.04.02 박지은(수정필요)
	public List<ProductWithImageDto> selectList1(PaginationVO vo,String column,String keyword){
		String sql = "select * from("
				+ "select rownum rn, TMP.* from("
				+ "select * from product where instr(#1,?)>0 order by product_regdate desc"
				+" )TMP"
				+ ")where rn between ? and ?";
		sql=sql.replace("#1",column);
		Object[] param = {keyword,vo.getBegin(), vo.getEnd()};
				
		return jdbcTemplate.query(sql,mapper,param);
	}
}
