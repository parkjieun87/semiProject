package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.MemberDto;

@Repository
public class MemberDao {

	//형석
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void insert(MemberDto memberDto) {
		String sql = "insert into member("
				+ "member_id, member_pw, member_name"
				+ "member_email, member_tel, member_nick"
				+ "adminck, member_regdate, member_post"
				+ "member_basic_addr, member_detail_addr"
				+ ")value("
				+ "?, ?, ?, ?, ?, ?, 0, sysdate, ?, ?, ?"
				+ ")";
		Object[] param = {
				memberDto.getMemberId(), memberDto.getMemberPw(),
				memberDto.getMemberName(), memberDto.getMemberEmail(),
				memberDto.getMemberTel(), memberDto.getMemberNick(),
				memberDto.getAdminCk(), memberDto.getMemberRegdate(),
				memberDto.getMemberPost(), memberDto.getMemberBasicAddr(),
				memberDto.getMemberDetailAddr()
		};
		jdbcTemplate.update(sql, param);			
		}
	//조회를 위한 RowMapper 구현 (형석)
		private RowMapper<MemberDto> mapper = new RowMapper<MemberDto>() {
			@Override
			public MemberDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				MemberDto memberDto = new MemberDto();
				memberDto.setMemberId(rs.getString("member_id"));
				memberDto.setMemberPw(rs.getString("member_pw"));
				memberDto.setMemberName(rs.getString("member_name"));
				memberDto.setMemberEmail(rs.getString("member_email"));
				memberDto.setMemberTel(rs.getString("member_tel"));
				memberDto.setMemberNick(rs.getString("member_nick"));
				memberDto.setAdminCk(rs.getInt("adminck"));
				memberDto.setMemberRegdate(rs.getDate("member_regdate"));
				memberDto.setMemberPost(rs.getString("member_post"));
				memberDto.setMemberBasicAddr(rs.getString("member_basic_addr"));
				memberDto.setMemberDetailAddr(rs.getString("member_detail_addr"));
				return memberDto;
			}
		};
	
	// 데이터 베이스에서 회원 정보를 조회하는 기능 구현 (형석)
		public MemberDto selectOne(String memberId) {
			String sql = "select * from member where member_id = ? ";
			Object[] param = {memberId};
			List<MemberDto> list = jdbcTemplate.query(sql, mapper, param);
			return list.isEmpty() ? null : list.get(0);
		}
	
	// 비밀번호 변경 기능 (형석)
		public boolean changePassword(String memberId, String memberPw) {
			String sql = "update member set member_pw = ? where member_id = ?";
			Object[] param = {memberPw, memberId};
			return jdbcTemplate.update(sql, param) > 0 ; //update() 메소드의 반환값이 0보다 크면 true를 반환하고, 그렇지 않으면 false를 반환.
			//이는 데이터베이스에서 비밀번호 변경 작업이 성공했는지의 여부를 나타낸다.
		}
		
		// 관리자용 회원정보 변경
		public boolean changeInformationByAdmin (MemberDto memberDto) {
			String sql = "update member set "
					+ "member_email=?, member_tel=?, member_nick=?, "
					+ "member_post=?, member_basic_addr=?, member_detail_addr=? "
					+ "where member_id=?";
			Object[] param = {
					memberDto.getMemberEmail(), memberDto.getMemberTel(), memberDto.getMemberNick(),
					memberDto.getMemberPost(), memberDto.getMemberBasicAddr(), memberDto.getMemberDetailAddr()
			};
			return jdbcTemplate.update(sql, param) > 0;
			
		}
		
		
	}
	