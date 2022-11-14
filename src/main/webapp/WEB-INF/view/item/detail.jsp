<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- /slopal/src/main/webapp/WEB-INF/view/item/detail?id=${item.id} --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
<script>
	function submit2(frm,actionUrl) {
		frm.action = actionUrl;
		frm.submit();
		return true;
	}
</script>
<style>
	.smallbox {margin-bottom:10px;}
	#t {margin-right:40px}
	#btn {background-color:white; border:none;}
	#btn:hover {
      background-color:#ffebee;
      transition: 0.3s;
  }
</style>
</head>
<body>
	<!-- --------------------------------------------------------------------------------------- -->
	<h2><span style="color:red;">[${qualName}]</span> ${item.name}
	<span class="w3-right" style="border-radius: 15px; background-color:#b39ddb; color:white;"><c:if test="${maxcnt==0}">SOLD OUT</c:if></span></h2> <!-- maxcnt(재고)가 0이면 품절 -->
	<hr>
	<div id="showBox">
		<div id="imgBox" style="display:inline-block; width:45%">
		<div id="img" style="width: 100%;">
			<img src="../img/${item.pictureUrl}" width="100%">
		</div>
		</div>
		<div id="detailBox" style="margin-left:40px; display:inline-block; height:100%;   vertical-align: top;">
		<div id="tag" class="w3-xlarge" style="margin-bottom:20px">#&nbsp;&nbsp;${item.tag}</div>
		<div class="smallbox">
			<span id="t" class="w3-large">제품품질</span>
			<span id="c">${qualName}</span>
		</div>
		<div class="smallbox">
			<span id="t" class="w3-large">제품가격</span>
			<span id="c"><fmt:formatNumber value="${item.price}" pattern="###,###" />원</span>
		</div>
		<div class="smallbox">
			<div id="t" class="w3-large" style="display:inline-block; margin-right:40px;">제품설명</div>
			<div id="c" style="display:inline-block;">${item.description}</div>
		</div>
		<div class="smallbox">
			<div id="t" class="w3-large" style="display:inline-block; width:72px;">재고</div>
			<div id="c" style="display:inline-block; color:#e57373">${maxcnt}</div>
		</div>
		
		<div id="order" >
			<form action="../cart/cartAdd" method="post" name="f">
				<input type="hidden" name="id" id="id" value="${item.id}">
				<input type="hidden" name="name" id="name" value="${item.name}">
				<input type="hidden" name="quality" id="quality" value="${item.quality}">
				<input type="hidden" name="price" id="price" value="${item.price}">
				<input type="hidden" name="maxcnt" id="maxcnt" value="${maxcnt}">
				<table class="w3-table w3-bordered" style="margin-top:60px; margin-bottom:40px;">
					<tr><th class="w3-center">(수량선택)</th><th class="w3-right">합계</th></tr>
					<tr><td><input type="button" value=" - " name="minus" id="minus">
							<input type="text" name="quantity" id="quantity" value="0" size="3" max=""><!-- ※max는 입고수량-주문상품수량으로 정하기 -->
							<input type="button" value=" + " name="add" id="add"> </td>
						<td><input type="text" name="sum" id="sum" size="11" readonly>원</td>
				</table>
				<div class="w3-right">
				<%-- ※※※※※ loginUser섹션, item.id 파라미터
				<c:if test=""> <!-- ※찜을 하지 않은 상태일 때 =>빈하트 -->
				<button type="button" class="w3-btn" id="btn" onclick='return submit2(this.form, "../wish/itemWished")'>
												<i class="fa fa-heart-o" style="font-size:36px"></i></button>
				</c:if test="">
				<c:if test=""><!-- ※찜을  한 상태일 때 => 꽉찬하트-->
				<button type="button" class="w3-btn" id="btn" onclick='return submit2(this.form, "../wish/itemNotWished")'>
												<i class="fa fa-heart" style="font-size:36x;color:red"></i></button>
				</c:if>
				 --%>
				<button type="button" class="w3-btn" id="btn" onclick='return submit2(this.form, "../wish/itemWished")'>
												<i class="fa fa-heart" style="font-size:36x;color:red"></i></button>
				<button type="button" class="w3-btn" id="btn" onclick='return submit2(this.form, "../cart/cartAdd")'>
												<i class="fa fa-shopping-cart" style="font-size:36x;"></i></button>
				</div>
			</form>
		</div>
		</div>
	</div>
	<script>
	//수량 up, down
	let formform = document.getElementsByName("f");
	let price = document.getElementById("price"); 		//가격
	let quantity = document.getElementById("quantity"); //수량
	let add = document.getElementById("add");
	let minus = document.getElementById("minus");
	let sum = document.getElementById("sum"); //합계
	let maxcnt = document.getElementById("maxcnt"); 
	
	if(formform) {
		sum.value = price.value;
		let quantityVal=quantity.value;
		let sumVal = sum.value;
		let priceVal=price.value;
		let maxcntVal = maxcnt.value;
		if(add) {
			add.addEventListener('click', function() {
				if(quantityVal >= maxcntVal) {
					quantityVal = maxcntVal;
				} else {
					quantityVal++;
					sumVal = quantityVal * priceVal;
					quantity.value = quantityVal;
					sum.value = sumVal;
					console.log(quantityVal, sumVal, priceVal);
				}
			})
		}
		if (minus) {
			minus.addEventListener('click', function() {
				if(quantityVal >= 1) {
					quantityVal--;
					sumVal = quantityVal * priceVal;
					quantity.value = quantityVal;
					sum.value = sumVal;
					console.log(quantityVal, sumVal, priceVal);
				} else {
					quantityVal = 1;
				}
			})
		}
	}
	</script>
	<div id="review"></div> <!-- ※리뷰 공간 (볼 수만 있게 , 리뷰 쓰는 건 마이페이지에서)-->
	<div id="relatedProducts"></div> <!-- ※연관상품 공간 -->
</body>
</html>