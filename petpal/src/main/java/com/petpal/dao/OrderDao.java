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
import com.petpal.dto.OrderDetailDto;
import com.petpal.dto.ProductImageDto;
import com.petpal.dto.ProductOrderDto;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Repository
public class OrderDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	//product_order mapper 생성
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
		productOrderDto.setTotalPrice(rs.getInt("total_price"));
		return productOrderDto;
	}};
	
	//order_detail mapper 생성
	private RowMapper<OrderDetailDto> mapper1 = new RowMapper<OrderDetailDto>() {
		
		@Override
		public OrderDetailDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			OrderDetailDto orderDetailDto = new OrderDetailDto();
			orderDetailDto.setOrderDetailNo(rs.getInt("order_detail_no"));
			orderDetailDto.setOrderNo(rs.getInt("order_no"));
			orderDetailDto.setProductNo(rs.getInt("product_no"));
			orderDetailDto.setMemberId(rs.getString("member_id"));
//			orderDetailDto.setCategoryCode(rs.getString("category_code"));
			orderDetailDto.setProductCount(rs.getInt("product_count"));
			orderDetailDto.setProductPrice(rs.getInt("product_price"));
			orderDetailDto.setProductName(rs.getString("product_name"));
			orderDetailDto.setReplyCheck(rs.getInt("reply_check"));
			return orderDetailDto;
		}
	};
	

	
	//시퀀스 생성
	public int sequence() {
		String sql = "select product_order_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
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
			        System.out.println(obj.toString());
			      } catch (CoolsmsException e) {
			        System.out.println(e.getMessage());
			        System.out.println(e.getCode());
			      }
		}
	
			
	//주문 정보 등록(주문테이블)
	public void insert(ProductOrderDto productOrderDto) {//order_detail_seq.nextval 안쓴이유는 주문,주문상세에 같은 orderNo가 들어가야해서.
		String sql="insert into product_order(order_no,member_id,order_date,receiver_name,receiver_tel,receiver_basic_addr,receiver_post,receiver_detail_addr,total_price)\r\n"
				+ "values(?,?,sysdate,?,?,?,?,?,?)";
		Object param[] = {productOrderDto.getOrderNo(),productOrderDto.getMemberId(),productOrderDto.getReceiverName(),productOrderDto.getReceiverTel(),productOrderDto.getReceiverBasicAddr(),
							productOrderDto.getReceiverPost(),productOrderDto.getReceiverDetailAddr(),productOrderDto.getTotalPrice()};
			jdbcTemplate.update(sql,param);
	}
	
	//주문상세 조회
	public OrderDetailDto selectOne(int orderDtailNo) {
		String sql="select*from order_detail where order_detail_no=?";
		Object[]param = {orderDtailNo};
		List<OrderDetailDto>list = jdbcTemplate.query(sql, mapper1,param);
		return list.isEmpty() ? null: list.get(0);
	}
	
	//주문리스트
	public List<ProductOrderDto> list(){
		String sql = "select*from product_order";
		return jdbcTemplate.query(sql, mapper);
	}
	
	//주문정보 조회
	public ProductOrderDto select(int orderNo) {
		String sql="select*from product_order where order_no=?";
		Object[]param = {orderNo};
		List<ProductOrderDto>list = jdbcTemplate.query(sql, mapper,param);
		return list.isEmpty() ? null: list.get(0);
	}
	

	
	//주문 상세 등록(주문상세테이블)
	public void insert2(OrderDetailDto orderDetailDto) {
		String sql = "insert into order_detail(order_detail_no,order_no,product_no,member_id,product_count,product_price) "
				+ "values(order_detail_seq.nextval,?,?,?,?,?)";
		Object[]param = {orderDetailDto.getOrderNo(),orderDetailDto.getProductNo(),orderDetailDto.getMemberId(),
				orderDetailDto.getProductCount(),orderDetailDto.getProductPrice()};
		jdbcTemplate.update(sql,param);
	}
	
	// 상품 리뷰 작성 유무를 확인 - 재영
	public boolean replyCheck(int orderNo) {
		String sql = "update order_detail set reply_check = 1 where order_no = ?";
		Object[] param = {orderNo};
		
		return jdbcTemplate.update(sql,param) > 0;
	}
	

	
}
