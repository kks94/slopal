<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" /> 
<c:set var="tag" value="${sessionScope.tag}" /> 
<%-- /slopal/src/main/webapp/layout/slopallayout.jsp --%>
<!DOCTYPE html>
<html>
<head>
<title><sitemesh:write property="title" /></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
</style>
<sitemesh:write property="head" />
</head>

<body class="w3-content" style="max-width:1200px">

<!-- Sidebar/menu : 로고 & 좌측 메뉴바 -->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide"><a href="${path}/item/list" style="text-decoration:none;"><b>SLOPAL</b></a></h3> <!-- !!! a태그로 가능? -->
  </div>
  <hr>
  <div class="w3-large w3-text-grey" style="font-weight:bold">
    <a href="${path}/item/list?tag=Phone" class="w3-bar-item w3-button<c:if test='${tag eq "Phone"}'> w3-light-grey</c:if>">Phone</a>
    <a onclick="myAccFunc()" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="myBtn">
      Computer <i class="fa fa-caret-down"></i></a> <!-- Computer는 Sidebar의 아이템이 아니므로 href="#". 버튼임(버튼을 누름으로써 상세카테고리를 볼 수 있는 역할) -->
    <div id="demoAcc" class="w3-bar-block w3-hide w3-padding-large w3-medium">
    <!--  !!!. 페이지에 따라 ▶ 위치 다르게 <i class="fa fa-caret-right w3-margin-right"></i>-->
      <a href="${path}/item/list?tag=Graphic card" class="w3-bar-item w3-button<c:if test='${tag eq "Graphic card"}'> w3-light-grey</c:if>">Graphic card</a>
      <a href="${path}/item/list?tag=CPU" class="w3-bar-item w3-button<c:if test='${tag eq "CPU"}'> w3-light-grey</c:if>">CPU</a>
      <a href="${path}/item/list?tag=Memory" class="w3-bar-item w3-button<c:if test='${tag eq "Memory"}'> w3-light-grey</c:if>">Memory</a>
      <a href="${path}/item/list?tag=Main board" class="w3-bar-item w3-button<c:if test='${tag eq "Main board"}'> w3-light-grey</c:if>">Main board</a>
      <a href="${path}/item/list?tag=SSD/HHD" class="w3-bar-item w3-button<c:if test='${tag eq "SSD/HHD"}'> w3-light-grey</c:if>">SSD/HHD</a>
      <a href="${path}/item/list?tag=RAM" class="w3-bar-item w3-button<c:if test='${tag eq "RAM"}'> w3-light-grey</c:if>">RAM</a>
      <a href="${path}/item/list?tag=Power" class="w3-bar-item w3-button<c:if test='${tag eq "Power"}'> w3-light-grey</c:if>">Power</a>
      <a href="${path}/item/list?tag=Keyboard" class="w3-bar-item w3-button<c:if test='${tag eq "Keyboard"}'> w3-light-grey</c:if>">Keyboard</a>
      <a href="${path}/item/list?tag=Mouse" class="w3-bar-item w3-button<c:if test='${tag eq "Mouse"}'> w3-light-grey</c:if>">Mouse</a>
    </div>
  </div>
  	<hr>
    <a href="#" class="w3-bar-item w3-button w3-padding">Notice</a> <!-- 공지사항 -->
    <a href="#" class="w3-bar-item w3-button w3-padding">자유게시판</a> 
    <a href="#" class="w3-bar-item w3-button w3-padding">QnA</a>
</nav>

<!-- Top menu on small screens:화면 제일 줄였을 때 -->
<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
  <div class="w3-bar-item w3-padding-24 w3-wide"><a href="${path}/item/list" style="text-decoration:none;">SLOPAL</a></div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-right" onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px" id="wrapper">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:83px"></div>
  
  <!-- Top header -->
  <header class="w3-container w3-medium" id="header">
    <p class="w3-left"><c:if test="${!empty sessionScope.page}">${page}</c:if></p> <!-- 현재 페이지 알려줌 -->
    <p class="w3-right">
  	<c:if test="${empty sessionScope.loginUser}">
  		<a href="${path}/user/login" class="w3-button">로그인</a>
  		<a href="${path}/user/join" class="w3-button">회원가입</a>
  	</c:if>
  	<c:if test="${!empty sessionScope.loginUser}">
  		<a href="${path}/user/mypage?id=${loginUser.userid}" class="w3-button">
  			<i class="fa fa-user fa-fw"></i>${sessionScope.loginUser.username}님&nbsp;&nbsp;</a>
  		<a href="${path}/user/logout" class="w3-button">로그아웃</a>
  	</c:if>
  	<a href="${path}/cart/cartView" class="w3-button"><i class="fa fa-shopping-cart"></i></a>
  	
  </p>
  </header>
  
  <div class="w3-container" style="margin-top:50px; margin-bottom:100px;" id="container">
  	<sitemesh:write property="body" />
  </div>

  <hr>

  <!-- Subscribe section
  <div class="w3-container w3-black w3-padding-32">
    <h1>Subscribe</h1>
    <p>To get special offers and VIP treatment:</p>
    <p><input class="w3-input w3-border" type="text" placeholder="Enter e-mail" style="width:100%"></p>
    <button type="button" class="w3-button w3-red w3-margin-bottom">Subscribe</button>
  </div>
   -->
  <!-- Footer -->
  <footer class="w3-padding-24 w3-light-grey w3-small w3-center" id="footer">
    <div class="w3-row-padding">
    <!--
      <div class="w3-col s4">
        <h4>Contact</h4>
        <p>Questions? Go ahead.</p>
        <form action="/action_page.php" target="_blank">
          <p><input class="w3-input w3-border" type="text" placeholder="Name" name="Name" required></p>
          <p><input class="w3-input w3-border" type="text" placeholder="Email" name="Email" required></p>
          <p><input class="w3-input w3-border" type="text" placeholder="Subject" name="Subject" required></p>
          <p><input class="w3-input w3-border" type="text" placeholder="Message" name="Message" required></p>
          <button type="submit" class="w3-button w3-block w3-black">Send</button>
        </form>
      </div>
	  -->
      <div class="w3-col s4">
        <h4>About</h4>
        <p><a href="#">About us</a></p> <!-- 팀원 소개 페이지 -->
        <br>
        <i class="fa fa-facebook-official w3-hover-opacity w3-large"></i>
        <i class="fa fa-instagram w3-hover-opacity w3-large"></i>
        <i class="fa fa-snapchat w3-hover-opacity w3-large"></i>
        <i class="fa fa-pinterest-p w3-hover-opacity w3-large"></i>
        <i class="fa fa-twitter w3-hover-opacity w3-large"></i>
        <i class="fa fa-linkedin w3-hover-opacity w3-large"></i>
      </div>

      <div class="w3-col s4 w3-justify">
        <h4>Store</h4>
        <p><i class="fa fa-fw fa-map-marker"></i> Company: DBDB딥</p>
        <p><i class="fa fa-fw fa-phone"></i> 0044123123</p>
        <p><i class="fa fa-fw fa-envelope"></i> ex@mail.com</p>
      </div>
      <div class="w3-col s4 w3-justify">
        <h4>We accept</h4>
        <p><i class="fa fa-fw fa-cc-amex"></i> Amex</p>
        <p><i class="fa fa-fw fa-credit-card"></i> Credit Card</p>
      </div>
    </div>
  </footer>

  <div class="w3-black w3-center w3-padding-14">Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a></div>

  <!-- End page content -->
</div>

<!-- Newsletter Modal -->
<!--
<div id="newsletter" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom" style="padding:32px">
    <div class="w3-container w3-white w3-center">
      <i onclick="document.getElementById('newsletter').style.display='none'" class="fa fa-remove w3-right w3-button w3-transparent w3-xxlarge"></i>
      <h2 class="w3-wide">NEWSLETTER</h2>
      <p>Join our mailing list to receive updates on new arrivals and special offers.</p>
      <p><input class="w3-input w3-border" type="text" placeholder="Enter e-mail"></p>
      <button type="button" class="w3-button w3-padding-large w3-red w3-margin-bottom" onclick="document.getElementById('newsletter').style.display='none'">Subscribe</button>
    </div>
  </div>
</div>
  -->
<script>
// Accordion 
function myAccFunc() {
  var x = document.getElementById("demoAcc");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}

// Click on the "Computer" link on page load to open the accordion for demo purposes
document.getElementById("myBtn").click();


// Open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}
</script>

</body>
</html>