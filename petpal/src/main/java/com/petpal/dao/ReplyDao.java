package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.ProductDto;
import com.petpal.dto.ReplyDto;

@Repository
public class ReplyDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public RowMapper<ReplyDto> mapper = new RowMapper<ReplyDto>() {

		@Override
		public ReplyDto mapRow(ResultSet rs, int rowNum) throws SQLException {	
			ReplyDto dto = new ReplyDto();
			dto.setReplyId(rs.getInt("reply_id"));
			dto.setProductNo(rs.getInt("product_no"));
			dto.setMemberId(rs.getString("member_id"));
			dto.setContent(rs.getString("content"));
			dto.setRegDate(rs.getDate("regDate"));
			dto.setRating(rs.getDouble("rating"));
			dto.setProductName(rs.getString("product_name"));
			
			return dto;
		}
		
		
	};
	// 조인을 위한 mapper
	public RowMapper<ReplyDto> joinMapper = new RowMapper<ReplyDto>() {
		
		@Override
		public ReplyDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			ReplyDto dto = new ReplyDto();
			dto.setRegDate(rs.getDate("regDate"));
			dto.setContent(rs.getString("content"));
			dto.setRating(rs.getInt("rating"));
			dto.setProductName(rs.getString("product_name"));
			dto.setMemberId(rs.getString("member_id"));
			
			return dto;
		}
	};
	
	

	/* 리뷰 등록 */
	public void enrollReply(ReplyDto dto) {
		String sql = "insert into reply(reply_id, product_no, member_id, content, rating) values(reply_seq.nextval,?,?,?,?)";
		Object[] param = {dto.getProductNo(), dto.getMemberId(), dto.getContent(), dto.getRating() };
		
		
		jdbcTemplate.update(sql,param);
	}
	
	/* 리뷰 존재 확인 */
	public Integer checkReply(ReplyDto dto){
		String sql = "select reply_id from reply where member_id = ? and product_no = ?";
		Object[] param = {dto.getMemberId(), dto.getProductNo()};
		
			try {	
				return jdbcTemplate.queryForObject(sql,Integer.class,param);
			}catch(Exception e) {
				return 0;
			}
		
	
	}
	
	// 리뷰 목록
	public List<ReplyDto> replyList(int productNo){
		String sql ="select a.regDate,a.member_id,a.content,a.rating,b.product_name from reply a left outer join product b on a.product_no = b.product_no where a.product_no = ?";
		Object[] param = {productNo};
		
		return jdbcTemplate.query(sql,joinMapper,param);
		
	}
	
//	// 상품 당 리뷰 개수
//	public int replyCount(int productNo) {
//		String sql = "select count(*) from reply where product_no = ?";
//		Object[] param = {productNo};
//		
//		return jdbcTemplate.queryForObject(sql,int.class,mapper,param);
//	}
	
	

}
