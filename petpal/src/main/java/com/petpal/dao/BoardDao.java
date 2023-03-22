package com.petpal.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.BoardDto;

@Repository
public class BoardDao {
	
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<BoardDto> mapper = new RowMapper<BoardDto>() {
		
		@Override
		public BoardDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			BoardDto dto = new BoardDto();
			
			dto.setBoardNo(rs.getInt("board_no"));
			dto.setBoardTitle(rs.getString("board_title"));
			dto.setBoardContent(rs.getString("board_content"));
			dto.setBoardDate(rs.getDate("board_date"));
			
			
			return dto;
		}
	};
	
	// 공지사항 리스트
	public List<BoardDto> selectList(){
		String sql = "select * from notice_board order by board_no desc";
		return jdbcTemplate.query(sql,mapper);
	}
	
	

}
