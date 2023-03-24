package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.AttachmentDto;

@Repository
public class ProductAttachmentDao {
	@Autowired private JdbcTemplate jdbcTemplate;
	
	RowMapper<AttachmentDto> mapper = new RowMapper<AttachmentDto>() {

		@Override
		public AttachmentDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			return AttachmentDto.builder()
									.attachmentNo(rs.getInt("attachment_no"))
									.attachmentName(rs.getString("attachment_name"))
									.attachmentType(rs.getString("attachment_type"))
									.attachmentSize(rs.getLong("attachment_size"))
									.build();
		}
		
	};
	
	public int sequence() {
		String sql = "select product_attachment_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	public void insert(AttachmentDto dto) {
		String sql = "insert into product_attachment(attachment_no, attachment_name, attachment_type, attachment_size)"
				+ " values(?,?,?,?)";
		Object[] param = {dto.getAttachmentNo(), dto.getAttachmentName(), dto.getAttachmentType(), dto.getAttachmentSize()};
		jdbcTemplate.update(sql, param);
	}
	
	
}
