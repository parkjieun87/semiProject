package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.AttachmentDto;

@Repository
public class AttachmentDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<AttachmentDto> mapper = new RowMapper<AttachmentDto>() {

		@Override
		public AttachmentDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			AttachmentDto dto = new AttachmentDto();
			
			dto.setAttachmentNo(rs.getInt("attachment_no"));
			dto.setAttachmentName(rs.getString("attachment_name"));
			dto.setAttachmentType(rs.getString("attachment_type"));
			dto.setAttachmentSize(rs.getLong("attachment_size"));
			
			return dto;
		}
	};
	
	public void insert(AttachmentDto dto) {
		String sql = "insert into attachment values(?,?,?,?)";
		Object[] param = {dto.getAttachmentNo(), dto.getAttachmentName(), dto.getAttachmentType(), dto.getAttachmentSize()};
		jdbcTemplate.update(sql,param);
	}
	
	public AttachmentDto selectOne(int attachmentNo) {
		String sql = "select * from board_attachment where attachment_no = ?";
		Object[] param = {attachmentNo};
		List<AttachmentDto> list = jdbcTemplate.query(sql,mapper,param);
		
		return list.isEmpty() ? null : list.get(0);
		
	}
	
	public int sequence() {
		String sql = "select board_attachment_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

}
