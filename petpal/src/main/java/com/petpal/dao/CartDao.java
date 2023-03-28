package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.CartDto;

@Repository
public class CartDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<CartDto> mapper = new RowMapper<CartDto>() {
		
		@Override
		public CartDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			CartDto dto = new CartDto();
			
			dto.setCartNo(rs.getInt("cart_no"));
			dto.setProductNo(rs.getInt("product_no"));
			dto.setMemberId(rs.getString("member_id"));
			dto.setProductCount(rs.getInt("product_count"));		
			dto.setProductName(rs.getString("product_name"));
			dto.setProductDiscount(rs.getInt("product_discount"));
			dto.setProductPrice(rs.getInt("product_price"));
	
			return dto;
		}
		
		
	};
	
	// 장바구니 추가
	public int addCart(CartDto cart) throws Exception{
		String sql = "insert into cart(cart_no,member_id, product_no, product_count) values(cart_seq.nextval,?,?,?)";
		Object[] param = {cart.getMemberId(), cart.getProductNo(), cart.getProductCount()};
		
		return jdbcTemplate.update(sql,param);
	}
	
	// 장바구니 삭제
	public boolean deleteCart(int cartNo) {
		String sql = "delete from cart where cart_no = ?";
		Object[] param = {cartNo};
		
		return jdbcTemplate.update(sql,param) > 0;
	}
	
	// 장바구니 수량 수정 
	public boolean modifyCount(CartDto cart) {
		String sql = "update cart set product_count = ? where cart_no = ?";
		Object[] param = {cart.getProductCount(), cart.getCartNo()};
		return jdbcTemplate.update(sql,param) > 0;
	}
	
	// 장바구니 목록
	public List<CartDto> getCart(String memberId){
		String sql ="select a.cart_no, a.member_id, a.product_no, a.product_count,"+
		"b.product_name, b.product_price, b.product_discount from cart "+
		"a left outer join product b on a.product_no = b.product_no where "+
		"member_id = ?";
		Object[] param = {memberId};
		
		return jdbcTemplate.query(sql, mapper,param);
	}
	
	// 장바구니 확인
	public CartDto checkCart(CartDto cart) {
		String sql = "select * from cart where member_id = ? and product_no = ?";
		Object[] param = {cart.getMemberId(), cart.getProductNo()};
		
		List<CartDto> list = jdbcTemplate.query(sql,mapper,param);
		
		return list.isEmpty() ? null : list.get(0);
	}
	
	
	
	

}
