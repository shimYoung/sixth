<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Register Order</title>
<style>
.content-body {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	background-color: grey;
	padding: 10px;	
}
.content-body > .content-left, .content-body > .content-right {
	width: 50%;
	background-color: white; 
}

.content-body > .content-right div {
	width: 80%;
	border: 1px solid pink;
}

#orderContainer {
	overflow: auto;
	border: 1px solid pink;
}

#custTbl > tbody > tr {
	background-color: white;
}

#custTbl > tbody > tr:hover {
	background-color: #f186fc;
	color: white;
}

</style>
<script>
document.addEventListener("DOMContentLoaded", function(){
	var custId = document.getElementById("custId");
	var custNm = document.getElementById("custNm");
	document.querySelector("#custTbl > tbody").addEventListener("click", function(e){
		var src = e.target;
		if ( !(src.nodeType === 1 && src.nodeName === "TD") ) return;
		custId.value = src.parentElement.firstElementChild.innerText;
		custNm.value = src.parentElement.firstElementChild.nextElementSibling.innerText;
	});
	// 상품 추가 버튼을 클릭 했을 때
	document.getElementById("addOrder").addEventListener("click", function(){
		addItem("orderContainer");
	});
});

(function(global){
	var seq = -1;
	var optionHtml = '';
	var unitPriceArr = [];
	<c:forEach var="book" items="${books}">
		optionHtml += '<option value=${book.bookId}>${book.bookNm}</option>';
		unitPriceArr.push({bookId:'${book.bookId}', unitPrice:'${book.price}'});
	</c:forEach>	
	
	function increment(){
		return ++seq;		
	}
	function addItem(containerId){
		var quantity = 1, seq = increment(), outerDiv = document.createElement("div");
		var firstInnerDiv = document.createElement("div"), secondInnerDiv = document.createElement("div");
		outerDiv.appendChild(firstInnerDiv);
		outerDiv.appendChild(secondInnerDiv);
		var productObj = document.createElement("select");
		productObj.innerHTML = optionHtml;
		productObj.name = `details[\${seq}].bookId`;
		productObj.addEventListener("change", function(){
			var bookPrice = unitPriceArr.filter( item => item.bookId === this.value )[0];
			document.getElementById(`details[\${seq}].unitPrice`).value = bookPrice.unitPrice;
		});
		firstInnerDiv.appendChild(productObj);
		var quantityObj = document.createElement("input");
		quantityObj.name = `details[\${seq}].qty`;
		quantityObj.type = "text";
		quantityObj.value = quantity;
		
		let priceObj = document.createElement("input");
		priceObj.name = `details[\${seq}].unitPrice`;
		priceObj.id = `details[\${seq}].unitPrice`;		
		priceObj.type = "text";
		priceObj.value = unitPriceArr[0].unitPrice;
		
		var incrementBtn = document.createElement("input");
		incrementBtn.type = "button";
		incrementBtn.value = "+";
		incrementBtn.addEventListener("click", function(){
			quantity++;
			quantityObj.value = quantity;
		});
		var decrementBtn = document.createElement("input");
		decrementBtn.type = "button";
		decrementBtn.value = "-";
		decrementBtn.addEventListener("click", function(){
			quantity--;
			quantityObj.value = quantity;
		});
		secondInnerDiv.appendChild(priceObj);
		secondInnerDiv.appendChild(quantityObj);
		secondInnerDiv.appendChild(incrementBtn);
		secondInnerDiv.appendChild(decrementBtn);
		
		document.getElementById(containerId).appendChild(outerDiv);
	}
	global.addItem = addItem;
})(this);
</script>
</head>
<body>
	<header><h1>우리들 서점 상품 주문</h1></header>
	<nav></nav>
	<article class="content-body">
		<section class="content-left">
			<h4>고객 리스트</h4>
			<div>
				<table id="custTbl">
					<thead>
						<tr>
							<th>고객ID</th>
							<th>고객명</th>
							<th>주소</th>
							<th>전화번호</th>							
						</tr>
					<thead>
					<tbody>
						<c:forEach var="customer" items="${customers}">
							<tr>
								<td>${customer.custId}</td>
								<td>${customer.custNm}</td>
								<td>${customer.address}</td>
								<td>${customer.phone}</td>								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</section>
		<section class="content-right">
			<form action="registerOrder" method="post">
				<h4>주문 하기</h4>
				<div style="display: flex; justify-content: center;">
					<input type="text" name="custId" id="custId">
					<input type="text" name="custNm" id="custNm">
					<input type="submit" value="상품주문">
				</div>
				<div style="display: flex; justify-content: flex-end;">
					<input type="button" id="addOrder" value="+">
				</div>
				<div id="orderContainer"></div>
			</form>			
		</section>
	</article>
</body>
</html>