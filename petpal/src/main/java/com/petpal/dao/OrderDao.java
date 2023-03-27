package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.ProductOrderDto;

@Repository
public class OrderDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//시퀀스 생성
	public int sequence() {
		String sql = "select product_order_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	//mapper 생성
	private RowMapper<ProductOrderDto> mapper = new RowMapper<ProductOrderDto>() {
	@Override
	public ProductOrderDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProductOrderDto productOrderDto = new ProductOrderDto();
		productOrderDto.setOrderNo(rs.getInt("order_no"));
		productOrderDto.setMemberId(rs.getString("member_id"));
		productOrderDto.setOrderDate(rs.getDate("order_date"));
		productOrderDto.setReceiverName(rs.getString("receiver_name"));
		productOrderDto.setReceiverTel(rs.getString("receiver_tel"));
		productOrderDto.setReceiverBasicAddr(rs.getString("receiver_basic_addr"));
		productOrderDto.setReceiverPost(rs.getString("receiver_post"));
		productOrderDto.setReceiverDetailAddr(rs.getString("receiver_detail_addr"));
		return productOrderDto;
	}};
	
	//1.주문 정보 등록
	public void insert(ProductOrderDto productOrderDto) {
		String sql="insert into product_order(order_no,member_id,order_date,receiver_name,receiver_tel,receiver_basic_addr,receiver_post,receiver_detail_addr)\r\n"
				+ "values(product_order_seq.nextval,?,sysdate,?,?,?,?,?);";
		Object param[] = {productOrderDto.getMemberId(),productOrderDto.getReceiverName(),productOrderDto.getReceiverTel(),productOrderDto.getReceiverBasicAddr(),
							productOrderDto.getReceiverPost(),productOrderDto.getReceiverDetailAddr()};
			jdbcTemplate.update(sql,param);
	}
	
	//
}
