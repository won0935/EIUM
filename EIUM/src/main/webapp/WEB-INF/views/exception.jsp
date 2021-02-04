<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
<style>
#temp {
    position: absolute;
    top:-100px;
    left:150px;
    width: 1300px;
    height: auto;
    min-height: 100%;
    overflow: hidden;
}
.wrp_temp {
    margin: 0 auto;
    width: 900px;
    height: 600px;
    text-align: center;
}



</style>

<script type="text/javascript">

function goMain(){
	if(window.opener){
		if(window.opener.closed){
			top.location.href="/EIUM/main.do";
		}else{
			window.opener.top.location.href="/EIUM/main.do";
			self.close();
		}
	}else{
		top.location.href="/EIUM/main.do";
	}
}

</script>

<meta charset="UTF-8">
<title>exception</title>
</head>
<body>
	<section id="temp">
	<div class="wrp_temp">
    <img src="/EIUM/resources/image/img_notfound.png">
    </div>
    </section>
    <a style="position:absolute;top:580px;left:700px;" onClick="goMain()"><img src="/EIUM/resources/image/img_notfound02.png" alt="메인으로가기버튼"></a>
</body>
</html>