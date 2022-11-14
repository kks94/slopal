<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /springmvc1/src/main/webapp/WEB-INF/view/user/join.jsp --%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="spring" 
                     uri="http://www.springframework.org/tags"%>  
<%@ taglib prefix="form" 
                 uri="http://www.springframework.org/tags/form"%> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자등록</title>
</head>
<body>
<h2>사용자 등록</h2>
<form:form modelAttribute="user" method="post" action="join">
<spring:hasBindErrors name="user">
<font color="red">
  <c:forEach items="${errors.globalErrors }" var="error">
    <spring:message code="${error.code}"/>
  </c:forEach>
</font>
</spring:hasBindErrors>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
    <div class="w3-rest">
      <form:input class="w3-input w3-border" path="userid"  placeholder="아이디" onkeyup="idChk(this.value)" />
      <font color="red"><form:errors path="userid" /></font>
    </div>
</div>
<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
    <div class="w3-rest">
      <form:password path="password"  class="w3-input w3-border"  placeholder="비밀번호" /> 
      <font color="red"><form:errors	path="password" /></font>
    </div>
</div>
<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-pencil"></i></div>
    <div class="w3-rest">
      <form:input class="w3-input w3-border" path="username"  placeholder="이름"  />
      <font color="red"><form:errors path="username" /></font>
    </div>
</div>
<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-phone"></i></div>
    <div class="w3-rest">
      <form:input class="w3-input w3-border" path="phoneno"  placeholder="전화번호"  />
      <font color="red"><form:errors path="phoneno" /></font>
    </div>
</div>
<div class="w3-row w3-section">

      <input class="w3-input w3-border"  style="width: 40%; display: inline;" placeholder="우편번호" name="add1" id="add1" type="text" readonly="readonly"  />
      <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
     
    </div>


<div class="w3-row w3-section">

    <input class="w3-col" style="top: 5px;" placeholder="도로명 주소" name="add2" id="add2" type="text" readonly="readonly" />
</div> 
<div class="w3-row w3-section">
    <input class="w3-col" placeholder="상세주소" name="add3" id="add3" type="text"  />

</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-envelope-o"></i></div>
    <div class="w3-rest">
      <form:input class="w3-input w3-border" path="email"  placeholder="이메일"  />
      <font color="red"><form:errors path="email" /></font>
    </div>
</div>
<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
    <div class="w3-rest">
      <form:input class="w3-input w3-border" path="birthday"  placeholder="생년월일"  />
      <font color="red"><form:errors path="birthday" /></font>
    </div>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=add1]").val(data.zonecode);
           $("[name=add2]").val(fullRoadAddr);
           
            document.getElementById('add1').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('add2').value = fullRoadAddr;
           document.getElementById('add3').value = data.jibunAddress;
       }
    }).open();
}

</script>
<button class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding">회원등록</button>
</form:form>
</body>
</html>