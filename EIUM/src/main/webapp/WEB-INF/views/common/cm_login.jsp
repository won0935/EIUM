<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 
<!DOCTYPE html>
<html>
<head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
function fn_findID(){
    var url = "findIdNPwd.do?command=id";
    var name = "Find My ID";
    var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    window.open(url, name, option);
}
function fn_findPWD(){
    var url = "findIdNPwd.do?command=pwd";
    var name = "Find My PWD";
    var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    window.open(url, name, option);
}

$(document).ready(function(){
	 
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $('[name="employee_id"]').val(key); 
     
    if($('[name="employee_id"]').val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $('[name="employee_id"]').val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $('[name="employee_id"]').keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $('[name="employee_id"]').val(), 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>


<style type="text/css">
.login-container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.login-form {
	background-color: white;
	padding: 5px;
	padding-bottom: 65px;
	height: auto;
	width: 400px;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.login-form h3 {
	text-align: left;
	color: #333;
}

.login-form .logo {
	width: 40px;
	height: auto;
}

.login-container form {
	padding-left: 5%;
	padding-right: 5%;
	padding-top: 5%;
	padding-bottom: 5%;
}

.login-form .btnSubmit {
	height:30px;
	font-weight: 600;
	color: #fff;
	background-color: #0067B8;
}

.login-form .form-control {
	border: 0px;
	width: 315px;
	height: 30px;
	padding-left: 10px;
	border-bottom: #0067B8 1px solid;
	margin-bottom: 5px;
	outline: none;
}

.login-form .Forget {
	font-size: 12px;
	color: #0067B8;
	font-weight: 600;
	padding-left: 20px;
	text-decoration: none;
}

.login-form .Forget:hover {
	text-decoration: underline;
}

.btnSubmit {
	float: right;
	width: 25%;
	margin-top: 30px;
	padding: 1.5%;
	border: none;
	cursor: pointer;
	padding: 1.5%;
}

.btnSubmit:hover {
	background: #002780;
}

#video {
	position: absolute;
	top: 0px;
	left: 0px;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -1;
}

body {
	overflow: hidden
}

#languages{
position: absolute;
top: 10px;
right: 15px;
}
#languages .language{
	height: auto;
	width: 25px;
	margin-left: 2px;  
}
#languages .language:hover{
	transform:scale(1.2);
}
.checks{
	color: #0067B8;
    vertical-align: middle;
    font-weight: 600;
    position: relative;  
	top:-38px;
    font-size: 12px;
    left: 260px;
}
.login-form h4 {
	color: #0067B8;
	margin-top: 0px;
	margin-left: 8px;
    margin-bottom: 0px;
    font-size: 14px;
}

.checks input[type="checkbox"] {
    position: absolute; 
    width: 1px;
    height: 1px; 
    padding: 0; 
    margin: -1px; 
    overflow: hidden; 
    clip:rect(0,0,0,0); 
    border: 0 
} 
.checks input[type="checkbox"] + label {
    display: inline-block;
    position: relative; 
    cursor: pointer; 
    -webkit-user-select: none; 
    -moz-user-select: none; 
    -ms-user-select: none; 
}
 .checks input[type="checkbox"] + label:before {
    content: ' '; 
    display: inline-block; 
    width: 15px; 
    height: 15px;  
    line-height: 15px;
    margin: -2px 8px 0 0; 
    text-align: center; 
    vertical-align: middle; 
    background: #fafafa; 
    border: 1px solid #cacece; 
    border-radius : 3px; 
    box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}
.checks input[type="checkbox"] + label:active:before, .checks input[type="checkbox"]:checked + label:active:before {
    box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
}
.checks input[type="checkbox"]:checked + label:before {
    content: '\2714';
    color: #99a1a7; 
    text-shadow: 1px 1px #fff;
    background: #e9ecee; 
    border-color: #adb8c0; 
    box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);
}


</style>

<meta charset="UTF-8">
<title>Welcome EIUM</title>
</head>

<body>
<script>

$(function(){
    var responseMessage ="<%=request.getParameter("result")%>" ;
	var message = "아이디와 비밀번호를 확인하여 주십시오." ;
    if(responseMessage != "null" ){
        alert(message);
    }
});
</script>
	<video id="video" preload="auto" autoplay="autoplay" loop="loop" muted="muted" >
		<source src="${contextPath}/resources/image/init_background.mp4">
	</video>
	


	<div class="login-container">
			<div class="login-form">
				<form name="form"  method="post" action="${contextPath}/LoginCheck.do">
				<h3><img class="logo" alt="logo" src="${contextPath}/resources/image/EIUM_logo.png"> EIUM</h3>
				
					<h3 id="languages" >
						<img class="language" alt="KO" src="${contextPath}/resources/image/icons/icon_korea.png" onclick="location.href='login.do?lang=ko'">
						<img class="language" alt="EN" src="${contextPath}/resources/image/icons/icon_usa.png" onclick="location.href='login.do?lang=en'">
						<img class="language" alt="CN" src="${contextPath}/resources/image/icons/icon_china.png" onclick="location.href='login.do?lang=cn'">
					</h3>
				 	
				 	
				 	<h3><spring:message code="login"  text="로그인" /></h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID" value="" name="employee_id"/><br>
						<input type="password" class="form-control" placeholder="Password" value="" name="employee_password"/><br> 
				 		
						<a onclick="fn_findID()" class="Forget"><spring:message code="findId"/></a><br> 
						<a onclick="fn_findPWD()" class="Forget"><spring:message code="findPwd"/></a>
					 	<div class="checks"> <input type="checkbox" id="idSaveCheck"> <label for="idSaveCheck"><spring:message code="lo_saveID"/></label> </div>
						<input type="submit" class="btnSubmit" value="<spring:message code="lo_next"/>" />  
					</div>



				</form>
			</div>
	</div>
</body>
</html>