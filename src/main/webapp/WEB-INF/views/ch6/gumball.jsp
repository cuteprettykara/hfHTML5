<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
<title>마이티 검볼</title>
<meta charset="utf-8">
<script>
window.onload = init;

function init() {
	getSales();
}

function getSales() {
//	var url = "http://gumball.wickedlysmart.com/html5/ch6/getJSON";
	var url = "http://localhost:8080/html5/ch6/getJSON";
	var request = new XMLHttpRequest();
	request.open("GET", url);
	request.onload = function() {
		if (request.status == 200) {
			updateSales(request.responseText);
		} else {
			console.log(request.status);
		}
	};
	request.send(null);
}

function updateSales(responseText) {
	var salesDiv = document.getElementById("sales");
	var sales = JSON.parse(responseText);
	for (var idx in sales) {
		var sale = sales[idx];
		var div = document.createElement("div");
		div.setAttribute("class", "saleItem");
		div.innerHTML = sale.name + "에서 검볼을 " + sale.sales + "개 팔았습니다.";
		salesDiv.appendChild(div);
	}
}
</script>
<style>
body {
	margin-left: 40px;
	margin-right: 40px;
}
div#sales {
	background-color: #d9d9d9;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	margin: 10px 0px 0px 0px;
	padding: 0px;
	border: 1px solid #d9d9d9;
}
div.saleItem {
	font-family: Verdana, Helvetica, sans-serif;
	color: #434343;
	padding: 10px;
}
div.saleItem:nth-child(2n) {
	background-color: #fafafa;
}
div.saleItem:first-child {
	-webkit-border-top-left-radius: 6px;
	-webkit-border-top-right-radius: 6px;
	border-top-left-radius: 6px;
	border-top-right-radius: 6px;
}
div.saleItem:last-child {
	-webkit-border-bottom-left-radius: 6px;
	-webkit-border-bottom-right-radius: 6px;
	border-bottom-left-radius: 6px;
	border-bottom-right-radius: 6px;
}
</style>
</head>
<body>

<h1>마이티 검볼 판매</h1>

<div id="sales">
</div>

</body>
</html>

