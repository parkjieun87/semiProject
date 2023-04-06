<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<style>
	#month, #day:hover{
		color: black;
	}
</style>
<script>
	$(function(){
		$(".daily-sales").show();
		$(".monthly-sales").hide();
		
		
		$(".daily-btn").click(function(){
			$(".daily-sales").show();
			$(".monthly-sales").hide();
		});
		$(".monthly-btn").click(function(){
			$(".daily-sales").hide();
			$(".monthly-sales").show();
		});
	});
</script>
<script>
$(function(){
    $.ajax({
        url:"http://localhost:8080/admin/dailysales",
        method:"get",
        success: function(response){
            // 차트 생성
            var ctx = document.querySelector('#dailyChart');

            new Chart(ctx, {
                type: 'bar',
                // data : 차트의 구성 데이터 정보
                // - labels : 항목명( x축)
                // - datasets : 차트 데이터
                //      - label : 데이터의 이름
                //      - data : 항목별 실제 데이터(labels와 개수가 일치해야 한다)
                data: {
                    labels: response.label,
                    datasets: [{
                        label: '매출액',
                        data: response.data,
                        borderWidth: 1,
                        backgroundColor: "#9091E6",
                        borderColor: "#9091E6"
                   }]
                },
                options: {
                scales: {
                    y: {
                    beginAtZero: true
                    }
                    }
                }
            });
            },
            error: function(){
                alert("통신 오류");
            },
        });
    
});

$(function(){
    $.ajax({
        url:"http://localhost:8080/admin/monthlysales",
        method:"get",
        success: function(response){
            // 차트 생성
            var ctx = document.querySelector('#monthlyChart');

            new Chart(ctx, {
                type: 'bar',
                // data : 차트의 구성 데이터 정보
                // - labels : 항목명( x축)
                // - datasets : 차트 데이터
                //      - label : 데이터의 이름
                //      - data : 항목별 실제 데이터(labels와 개수가 일치해야 한다)
                data: {
                    labels: response.label,
                    datasets: [{
                        label: '매출액',
                        data: response.data,
                        borderWidth: 1,
                        backgroundColor: "#9091E6",
                        borderColor: "#9091E6"
                   }]
                },
                options: {
                scales: {
                    y: {
                    beginAtZero: true
                    }
                    }
                }
            });
            },
            error: function(){
                alert("통신 오류");
            },
        });
    
});
</script>


			    <div class="container-600">

			    <div class="btn-group">
	    			<!-- 일별 매출 버튼 -->
					<span class="daily-btn sales-btn">일별 매출</span>
					
					<!-- 월별 매출 버튼 -->
					<span class="monthly-btn sales-btn">월별 매출</span>
					
			    </div>
			    
			    <div class="daily-sales">
				  <canvas id="dailyChart"></canvas>
				
				  <div class="table-responsive">
				    <table class="table table-hover table-bordered center">
				      <thead>
				        <tr>
				          <th>날짜</th>
				          <th>매출액</th>
				        </tr>
				      </thead>
				      <tbody>
				        <c:forEach items="${daily}" var="dailyDto">
				          <tr id="day">
				            <td>${dailyDto.day}</td>
				            <td><fmt:formatNumber pattern="##,#00">${dailyDto.total}</fmt:formatNumber>원</td>
				          </tr>
				        </c:forEach>
				      </tbody>
				    </table>
				  </div>
				</div>
				
				<div class="monthly-sales">
				  <canvas id="monthlyChart"></canvas>
				
				  <div class="table-responsive">
				    <table class="table table-hover table-bordered center">
				      <thead>
				        <tr>
				          <th>날짜</th>
				          <th>매출액</th>
				        </tr>
				      </thead>
				      <tbody>
				        <c:forEach items="${monthly}" var="monthlyDto">
				          <tr id="month">
				            <td>${monthlyDto.month}</td>
				            <td><fmt:formatNumber pattern="##,#00">${monthlyDto.total}</fmt:formatNumber>원</td>
				          </tr>
				        </c:forEach>
				      </tbody>
				    </table>
				  </div>
				</div>
		</div>
        
        
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>