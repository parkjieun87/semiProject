<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

 <div class="container-800">
        <div class="row center">
            <h1>${memberDto.memberNick} 님의 마이페이지</h1>
        </div>
        <div>
            이미지
        </div>
        <hr>
        <div class="row center">
            <table class="table table-border table-slit table-hover">
                <tbody>
                    <tr>
                        <td>아이디</td>
                        <td>${memberDto.memberId}</td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td>${memberDto.memberName}</td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td>${memberDto.memberEmail}</td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td>${memberDto.memberTel}</td>
                    </tr>
                    <tr>
                        <td>닉네임</td>
                        <td>${memberDto.memberNick}</td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td>[${memberDto.memberPost}] 
						${memberDto.memberBasicAddr}
						${memberDto.memberDetailAddr}
						</td>
                    </tr>
                    
                    <tr>
                        <td>가입일</td>
                        <td><fmt:formatDate value="${memberDto.memberRegdate}"
								pattern="y년 M월 d일 E a h시 m분 s초"/></td>
                    </tr>
                  
                </tbody>
            </table>
            <div class="row left">
            <h2><a href="password">비밀번호 변경</a></h2>
            <h2><a href="edit">개인정보 변경</a></h2>
            <h2><a href="exit">회원 탈퇴</a></h2>
            </div>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

