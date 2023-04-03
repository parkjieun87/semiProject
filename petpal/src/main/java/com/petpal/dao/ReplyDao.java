package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

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
			
			return dto;
		}
	};
	
	
	/* 리뷰 등록 */
	public void enrollReply(ReplyDto dto) {
		String sql = "insert into reply(reply_id, product_no, member_id, content, rating) values(reply_seq.nextval,?,?,?,?)";
		Object[] param = {dto.getProductNo(), dto.getMemberId(), dto.getContent(), dto.getRating() };
		
		
		jdbcTemplate.update(sql,param);
	}

}
