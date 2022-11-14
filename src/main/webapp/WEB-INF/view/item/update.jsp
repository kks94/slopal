<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!-- /slopal/src/main/webapp/WEB-INF/view/item/update?item_id=${item.id}  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 수정</title>
</head>
<body>
<form:form modelAttribute="item" action="update" enctype="multipart/form-data">
	<form:hidden path="id" /> <form:hidden path="pictureUrl" />
	<h2>제품 정보 수정</h2>
	<table>
		<tr><td>제품명</td>
			<%--form:input path="name" maxlength="20" />
				  => <input type="text" id="name" name="name" value="item객체의 name값">
			 --%>
			<td><form:input path="name" maxlength="20" /></td>
			<td><font color="red"><form:errors path="name" /></font></td>
		</tr>
		<tr><td>제품 분류</td>
			<td><form:select path="tag">
						<form:options items="${tags}" />
				</form:select></td>
			<td><font color="red"><form:errors path="tag" /></font></td>
		</tr>
		<tr><td>제품 품질</td>
			<td><form:select path="quality">
						<form:options items="${qualities}" />
				</form:select></td>
			<td><font color="red"><form:errors path="quality" /></font></td>
		</tr>
		<tr><td>제품 가격</td>
			<td><form:input path="price" maxlength="20" /></td>
			<td><font color="red"><form:errors path="price" /></font></td>
		</tr>
		<tr><td>제품이미지</td>
			<td><input type="file" name="picture"></td>
			<td>${item.pictureUrl}</td>
		</tr>
		<tr><td>제품설명</td>
			<td><form:textarea path="description" cols="20" rows="5" /></td>
			<td><font color="red"><form:errors path="description" /></font></td>
		</tr>
		<tr><td colspan="3"><input type="submit" value="수정등록">&nbsp;
							 <!--<input type="submit" value="제품목록" onclick="location.href='list'"> -->
							<input type="button" value="뒤로가기" onclick="history.back();" />
			</td>
		</tr>
	</table>
</form:form>
</body>
</html>