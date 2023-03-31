package com.petpal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.petpal.dto.DailySalesDto;
import com.petpal.dto.MonthlySalesDto;
import com.petpal.dto.SalesDto;
import com.petpal.vo.PaginationVO;

@Repository
public class SalesDao {
   
   @Autowired
   JdbcTemplate jdbcTemplate;
   
   // 주문별 매출
   RowMapper<SalesDto> adminSalesMapper = new RowMapper<SalesDto>() {

      @Override
      public SalesDto mapRow(ResultSet rs, int rowNum) throws SQLException {
         SalesDto dto = new SalesDto();
         dto.setOrderDate(rs.getDate("order_date"));
         dto.setTotal(rs.getLong("total"));
         return dto;
      }
      
   };
   // 일별 매출
   RowMapper<DailySalesDto> dailyRowMapper = new RowMapper<DailySalesDto>() {

      @Override
      public DailySalesDto mapRow(ResultSet rs, int rowNum) throws SQLException {
         DailySalesDto dto = new DailySalesDto();
         dto.setDay(rs.getString("day"));
         dto.setTotal(rs.getLong("total"));
         return dto;
      }
      
   };
   // 월별 매출
   RowMapper<MonthlySalesDto> monthlyRowMapper = new RowMapper<MonthlySalesDto>() {
      
      @Override
      public MonthlySalesDto mapRow(ResultSet rs, int rowNum) throws SQLException {
         MonthlySalesDto dto = new MonthlySalesDto();
         dto.setMonth(rs.getString("month"));
         dto.setTotal(rs.getLong("total"));
         return dto;         
      }
   };
   
   // 기본 조회
   public List<SalesDto> selectList(){
      String sql = "select * from sales order by order_date desc";
      return jdbcTemplate.query(sql, adminSalesMapper);
   }
   
   // 조건에 따른 정렬 및 조회
   public List<SalesDto> selectList(PaginationVO vo, String sort){
      String sql = "select * from("
                + "select rownum rn, TMP.* from("
                + "select * from admin_sales)TMP"
                + ")where rn between ? and ?"
                + "order by "+sort;
        
        Object[] param = {vo.getBegin(), vo.getEnd()};
        
        return jdbcTemplate.query(sql, adminSalesMapper, param);
   }
   
   // 판매 카운트
   public int selectCount() {
      String sql = "select count(*) from admin_sales";
      return jdbcTemplate.queryForObject(sql, int.class);
   }
   
   // 월별 매출 조회
   public List<MonthlySalesDto> selectMonthlyList() {
      String sql = "select "
            + "sum(total) total, to_char(order_date, 'YYYY-MM') month "
            + "from admin_sales "
            + "group by to_char(order_date, 'YYYY-MM')";
      
      return jdbcTemplate.query(sql, monthlyRowMapper);
      
   }
   
   // 일별 매출 조회
      public List<DailySalesDto> selectDailyList() {
         String sql = "select "
               + "sum(total) total, to_char(order_date, 'YYYY-MM-DD') day "
               + "from admin_sales "
               + "group by to_char(order_date, 'YYYY-MM-DD')";
         
         return jdbcTemplate.query(sql, dailyRowMapper);
      }
   
   
   
}