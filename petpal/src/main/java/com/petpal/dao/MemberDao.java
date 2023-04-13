package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.AdminOrderDto;
import com.petpal.dto.CartDto;
import com.petpal.dto.MemberDto;
import com.petpal.dto.OrderDetailDto;
import com.petpal.dto.OrderListDto;
import com.petpal.dto.ProductOrderDto;
import com.petpal.vo.PaginationVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Repository
public class MemberDao {

   //형석
	
//	//product_order mapper 생성
//	private RowMapper<ProductOrderDto> mapper2 = new RowMapper<ProductOrderDto>() {
//	@Override
//	public ProductOrderDto mapRow(ResultSet rs, int rowNum) throws SQLException {
//		ProductOrderDto productOrderDto = new ProductOrderDto();
//		productOrderDto.setOrderNo(rs.getInt("order_no"));
//		productOrderDto.setMemberId(rs.getString("member_id"));
//		productOrderDto.setOrderDate(rs.getDate("order_date"));
//		productOrderDto.setReceiverName(rs.getString("receiver_name"));
//		productOrderDto.setReceiverTel(rs.getString("receiver_tel"));
//		productOrderDto.setReceiverBasicAddr(rs.getString("receiver_basic_addr"));
//		productOrderDto.setReceiverPost(rs.getString("receiver_post"));
//		productOrderDto.setReceiverDetailAddr(rs.getString("receiver_detail_addr"));
//		productOrderDto.setTotalPrice(rs.getInt("total_price"));
//		return productOrderDto;
//	}};
	
	 //형석(2023.04.03
	
		//OrderListDto mapper 생성
	
		private RowMapper<OrderListDto> mapper3 = new RowMapper<OrderListDto>() {
		@Override
		public OrderListDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			OrderListDto orderListDto = new OrderListDto();
			orderListDto.setOrderNo(rs.getInt("order_no"));
			orderListDto.setMemberId(rs.getString("member_id"));
			orderListDto.setProductCount(rs.getInt("product_count"));
			orderListDto.setProductName(rs.getString("product_name"));
			orderListDto.setProductPrice(rs.getInt("product_price"));
		
			return orderListDto;
		}};
		
		//order_detail mapper 생성
		// 재영 (04/03)
		private RowMapper<OrderDetailDto> mapperFinish = new RowMapper<OrderDetailDto>() {
			
			@Override
			public OrderDetailDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				OrderDetailDto orderDetailDto = new OrderDetailDto();
				orderDetailDto.setOrderNo(rs.getInt("order_no"));
				orderDetailDto.setProductNo(rs.getInt("product_no"));
				orderDetailDto.setMemberId(rs.getString("member_id"));
				orderDetailDto.setProductPrice(rs.getInt("product_price"));
				orderDetailDto.setProductCount(rs.getInt("product_count"));
				orderDetailDto.setProductName(rs.getString("product_name"));
				orderDetailDto.setAttachmentNo(rs.getInt("attachment_no"));
				return orderDetailDto;
			}
		};

		
		
		
	
      @Autowired
      private JdbcTemplate jdbcTemplate;
      
      public void insert(MemberDto memberDto) {
         String sql = "insert into member("
               + "member_id, member_pw, member_name, "
               + "member_email, member_tel, member_nick, "
               + "adminck, member_regdate, member_post, "
               + "member_basic_addr, member_detail_addr"
               + ")values("
               + "?, ?, ?, ?, ?, ?, 0, sysdate, ?, ?, ?"
               + ")";
         Object[] param = {
               memberDto.getMemberId(), memberDto.getMemberPw(),
               memberDto.getMemberName(), memberDto.getMemberEmail(),
               memberDto.getMemberTel(), memberDto.getMemberNick(),
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
      
   // 비밀번호 제외한 나머지 정보 변경 기능 구현(형석)
      public boolean changeInformation(MemberDto memberDto) {
         String sql = "update member set member_nick=?, member_email=?, "
               + "member_tel=?, member_post=?, member_basic_addr=?,"
               + " member_detail_addr=? where member_id=?\r\n"
               + "";
         
         Object[] param = {
            memberDto.getMemberNick(), memberDto.getMemberEmail(), memberDto.getMemberTel(),
            memberDto.getMemberPost(), memberDto.getMemberBasicAddr(), memberDto.getMemberDetailAddr(),
            memberDto.getMemberId()
         };
         return jdbcTemplate.update(sql, param) > 0;//update() 메소드의 반환값이 0보다 크면 true를 반환하고, 그렇지 않으면 false를 반환.
         //이는 데이터베이스에서 비밀번호 변경 작업이 성공했는지의 여부를 나타낸다.   
      }
            
      //회원 탈퇴 기능 (형석)
      public boolean delete(String memberId) {
         String sql = "delete member where member_id = ?";
         Object[] param = {memberId};
         return jdbcTemplate.update(sql, param) > 0 ;
      }
      
      //아이디 찾기 기능(닉네임, 전화번호로) (형석) (2023.03.22)
      public String findId(MemberDto memberDto) {
         String sql = "select member_id from member "
               + "where member_nick=? and member_tel=?";
         Object[] param = {
               memberDto.getMemberNick(), memberDto.getMemberTel()      
         };
         //String.Class는 "String 자료형" 이라는 뜻.
         return jdbcTemplate.queryForObject(sql, String.class, param);
      }
      
      // 관리자용 회원정보 변경(성현)
      public boolean changeInformationByAdmin (MemberDto memberDto) {
         String sql = "update member set "
               + "member_name=?, adminCk=?, member_nick=?, "
               + "member_email=?, member_tel=?, member_post=?, "
               + "member_basic_addr=?, member_detail_addr=? where member_id=?";
         Object[] param = {
        		 memberDto.getMemberName(), memberDto.getAdminCk(), memberDto.getMemberNick(), 
        		 memberDto.getMemberEmail(), memberDto.getMemberTel(), memberDto.getMemberPost(),
        		 memberDto.getMemberBasicAddr(), memberDto.getMemberDetailAddr(), memberDto.getMemberId()
               
         };
         return jdbcTemplate.update(sql, param) > 0;         
      }
      
      // 번호 인증 기능
      public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
         String api_key = "NCSLCNN6RKJJ6KZD";
          String api_secret = "9B1P2CLHGLLD1XBKPUQJ32PV4SN9EXLD";
          Message coolsms = new Message(api_key, api_secret);

          // 4 params(to, from, type, text) are mandatory. must be filled
          HashMap<String, String> params = new HashMap<String, String>();
          params.put("to", userPhoneNumber);    // 수신전화번호
          params.put("from", "01056967976");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
          params.put("type", "SMS");
          params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
          params.put("app_version", "test app 1.2"); // application name and version
          
          
          try {
              JSONObject obj = (JSONObject) coolsms.send(params);
              //System.out.println(obj.toString());
            } catch (CoolsmsException e) {
              //System.out.println(e.getMessage());
              //System.out.println(e.getCode());
            }
   }
      
      // MemberRestController 닉네임 중복검사를 위해 만든 DAO (형석2023.03.23) 
      public MemberDto selectByNickname(String memberNick) {
         String sql = "select * from member where member_nick = ?";
         Object[] param = {memberNick};
         List<MemberDto> list = jdbcTemplate.query(sql, mapper, param);
         return list.isEmpty() ? null : list.get(0);
      }
      
      //    회원 탈퇴시 웨이팅 테이블로의 이동 (2023.03.28 수정 형석)
      public void insertWaiting(MemberDto memberDto) {
            String sql = "insert into waiting("
            		+ "member_id, member_pw, member_name, "
                    + "member_email, member_tel, member_nick, "
                    + "adminck, member_regdate, member_post, "
                    + "member_basic_addr, member_detail_addr"
                    + ")values("
                    + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?"
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
      
      // 카운트 구하는 기능 (2023.03.28 성현)
      public int selectCount() {
               String sql = "select count(*) from member";
               return jdbcTemplate.queryForObject(sql, int.class);
            }   
      
      //회원 리스트 (2023.03.28 성현)
      public List<MemberDto> selectList(PaginationVO vo, String sort){
         String sql = "select * from("
               + "select rownum rn, TMP.* from("
               + "select * from member order by "+sort
               +" )TMP"
               + ")where rn between ? and ?";
         
         Object[] param = {vo.getBegin(), vo.getEnd()};
         
         return jdbcTemplate.query(sql,mapper,param);
      }   
      
   // 검색 + 정렬 기능
	   public List<MemberDto> searchAndSelectList(String column, String keyword, PaginationVO vo, String sort) {
		    String sql = "select * from ("
		               + "select rownum rn, TMP.* from ("
		               + "select * from member "
		               + "where instr(#1, ?) > 0 "
		               + "order by #1, "+sort
		               + ") TMP"
		               + ") where rn between ? and ?";
		    sql = sql.replace("#1", column);

		    Object[] param = {keyword, vo.getBegin(), vo.getEnd()};

		    return jdbcTemplate.query(sql, mapper, param);
		}
      
    	
      //주문 목록(2023.04.03 형석) - 재영 수정
  	public List<OrderDetailDto> orderList(String memberId) {
  		String sql = "select a.order_no,a.product_no,a.member_id,a.product_price, a.product_count,b.product_name, c.attachment_no from order_detail a left outer join product b on a.product_no = b.product_no left outer join product_image c on b.product_no = c.product_no where member_id= ?";  		
  				Object[] param = {memberId};
  		return jdbcTemplate.query(sql,mapperFinish, param);
  	}
  	
  	

}
      
   