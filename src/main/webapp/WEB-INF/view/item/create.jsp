<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--/slopal/src/main/webapp/WEB-INF/view/item/create.jsp
	1. 유효성 검증
	2. 파일 업로드
--%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
</head>
<body>
<!-- modelAttribute="item" : Item 객체 필요 -->
<form:form modelAttribute="item" action="register" enctype="multipart/form-data">
	<h2>제품 등록</h2>
	<table>
		<tr><td>제품명</td>
			<td><form:input path="name" maxlength="20" /></td>
			<td><font color="red"><form:errors path="name" /></font></td>
		</tr>
		<tr><td>제품 분류</td>
			<td><form:select path="tag">
					<form:option value="">-----선택-----</form:option>
					<form:options items="${tags}" />
				</form:select></td>
			<td><font color="red"><form:errors path="tag" /></font></td>
		</tr>
		<tr><td>제품 품질</td>
			<td><form:select path="quality">
					<form:option value="">--선택--</form:option>
					<form:options items="${qualities}" />
				</form:select></td>
			<td><font color="red"><form:errors path="quality" /></font></td>
		</tr>
		<tr><td>제품 가격</td>
			<td><form:input path="price" maxlength="20" /></td>
			<td><font color="red"><form:errors path="price" /></font></td>
		</tr>
		<tr><td>제품이미지</td>
			<td colspan="2"><input type="file" name="picture"></td>
		</tr>
		<tr><td>제품설명</td>
			<td><form:textarea path="description" cols="20" rows="5" /></td>
			<td><font color="red"><form:errors path="description" /></font></td>
		</tr>
		<tr><td colspan="3">
				<input type="submit" value="제품등록">&nbsp;
				 <!--<input type="submit" value="제품목록" onclick="location.href='list'"> -->
				<input type="button" value="뒤로가기" onclick="history.back();" />
			</td>
		</tr>
	</table>
</form:form>
</body>
</html>