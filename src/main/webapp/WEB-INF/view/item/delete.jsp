<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /slopal/src/main/webapp/WEB-INF/view/item/delete?item_id=${item.id} --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 삭제 전 확인</title>
</head>
<body>
<h2>상품 삭제 전 확인</h2>
<table>
	<tr><td><img src="../img/${item.pictureUrl}"></td>
		<td><table>
				<tr><td>제품명</td><td>${item.name}</td></tr>
				<tr><td>제품 분류</td><td>${item.tag}</td></tr>
				<tr><td>제품 품질</td><td>${item.quality}</td></tr>
				<tr><td>제품 가격</td><td>${item.price}</td></tr>
				<tr><td>제품설명</td><td>${item.description}</td></tr>
				<tr>
					<td colspan="2">
						<form action="delete" method="post">
							<input type="hidden" name="id" value="${param.id}">
							<input type="submit" value="제품삭제"> 
							<!--<input type="submit" value="제품목록" onclick="location.href='list'"> -->
							<input type="button" value="뒤로가기" onclick="history.back();" />
						</form>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>