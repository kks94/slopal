<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!-- /slopal/src/main/webapp/WEB-INF/view/item/inDelete?id=${receive.id} -->
<html>
<head>
<meta charset="UTF-8">
<title>입고 기록 삭제 전 확인</title>
<style>
	.smallbox {margin-bottom:10px;}
	.t {margin-right:40px}
	#btn {background-color:white; border:none;}
	#btn:hover {
      background-color:#ffebee;
      transition: 0.3s;
  }
</style>
</head>
<body>
	<h2>상품 삭제 전 확인</h2>
	<div class="w3-container" style="margin-top: 100px; margin-left: 70px;">
		<div class="smallBox">
			<span class="t">입고일</span><span class="c"><fmt:formatDate value="${in.indate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
		</div>
		<div class="smallBox">
			<span class="t">제품명</span><span class="c">${in.itemName}</span>
		</div>
		<div class="smallBox">
			<span class="t">품질&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="c">${qualName}</span>
		</div>
		<div class="smallBox">
			<span class="t">입고량</span><span class="c">${in.incnt}</span>
		</div>
		<div class="w3-center" style="margin-top: 20px;">
			<form action="inDelete"  method="post"  name="f">
			<input type="hidden" name="id" value="${in.id}">
			<button type="button" class="w3-btn" id="btn" onclick="history.back();">뒤로가기</button>
			<button type="submit" class="w3-btn" id="btn">삭제</button>
			</form>
		</div>

	</div>
</body>
</html>