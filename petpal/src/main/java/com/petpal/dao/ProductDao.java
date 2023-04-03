package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.swing.tree.TreePath;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.AdminOrderDto;
import com.petpal.dto.CategoryCountDto;
import com.petpal.dto.CategoryDto;
import com.petpal.dto.ProductDto;
import com.petpal.dto.ProductOrderDto;
import com.petpal.dto.ProductWithImageDto;
import com.petpal.vo.PaginationVO;

@Repository
public class ProductDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 상품 등록
	public void insert(ProductDto productDto) {
		String sql = "insert into product("
				+ "product_no, category_code, product_name, product_price, product_stock, "
				+ "product_desc, product_regdate, product_discount, product_views) "
				+ "values(?, ?, ?, ?, ?, ?, sysdate, ?, 0)";
		Object[] param = {productDto.getProductNo() ,productDto.getCategoryCode(), productDto.getProductName(), productDto.getProductPrice(),
									productDto.getProductStock(), productDto.getProductDesc(), productDto.getProductDiscount()};
		jdbcTemplate.update(sql, param);
	}
	
	// 조회를 위한 RowMapper 구현
	private RowMapper<ProductDto> productMapper = new RowMapper<ProductDto>() {
		@Override
		public ProductDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			ProductDto productDto = new ProductDto();
			productDto.setProductNo(rs.getInt("product_no"));
			productDto.setCategoryCode(rs.getString("category_code"));
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
	
	// 카테고리 테이블 조회를 위한 mapper
	private RowMapper<CategoryDto> categoryMapper = new RowMapper<CategoryDto>() {

		@Override
		public CategoryDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			CategoryDto dto = new CategoryDto();
			dto.setTier(rs.getInt("tier"));
			dto.setCategoryCode(rs.getString("category_code"));
			dto.setCategoryName(rs.getString("category_name"));
			dto.setCategoryParent(rs.getString("category_parent"));
			
			return dto;
		}
		
	};
	
	private RowMapper<CategoryCountDto> countMapper = new RowMapper<CategoryCountDto>() {

		@Override
		public CategoryCountDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			CategoryCountDto dto = new CategoryCountDto();
			dto.setCategoryName(rs.getString("category_name"));
			dto.setCategoryCode(rs.getString("category_code"));
			dto.setCategoryCount(rs.getInt("category_count"));
			return dto;
		}
		
	};
	
	//상품 번호 생성
	public int sequence() {
		String sql = "select product_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	// 상품 리스트
	public List<ProductDto> selectList(PaginationVO vo){
		String sql = "select * from("
				+ "select rownum rn, TMP.* from("
				+ "select * from product order by product_regdate desc"
				+" )TMP"
				+ ")where rn between ? and ?";
		
		Object[] param = {vo.getBegin(), vo.getEnd()};
				
		return jdbcTemplate.query(sql,productMapper,param);
	}
	
	// 관리자 상품 리스트
		public List<ProductDto> selectList2(PaginationVO vo, String sort){
			String sql = "select * from("
					+ "select rownum rn, TMP.* from("
					+ "select * from product order by product_regdate desc"
					+" )TMP"
					+ ")where rn between ? and ? "
					+ "order by "+sort;
			
			Object[] param = {vo.getBegin(), vo.getEnd()};
					
			return jdbcTemplate.query(sql,productMapper,param);
		}
	
	
	//상품 조회 by categoryCode
	
	public List<ProductDto> selectList(String categoryCode){
		String sql = "select * from product where category_code=?";
		Object[] param = {categoryCode};
		return jdbcTemplate.query(sql, productMapper, param);
	}
	
	public ProductDto selectOne(int productNo) {
		String sql = "select * from product where product_no=?";
		Object[] param = {productNo};
		List<ProductDto> list = jdbcTemplate.query(sql, productMapper, param);
		return list.isEmpty() ? null:list.get(0); 
	}
	
	// 상품 정보 수정
	public boolean changeProductInfo(ProductDto productDto) {
		String sql = "update product set "
				+ "category_code=?, product_name=?, product_price=?, "
				+ "product_stock=?, product_desc=?, product_discount=? "
				+ "where product_no=?";
		Object[] param = {
				productDto.getCategoryCode(), productDto.getProductName(),
				productDto.getProductPrice(), productDto.getProductStock(),
				productDto.getProductDesc(), productDto.getProductDiscount(), 
				productDto.getProductNo()
				};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	// 상품 삭제
	public boolean delete(int productNo) {
		String sql = "delete product where product_no=?";
		Object[] param = {productNo};
		return jdbcTemplate.update(sql, param)>0;
	}
	
	// 전체 상품 개수
	public int totalProductCnt() {
		String sql = "select count(*) from product";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	// 카테고리 리스트
	public List<CategoryDto> categoryList(){
		String sql = "select * from product_cate order by category_code";
		
		return jdbcTemplate.query(sql, categoryMapper);
	}
	
	// 카테고리코드 -> 부모 카테고리 코드 추출
	public String ParentCate(String categoryCode) {
		String sql = "select category_parent from product_cate where category_code = ?";
		Object[] param = {categoryCode};
		return jdbcTemplate.queryForObject(sql, String.class,param);
	}
	
	//카테고리 카운트 
	public List<CategoryCountDto> categoryCountList(String parentCode){
		String sql = "select category_name, category_code, count(*) as category_count "
				+ "from category_with_parent "
				+ "where category_parent=? "
				+ "group by category_code, category_name";
		
		Object[] param = {parentCode};
		return jdbcTemplate.query(sql, countMapper, param);
	}
	
	public String parentName(String parentCode) {
		String sql = "select category_name from product_cate where category_code=?";
		Object[] param = {parentCode};
		return jdbcTemplate.queryForObject(sql, String.class, param);
	}
	
	/* 상품 아이디 */
	public ProductDto getProduct(int productNo) {
		String sql = "select * from product where product_no = ?";
		Object[] param = {productNo};
		
		List<ProductDto> list = jdbcTemplate.query(sql,productMapper,param);
		
		return list.isEmpty() ? null : list.get(0);
	}
	

	//주문완료 후 상품수량 수정(2023-04-03 박지은)
	public boolean update(int productStock,int productNo) {
		String sql = "update product set product_stock = ? where product_no=?";
		Object[] param = {productStock,productNo};
		return jdbcTemplate.update(sql,param)>0;
	}
	

	 // 검색 + 정렬 기능
	   public List<ProductDto> searchAndSelectList(String column, String keyword, PaginationVO vo, String sort) {
		    String sql = "select * from ("
		               + "select rownum rn, TMP.* from ("
		               + "select * from product "
		               + "where instr(#1, ?) > 0 "
		               + "order by #1"
		               + ") TMP"
		               + ") where rn between ? and ?";
		    sql = sql.replace("#1", column);

		    Object[] param = {keyword, vo.getBegin(), vo.getEnd()};

		    if (sort != null && !sort.isEmpty()) {
		        sql += " order by " + sort;
		    }

		    return jdbcTemplate.query(sql, productMapper, param);
		}
	   
	  
	


}
