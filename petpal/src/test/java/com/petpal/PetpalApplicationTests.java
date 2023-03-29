package com.petpal;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootTest
class PetpalApplicationTests {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Test
	void contextLoads() {
		String sql = "insert into product(product_no, category_code, product_name, product_price, product_stock, product_desc, product_regdate, product_discount, product_views) values(product_seq.nextval, 1000, 'test', 7777, 5, '더미', sysdate, 10, 5)";
		jdbcTemplate.update(sql);
	}

}
