<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- /springmvc1/src/main/webapp/WEB-INF/view/cart/cart.jsp --%>
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title>찜목록</title></head>
<body><h2>찜목록</h2>
<table><tr><td colspan="4">상품 목록</td></tr>
  <tr><th>상품명</th><th>가격</th></tr>
  <%--
    set : ItemSet 객체
   --%>
 <table class="w3-table">
        <tr><td>상품명</td><td>${wish.itemName}</td></tr>
        <tr><td>품질</td><td>${wish.itemQuality}</td></tr>
       </table><br>