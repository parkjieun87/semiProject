package com.petpal.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.BoardDto;
import com.petpal.vo.PaginationVO;

@Repository
public class BoardDao {
	
	@Autowired
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
	
	// 공지사항 등록
	public void insert(BoardDto dto) {
		String sql = "insert into notice_board values(notice_board_seq.nextval,?,?,sysdate)";
		Object[] param = {dto.getBoardTitle(),dto.getBoardContent()};
		
		jdbcTemplate.update(sql,param);
	}
	
	// 공지사항 리스트
	public List<BoardDto> selectList(PaginationVO vo){
		
		if(vo.isSearch()) {
			String sql = "select * from("
					+ "select rownum rn, TMP.* from("
					+ "select * from notice_board where instr(#1,?) > 0"
					+ ")TMP"
					+ ")where rn between ? and ?";
			sql = sql.replace("#1",vo.getColumn());
			Object[] param = {vo.getKeyword(), vo.getBegin(), vo.getEnd()};
			return jdbcTemplate.query(sql,mapper,param);
		}else {
			String sql = "select * from("
					+ "select rownum rn, TMP.* from("
					+ "select * from notice_board order by board_no desc"
					+" )TMP"
					+ ")where rn between ? and ?";
			
			Object[] param = {vo.getBegin(), vo.getEnd()};
					
			return jdbcTemplate.query(sql,mapper,param);
		}	
		
	}
	
	// 공지사항 상세 조회
	public BoardDto selectOne(int boardNo) {
		String sql = "select * from notice_board where board_no = ?";
		Object[] param = {boardNo};
		
		List<BoardDto> list = jdbcTemplate.query(sql,mapper,param);
		
		return list.isEmpty() ? null : list.get(0);
	}
	
	// 전체 게시물 개수 
	public int totalPageCnt() {
		String sql = "select count(*) from notice_board";
		
		return jdbcTemplate.queryForObject(sql,int.class);
	}
	
	

}
