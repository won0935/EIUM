<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>header</title>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="${contextPath}/resources/sheet/ibleaders.js"></script>
<script src="${contextPath}/resources/sheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/sheet/ibsheet.js"></script>
<link href="${contextPath}/resources/tab/css/ibtab-style.css"
	rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script>
function printClock() {
	var clock = document.getElementById("systemClock"); // 출력할 장소 선택
	var currentDate = new Date(); // 현재시간
	var dd = currentDate.getDate();
	var mm = (currentDate.getMonth() + 1);

	if (dd < 10) {
		dd = '0' + dd;
	}
	if (mm < 10) {
		mm = '0' + mm;
	}
	var calendar = currentDate.getFullYear() + "-" + mm + "-" + dd; // 현재 날짜
	var amPm = 'AM'; // 초기값 AM
	var currentHours = addZeros(currentDate.getHours(), 2);
	var currentMinute = addZeros(currentDate.getMinutes(), 2);
	var currentSeconds = addZeros(currentDate.getSeconds(), 2);
	if (currentHours >= 12) { // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
		amPm = 'PM';
		currentHours = addZeros(currentHours - 12, 2);
	}
	clock.innerHTML = calendar + " " + currentHours + ":" + currentMinute
			+ ":" + currentSeconds + " " + amPm; //날짜를 출력해 줌

	setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출

}

function addZeros(num, digit) { // 자릿수 맞춰주기
	var zero = '';
	num = num.toString();
	if (num.length < digit) {
		for (i = 0; i < digit - num.length; i++) {
			zero += '0';
		}
	}
	return zero + num;
}
$(document).ready(function(){printClock();});

</script>
<style type="text/css">
.currentInfo {
	padding: 0px 0px 95px 10px;
	color: #212121;
	font-size: 12px;
	position: absolute;
	top: 2px;
}

.currentInfo #headerinfo {
	margin-right: 15px;
}

.currentInfo #headerinfo b {
	font-weight: normal;
}

.homelogin {
	padding: 0px 0px 95px 10px;
	color: #212121;
	font-size: 15px;
	position: absolute;
	top: 5px;
	right: 15px;
}

.homelogin #headerinfo {
	margin-right: 15px;
	margin-left: 15px;
}
.homelogin A{
cursor: pointer;
text-decoration: none;
}

.homelogin a:link {
	color: #212121;
}

.homelogin a:visited {
	color: #212121;
}

.homelogin a:active {
	bacolor: #FF6000;
}

.homelogin a:hover {
	color: #FF6000;
}

#cc {
	width: 100%;
	height: 900px;  
	position: absolute;
	top: 30px;
}
</style>
<meta charset="UTF-8">
<title>헤더</title>  
</head>
<body>

	<div class="currentInfo">
		<span id="headerinfo" class="user">
		<spring:message code="lo_myemployee_name" /> : ${sessionScope.login.employee_name}</span> <span
			id="headerinfo" class="company"><spring:message code="lo_mycompany" /> : ${sessionScope.login.company_name}</span> <span
			id="headerinfo" class="logindate"><spring:message code="lo_mytime" /> : <b id="systemClock"></b>
		</span>
	</div>

	<div class="homelogin">
		<a href="javascript:tabMenu.goToFirstTab()"><span id="headerinfo" class="icon"><i class="fa fa-home"> Home</i></span></a> 
		<a href="${contextPath}/logout.do"><span id="headerinfo"class="icon"><i class="fa fa-share-square-o"> Logout</i></span></a>
	</div>

	<div id="cc">
		<div id="tabBar" class="ib-tab-tabs"></div>
		<div id="tabContents" class="ib-tab-contents"></div>
	</div>
</body>
</html>