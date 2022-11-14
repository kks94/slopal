<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<%--/slopal/src/main/webapp/WEB-INF/view/item/inUpdate?id=${receive.id} --%>
<html>
<head>
<meta charset="UTF-8">
<title>입고 수량 수정</title>
<style>
	#btn {background-color:white; border:none;}
	#btn:hover {
      background-color:#ffebee;
      transition: 0.3s;
  }
</style>
</head>
<body>
<h2>입고 수량 수정</h2>
<div class="updatebox" style="margin-top:100px; margin-left:70px;">
	<form:form modelAttribute="receive" action="inupdate" method="post">
		<input type="hidden" name="id" id="id" value="${param.id}">
		<input type="hidden" name="itemName" id="itemName" value="${in.itemName}">
		<input type="hidden" name="itemQuality" id="itemQuality" value="${in.itemQuality}">
		변경 수량을 입력하세요: <form:input path="incnt" maxlength="10" style="text-align:right" value="${in.incnt}" /> 개
				<font color="red"><form:errors path="incnt" /></font><br>
		<div class="w3-center" style="margin-top:20px;">
			<button type="button" class="w3-btn" id="btn" onclick="history.back();">뒤로가기</button>
			<button type="submit" class="w3-btn" id="btn">수정</button>
		</div>
	</form:form>
</div>
</body>
</html>