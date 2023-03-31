<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Javascript</title>

    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="css/load.css">
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/commons.css">
    <link rel="stylesheet" type="text/css" href="css/layout.css">
    <link rel="stylesheet" type="text/css" href="css/test.css">
    
    <!--jquery cdn-->
    <script src = "https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript">
        $(function(){
            console.log(${list});
        });
    </script>
</head>
<body>
    <div class="container-600">
        
    	<!-- 정렬  --> 
	    <div class="row" style="margin:auto;">
			<a href="sales"></a>
			<a href="sales"></a>
			<a href="sales?sort="></a>
			<a href="sales?sort="></a>
		</div>
		<div class="row">
			<!-- ì¼ë³ ë§¤ì¶ -->
			<c:forEach items="${daily}" var="dailyDto">
				<h3>일별 매출</h3>
				
						${dailyDto.day} 매출 : ${dailyDto.total }
					
			</c:forEach>
			
			<!-- 월별 매출 -->
			<c:forEach items="${monthly}" var="monthlyDto">
				<h3>월별 매출</h3>
				
						${monthlyDto.month} 매출 : ${monthlyDto.total }
			</c:forEach>
			
		</div>
		<div class="container-1000 ms-20">
			<table class="table table-slit center" > 
			<thead>
				<tr>
					<th>주문 날짜</th>
					<th>가격</th>
					<th>개수</th>
					<th>총 주문 금액</th>
				</tr>
			</thead>
			<tbody>
			
			<!-- 주문별 매출 -->
			<c:forEach items="${list}" var="salesDto">
				<tr>
					<td>
						${salesDto.orderDate}
					</td>
					<td>
						${salesDto.productPrice }원
					</td>
					<td>
						${salesDto.productCount}개
					</td>
					<td>
						${salesDto.totalSale}ì
					</td>
				</tr>
			</c:forEach>
			
			</tbody>
			</table>
		</div>
		<!-- íì´ì§ ìì­ -->
		<div class="page_wrap">
			<div class="page_nation">
				<c:if test="${vo.startBlock != 1}">
				<a class="arrow prev" href="list?page=${vo.prevPage}">&lt;</a>
				</c:if>
					<c:forEach var="i" begin="${vo.startBlock}" end="${vo.finishBlock}">
						<a href="list?page=${i}">${i}</a>
					</c:forEach>
				<c:if test="${vo.page != vo.totalPage}">
				<a class="arrow next" href="list?page=${vo.nextPage}">&gt;</a>
				</c:if>
			</div>
		</div>
       
        
        
        
    </div>
</body>
</html>