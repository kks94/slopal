<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%-- /slopal/src/main/webapp/WEB-INF/view/item/itemDetail?name=${item.name} --%>
<%--관리자용 아이템 디테일 --%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
</head>
<body>
<h2>${item.name}</h2>
<hr>
<table>
	<tr><td width="35%"><img src="../img/${item.pictureUrl}"></td>
		<td> <table>
				<tr><td>제품명</td><td>${item.name}</td></tr>
				<tr><td>제품 분류</td><td>${item.grp}</td></tr>
				<tr><td>제품 품질</td><td>${item.quality}</td></tr>
				<tr><td>제품 가격</td><td>${item.price}</td></tr>
				<tr><td>제품설명</td><td>${item.description}</td></tr>
				<!-- ※ 재고 수량 표시해주기 -->
				<tr><td colspan="2">
					<input type="button" value="뒤로가기" onclick="history.back();"> </td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>