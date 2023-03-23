package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.BoardImageDto;

@Repository
public class BoardImageDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<BoardImageDto> mapper = new RowMapper<BoardImageDto>() {

		@Override
		public BoardImageDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			BoardImageDto dto = new BoardImageDto();
			
			dto.setBoardNo(rs.getInt("board_no"));
			dto.setAttachmentNo(rs.getInt("attachment_no"));
			
			return dto;
		}
	};
	
	public void insert(BoardImageDto dto) {
		String sql = "insert into notice_board_image values(?,?)";
		Object[] param = {dto.getBoardNo(), dto.getAttachmentNo()};
		jdbcTemplate.update(sql,param);
	}
	
	public List<BoardImageDto> selectList(){
		String sql = "select * from notice_board_image";
		return jdbcTemplate.query(sql, mapper);
	}

}
