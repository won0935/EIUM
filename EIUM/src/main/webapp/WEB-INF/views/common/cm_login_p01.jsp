<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	overflow: hidden; background : black;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: #043F77;
}

.find-form {
	background-color: white;
	padding: 5px;
	padding-bottom: 65px;
	height: auto;
	width: 350px;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.find-form h3 {
	text-align: left;
	color: #333;
}

.find-form .logo {
	width: 40px;
	height: auto;
}

.find-container form {
	padding-left: 5%;
	padding-right: 5%;
	padding-bottom: 5%;
}

.find-form .btnSubmit {
	font-weight: 600;
	color: #fff;
	background-color: #0062cc;
}

.find-form .form-control {
	border: 0px;
	width: 250px;
	height: 30px;
	padding-left: 10px;
	border-bottom: #0062cc 1px solid;
	margin-bottom: 5px;
	outline: none;
}

.find-form .Forget {
	font-size: 12px;
	color: #0062cc;
	font-weight: 600;
	padding-left: 20px;
	text-decoration: none;
}

.find-form .Forget:hover {
	text-decoration: underline;
}

.btnSubmit {
	float: right;
	width: 25%;
	margin-top: 40px;
	padding: 1.5%;
	border: none;
	cursor: pointer;
	padding: 1.5%;
}

.btnSubmit:hover {
	background: #002780;
}
</style>

<meta charset="UTF-8">
<title>Welcome EIUM</title>
</head>

<body>


	<div class="find-container">
		<div class="find-form">
			<form action="findIdNPwd.do" method="get">
				<h3>
					<img class="logo" alt="logo"
						src="${contextPath}/resources/image/EIUM_logo.png"> EIUM
				</h3>

				<c:choose>
					<c:when test="${command eq 'id'}">
						<h3>
							<spring:message code="findId" text="아이디 찾기" />
						</h3>
					</c:when>
					<c:when test="${command eq 'pwd'}">
						<h3>
							<spring:message code="findPwd" text="비밀번호 찾기" />
						</h3>
					</c:when>
				</c:choose>

				<div class="form-group">

					<c:choose>
						<c:when test="${command eq 'pwd'}">
							<input type="text" name="EMPLOYEE_ID" class="form-control" placeholder="ID" value="" />
							<br>
						</c:when>
					</c:choose>

					<input type="text" name="EMPLOYEE_CODE" class="form-control" placeholder="Employee Code" value="" /><br>
					<input type="text" name="EMAIL" class="form-control" placeholder="E-Mail" value="" /><br>

					<input type="submit" class="btnSubmit" value="<spring:message code="lo_next" />" />
				</div>


			</form>
		</div>
	</div>
</body>
</html>