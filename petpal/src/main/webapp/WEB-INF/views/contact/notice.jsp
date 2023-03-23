<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/static/css/commons.css">
<link rel="stylesheet" href="/static/css/contact/notice.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

</head>
 <div class="container-900">
       <div class="row-menu">
            <div class="row-menu-title">
                <h3>공지사항</h3>
            </div>
            <div class="header_search">
                <div class="top_search">
                    <input type="search" class="input_search" placeholder="검색어를 입력하세요.">
                    <button type="button" class="btn_top_search" id="btnTopSearch"><i class="fas fa-search fa-lg"></i></button>   
                </div>
            </div>
       </div>
       <div class="row table">
            <table style="width: 900px;">
                <colgroup>
                    <col style="width:80px">
                    <col style="width:auto">
                    <col style="width:120px">
                </colgroup>
                <tbody>
                	<c:forEach items="${noticeList}" var="list">
                	 <tr>
                        <td class="text-center">${list.boardNo}</td>
                        <td class="text-left">
                        <a href="noticeDetail?boardNo=${list.boardNo}">${list.boardTitle}</a></td>
                        <td class="text-center">${list.boardDate}</td>
                    </tr>
                	</c:forEach>                           
                </tbody>
            </table>
       </div>

       	<!-- 페이징 영역 -->
		<div class="page_wrap">
			<div class="page_nation">
				<c:if test="${vo.startBlock != 1}">
				<a class="arrow prev" href="/contact/notice?page=${vo.prevPage}">&lt;</a>
				</c:if>
					<c:forEach var="i" begin="${vo.startBlock}" end="${vo.finishBlock}">
						<a href="/contact/notice?page=${i}">${i}</a>
					</c:forEach>
				<c:if test="${vo.page != vo.totalPage}">
				<a class="arrow next" href="/contact/notice?page=${vo.nextPage}">&gt;</a>
				</c:if>
			</div>
		</div>
		<div class="row ">
			<a class="form-btn positive w-100" href="/contact/notice/write">글쓰기</a>
		</div>
    </div>
</body>
</html>