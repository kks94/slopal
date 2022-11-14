<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /springmvc1/src/main/webapp/WEB-INF/view/user/mypage.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>       
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title>MyPage</title>
<script type="text/javascript">
  function disp_div(id,tab) {
	  $(".info").hide()  //class="info"인 모든 태그들을 숨김.
	  //class="tab"인 태그의 select 클래스 속성 제거
	  $(".tab").removeClass("select") 
	  $("#"+id).show()   //id="minfo"인 태그부분 보임
	  //id="tab1" 인 태그에 select class 속성 추가
	  $("#"+tab).addClass("select") 
  } 
  function list_disp(id) {
	  $("#"+id).toggle()  //toggle() : jquery함수: 
		                  //           보이는 경우 안보이도록.
	                      //           안보이는 경우 보이도록
  }
</script>
<style type="text/css">
  .select {
     padding:3px;
     background-color: #0000ff;
  }
  .select>a {
      color : #ffffff;
      text-decoration: none;
      font-weight: bold;
  }
</style>
</head><body>
<%-- 탭 부분 --%>
<table class="w3-table">
   <tr><td id="tab1" class="tab select">
 <a href="javascript:disp_div('minfo','tab1')">회원정보보기</a></td>
   <c:if test="${param.id != 'admin'}">
       <td id="tab2" class="tab">
 <a href="javascript:disp_div('oinfo','tab2')">주문정보보기</a></td>
   </c:if></tr></table>
<div id="oinfo" class="info" style="display: none; width:100%;">
  <table  class="w3-table">
    <tr><th>주문번호</th><th>주문일자</th><th>총주문금액</th></tr>
    <c:forEach items="${salelist}" var="sale" varStatus="stat">
     <tr><td align="center">
       <a href="javascript:list_disp('saleLine${stat.index}')">
          ${sale.saleid}</a></td>
     <td align="center">
   <fmt:formatDate value="${sale.saledate}"  pattern="yyyy-MM-dd"/>
     </td><td align="right">
<fmt:formatNumber value="${sale.total}" pattern="#,###"/>원</td></tr>
     <tr id="saleLine${stat.index }" 
         class="saleLine" style="display: none;">
       <td colspan="3" align="center">
       <table  class="w3-table">
         <tr><th width="25%">상품명</th><th width="25%">상품가격</th>
        <th width="25%">구매수량</th><th width="25%">상품총액</th></tr>
         <c:forEach items="${sale.itemList }" var="saleItem">
           <tr><td class="title">${saleItem.item.name}</td>
               <td><fmt:formatNumber value="${saleItem.item.price}"
                    pattern="#,###"/>원</td>
               <td>${saleItem.quantity}개</td>
         <td><fmt:formatNumber 
value="${saleItem.quantity*saleItem.item.price}" pattern="#,###"/>원
</td></tr></c:forEach>    
       </table></td></tr></c:forEach></table></div>
<div id="minfo" class="info">
 <table class="w3-table">
        <tr><td>아이디</td><td>${user.userid}</td></tr>
        <tr><td>이름</td><td>${user.username}</td></tr>
        <tr><td>우편번호</td><td>${user.add1}</td></tr>
        <tr><td>전화번호</td><td>${user.phoneno}</td></tr>
        <tr><td>주소</td><td>${user.add2}</td></tr>
        <tr><td>상세주소</td><td>${user.add3}</td></tr>
        <tr><td>이메일</td><td>${user.email}</td></tr>
        <tr><td>생년월일</td>
        <td><fmt:formatDate value="${user.birthday}"
            pattern="yyyy-MM-dd" /></td></tr>
       </table><br>
    <a href="update?id=${user.userid}">[회원정보수정]</a>&nbsp;
    <a href="password">[비밀번호수정]</a>&nbsp;
       <c:if test="${loginUser.userid != 'admin'}">
        <a href="delete?id=${user.userid}">[회원탈퇴]</a>&nbsp;
       </c:if>
       <c:if test="${loginUser.userid == 'admin'}">
           <a href="../admin/list">[회원목록]</a>&nbsp;
       </c:if></div></body></html>