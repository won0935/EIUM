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
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<link href="${contextPath}/resources/tab/css/ibtab-style.css"
	rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js"
	type="text/javascript"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script language="javascript">
function PageLoad(){
	var tabBar = document.getElementById("tab"),
	contents = document.getElementById("tab_contents");
	createIBTab(tabBar,contents,"myTabs",{
		widthTabBar: "100%",
		heightContents:($(window).height()-130) + "px"
    });
	
	myTabs.setOptions({
		tabs:[{
			title:"교육",
			style:{
				icon:{

				},
				btnClose:false
			}
		},{
			title:"출장",
			style:{
				icon:{

				},
				btnClose:false
			}
		},{
			title:"자격/면허",
			style:{
				icon:{

				},
				btnClose:false
			}
		},{
			title:"어학시험",
			style:{
				icon:{

				},
				btnClose:false
			}
		}
		],
		contents:[{
			type:"iframe",	
			contents:"searchInit_TN.do" //교육 탭
		},{
			type:"iframe",	
			contents:"searchInit_BN.do" //출장 탭
		},{
			type:"iframe",	
			contents:"searchInit_LI.do" //자격/면허 탭
		},{
			type:"iframe",	
			contents:"searchInit_LA.do" //어학시험 탭
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
			사원정보현황
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