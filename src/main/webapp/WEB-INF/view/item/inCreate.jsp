<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<%--/slopal/src/main/webapp/WEB-INF/view/item/inCreate?id=${item.id} --%>
<html>
<head>
<meta charset="UTF-8">
<title>입고 관리 & 등록</title>
<style>
	.smallbox {margin-bottom:10px;}
	#t {margin-right:40px}
	#btn {background-color:white; border:none;}
	#btn:hover {
      background-color:#ffebee;
      transition: 0.3s;
  }
  img {position:flex; top:0; left:0; width:100%; height:100%;}
  th,td {vertical-align: middle;}
</style>
</head>
<body>
	<h2>
		<span style="color: red;">[${qualName}]</span> ${item.name}
	</h2>
	<hr>
	<div id="showBox" style="width:100%;">
		<div id="imgBox" style="display: inline-block; width: 45%">
				<img src="../img/${item.pictureUrl}" width="100%">
		</div>
		<div id="detailBox" 
			style="margin-left: 40px; display: inline-block; height: 100%; vertical-align: top;">
			<div id="tag" class="w3-xlarge" style="margin-bottom: 20px">#&nbsp;&nbsp;${item.tag}</div>
			<div class="smallbox">
				<span id="t" class="w3-large">제품품질</span> <span id="c">${qualName}</span>
			</div>
			<div class="smallbox">
				<span id="t" class="w3-large">제품가격</span> <span id="c"><fmt:formatNumber
						value="${item.price}" pattern="###,###" />원</span>
			</div>
			<div class="smallbox">
				<div id="t" class="w3-large"
					style="display: inline-block; margin-right: 40px;">제품설명</div>
				<div id="c" style="display: inline-block;">${item.description}</div>
			</div>
			<div class="smallbox">
				<div id="t" class="w3-large"
					style="display: inline-block; width: 72px;">재고</div>
				<div id="c" style="display: inline-block; color: #e57373">${maxcnt}</div>
			</div>
			<hr>
			<form:form modelAttribute="receive" action="inregister" method="post">
				<input type="hidden" name="itemName" id="itemName" value="${item.name}">
				<input type="hidden" name="itemQuality" id="itemQuality" value="${item.quality}">
				입고 수량: <form:input path="incnt" maxlength="10" style="text-align:right"/> 개
				<font color="red"><form:errors path="incnt" /></font>
				<hr>
				<div class="w3-right">
				<button type="button" class="w3-btn" id="btn" onclick="history.back();">뒤로가기</button>
					<button type="submit" class="w3-btn" id="btn">입고 등록</button>
				</div>
			</form:form>
		</div>
	</div>
	<div id="inList" style="margin-top:30px;"><!-- 이 제품에 대한 입고 목록 . itemName,itemQuality가 이 아이템과 같은 것 입고DB에서 list 조회해야함 Controller에서.-->
	<table width=100% class="w3-table-all">
		<tr><th width=8%>No</th><th width=20% style="text-align:center;">입고일</th><th width=30% style="text-align:center;">제품명</th>
		<th width=7%>품질</th><th width=15% style="text-align:center;">입고량</th><th width=20%>&nbsp;</th></tr>
		<c:forEach var="in" items="${inList}">
  			<tr><td>${inNo}</td><c:set var="inNo" value="${inNo - 1}" />
      			<td style="text-align: left; color:#65499c;"><fmt:formatDate value="${in.indate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
      			<td style="text-align:center;">${in.itemName}</td>
      			<td>${qualName}</td>
      			<td style="text-align:center; color:#ec407a;">${in.incnt}</td>
      			<td style="text-align:right;">
      				<a href="inUpdate?id=${in.id}" class="w3-button">수정</a>
       				<a href="inDelete?id=${in.id}" class="w3-button">삭제</a>
   				</td>
 		</c:forEach>
 		<c:if test="${listcount == 0}">
 		<tr><td colspan="5" style="text-align:center;">등록된 입고기록이 없습니다.</td></tr>
 		</c:if>
	</table>
	</div>
</body>
</html>