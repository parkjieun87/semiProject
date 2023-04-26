<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<title>비밀번호 변경 페이지</title>
<script>
function validateForm() {
  var currentPw = document.forms["myForm"]["currentPw"].value;
  var changePw = document.forms["myForm"]["changePw"].value;
  if (currentPw == "" || changePw == "") {
    alert("비밀번호를 입력해주세요.");
    return false;
  }
}
</script>
<style>
	.logo {
	  display: block;
	  margin: auto;
	}
	
</style>


<div class ="container-800">
<img src = "${pageContext.request.contextPath}/static/image/petpal.png" width = "200px" height = "200px" padding="10em" class="logo">
<form action="password" method="post" align="center" class="mt-10" onsubmit="return validateForm()">
    <input type="password" name="currentPw" class="form-input w-50" placeholder="현재 비밀번호를 적으세요" required><br><br>
    <input type="password" name="changePw" class="form-input w-50"  placeholder="변경할 비밀번호를 적으세요" required><br><br>
    <button class="form-btn positive w-50" type="submit">비밀번호 변경</button>
</form>

</div>


<!-- 오류가 발생한 경우 보여줄 메시지 -->
<c:if test="${param.mode == 'error'}">
<h2>비밀번호가 일치하지 않습니다</h2>
</c:if>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
