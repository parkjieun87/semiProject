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

import com.petpal.dto.MemberDto;
import com.petpal.dto.ProductOrderDto;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Repository
public class OrderDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//시퀀스 생성
	public int sequence() {
		String sql = "select product_order_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	//mapper 생성
	private RowMapper<ProductOrderDto> mapper = new RowMapper<ProductOrderDto>() {
	@Override
	public ProductOrderDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProductOrderDto productOrderDto = new ProductOrderDto();
		productOrderDto.setOrderNo(rs.getInt("order_no"));
		productOrderDto.setMemberId(rs.getString("member_id"));
		productOrderDto.setOrderDate(rs.getDate("order_date"));
		productOrderDto.setReceiverName(rs.getString("receiver_name"));
		productOrderDto.setReceiverTel(rs.getString("receiver_tel"));
		productOrderDto.setReceiverBasicAddr(rs.getString("receiver_basic_addr"));
		productOrderDto.setReceiverPost(rs.getString("receiver_post"));
		productOrderDto.setReceiverDetailAddr(rs.getString("receiver_detail_addr"));
		productOrderDto.setOrderDetailNo(rs.getInt("order_detail_no"));
		productOrderDto.setProductNo(rs.getInt("product_no"));
		productOrderDto.setCategoryCode(rs.getString("category_code"));
		productOrderDto.setProductCount(rs.getInt("product_count"));
		productOrderDto.setProductPrice(rs.getInt("product_price"));
		return productOrderDto;
	}};
	
	
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
			        System.out.println(obj.toString());
			      } catch (CoolsmsException e) {
			        System.out.println(e.getMessage());
			        System.out.println(e.getCode());
			      }
		}
	
			
	//주문 정보 등록
	public void insert(ProductOrderDto productOrderDto) {
		String sql="insert into product_order(order_no,member_id,order_date,receiver_name,receiver_tel,receiver_basic_addr,receiver_post,receiver_detail_addr)\r\n"
				+ "values(product_order_seq.nextval,?,sysdate,?,?,?,?,?)";
		Object param[] = {productOrderDto.getMemberId(),productOrderDto.getReceiverName(),productOrderDto.getReceiverTel(),productOrderDto.getReceiverBasicAddr(),
							productOrderDto.getReceiverPost(),productOrderDto.getReceiverDetailAddr()};
			jdbcTemplate.update(sql,param);
	}
	
	//아이디로 주문자 이름,이메일 조회 - memberDao에 작성


	
}
