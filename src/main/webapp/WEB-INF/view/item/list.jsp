<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%-- /springmvc1/src/main/webapp/WEB-INF/view/item/list.jsp--%>    
<!DOCTYPE html>
<html><head>
<meta charset="UTF-8">
<title>상품 목록</title>
<script type="text/javascript">
 function keyword_check(){
  if(document.search.keyword.value==''){ //검색어가 없을 경우  
  alert('검색어를 입력하세요'); //경고창 띄움 
  document.search.keyword.focus(); //다시 검색창으로 돌아감 
  return false; 
  }
  else{
	  
  }
 }

</script>
<style>
   ul li { display:inline-block; margin:40px; }
   div.item_picture img { width:200px; height:200px; }
   div.item_name {  text-align:center; }
   div.item_name a { color:#000; }
   div.item_price { text-align:center; }
   div.item_price { color: green; }
   div.item_search {padding-bottom : 10px;}
   div.item_search {  text-align:center; }
</style>
</head>
<body>
<h2>${tag}</h2>
	<!-- Search 부분 -->
	<div class="w3-container">
		<form action="list?tag=${tag}" method="post" name="sf">
			<!--<input type="hidden" name="pageNum" value="1"> -->
			<input type="text" placeholder="Search"	name="find" value="${find}" class="w3-input w3-border w3-round-large">
			<button class="w3-button" type="submit">Search</button>
		</form>
	</div>
	<c:if test="${loginUser.userid == 'admin' }">
<div>
<input type="button" value="상품등록" onclick="location.href='create'">
<input type="button" value="장바구니" onclick="location.href='../cart/cartView'" style="float:right">
</div>
 </c:if>
<hr>
<ul>
   <c:forEach items="${itemList}" var="item">
   <li>
    <div class="item_picture">
     <img src="../img/${item.pictureUrl}" onclick="location.href='detail?id=${item.id}'">
    </div>   
    <div class="item_name">
     <font color="red">[${qualities[item.quality]}]</font>&nbsp;<a href="detail?id=${item.id}">${item.name}</a>
    </div>
    <div class="item_price">
    <fmt:formatNumber value="${item.price}" pattern="###,###,###"/>&nbsp;원
    </div>
   </li>
   </c:forEach>
</ul>
</body>
</html>