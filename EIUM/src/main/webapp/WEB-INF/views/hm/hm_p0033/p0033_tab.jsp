<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<style>

.title {
		width: 100%;
	color: #2C3E50;
	font-weight: bold;
	font-size: 20px;
	padding-left: 30px;
	padding-bottom: 10px;
	padding-top: 20px;
	border-top: thin solid #5E5E5E;
	border-bottom: thin dashed #5E5E5E;
	top: 50px;

}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<link href="${contextPath}/resources/tab/css/ibtab-style.css"
	rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js"
	type="text/javascript"></script>
<script>
function PageLoad(){
	var tabBar = document.getElementById("tab"),
	contents = document.getElementById("tab_contents");
	createIBTab(tabBar,contents,"myTabs",{
		widthTabBar: "100%",
		heightContents:($(window).height()-200) + "px"
    });
	
	myTabs.setOptions({
		tabs:[{
			title:"고과현황",
			style:{
				icon:{

				},
				btnClose:false
			}
		},{
			title:"상벌현황",
			style:{
				icon:{

				},
				btnClose:false
			}
		}
		],
		contents:[{
			type:"iframe",	
			contents:"searchInit2.do"
		},{
			type:"iframe",	
			contents:"searchInit3.do"
		}
		]
	});
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body  onload='PageLoad()'>
		
	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 인사관리 :
			인사고과/상벌현황
		</header>
	</div>
  	  		
       <div class="main_content">


             <div id="tab" class="ib-tab-tabs">
             </div>
             
             
             <div id="tab_contents" class="ib-tab-contents">
             </div>
        </div>
                <!--main contents-->

</body>
</html>