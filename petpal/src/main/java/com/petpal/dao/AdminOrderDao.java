package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.AdminOrderDto;
import com.petpal.vo.PaginationVO;

@Repository
public class AdminOrderDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	RowMapper<AdminOrderDto> orderMapper = new RowMapper<AdminOrderDto>() {

		@Override
		public AdminOrderDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			AdminOrderDto dto = new AdminOrderDto();
			dto.setReceiverName(rs.getString("receiver_name"));
			dto.setOrderDate(rs.getDate("order_date"));
			dto.setReceiverPost(rs.getString("receiver_post"));
			dto.setReceiverBasicAddr(rs.getString("receiver_basic_addr"));
			dto.setReceiverDetailAddr(rs.getString("receiver_detail_addr"));
			dto.setReceiverTel(rs.getString("receiver_tel"));
			dto.setProductName(rs.getString("product_name"));
			dto.setProductCount(rs.getInt("product_count"));
			dto.setProductPrice(rs.getInt("product_price"));
			dto.setTotal(rs.getLong("total"));
			dto.setOrderDetailNo(rs.getLong("order_detail_no"));
			return dto;
		}
		
	};
	
		// 주문 카운트
	   public int selectCount() {
	      String sql = "select count(*) from admin_order";
	      return jdbcTemplate.queryForObject(sql, int.class);
	   }
	   
	   // 조건에 따른 정렬 및 조회
	   public List<AdminOrderDto> selectList(PaginationVO vo, String sort){
	      String sql = "select * from("
	                + "select rownum rn, TMP.* from("
	                + "select * from admin_order)TMP"
	                + ")where rn between ? and ?"
	                + "order by "+sort;
	        
	        Object[] param = {vo.getBegin(), vo.getEnd()};
	        
	        return jdbcTemplate.query(sql, orderMapper, param);
	   }
	   
	   // 검색 기능
	   public List<AdminOrderDto> searchList(String column, String keyword){
			String sql = "select * from admin_order where instr(#1, ?) > 0 order by #1 asc";
			sql = sql.replace("#1", column);
			Object[] param = {keyword};
			return jdbcTemplate.query(sql, orderMapper, param);
	   }
	   
	   // 검색 + 정렬 기능
	   public List<AdminOrderDto> searchAndSelectList(String column, String keyword, PaginationVO vo, String sort) {
		    String sql = "select * from ("
		               + "select rownum rn, TMP.* from ("
		               + "select * from admin_order "
		               + "where instr(#1, ?) > 0 "
		               + "order by #1"
		               + ") TMP"
		               + ") where rn between ? and ?";
		    sql = sql.replace("#1", column);

		    Object[] param = {keyword, vo.getBegin(), vo.getEnd()};

		    if (sort != null && !sort.isEmpty()) {
		        sql += " order by " + sort;
		    }

		    return jdbcTemplate.query(sql, orderMapper, param);
		}
	   
	   // 주문관리 삭제
	      public boolean delete(int detailNo) {
	    	  String sql = "delete admin_order where order_detail_no = ?";
	    	  Object[] param = {detailNo};
	    	  return jdbcTemplate.update(sql, param) > 0;
	      }
	   
	   
	   

}
