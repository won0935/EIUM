<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>부서검색팝업</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>  
<script>


function LoadPage(){
	mySheet.RemoveAll();
	//아이비시트 초기화
	var initSheet = {};
	initSheet.Cfg={SearchMode:smLazyLoad,ToolTip:1};
	initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
	initSheet.Cols=[
		{Header:"NO",Type:"Seq",Width:60,SaveName:"seq",Align:"Center"},
		{Header:"사업장코드",Type:"Text",Width:150,SaveName:"site_CODE",Align:"Center"},
		{Header:"사업장명",Type:"Text",Width:170,SaveName:"site_NAME",Align:"Center"},
		{Header:"부서코드",Type:"Text",Width:150,SaveName:"department_CODE",Align:"Center"},
		{Header:"부서명",Type:"Text",Width:170,SaveName:"department_NAME",Align:"Center"},
		];
	IBS_InitSheet(mySheet,initSheet);
	mySheet.SetEditableColorDiff(1);

	mySheet.SetColEditable(2,0);
	var param=FormQueryStringEnc(document.frm);
	mySheet.DoSearch("${contextPath}/sm/p0003/searchList.do",param);
}






function doAction(sAction) {
	switch(sAction){
	
	case "search": //조회
		var param=FormQueryStringEnc(document.frm);
		mySheet.DoSearch("${contextPath}/sm/p0003/searchList.do",param);
		break;
	
	case "reload": //초기화
		//조회 데이터 삭제
		mySheet.RemoveAll();
		break;

	}
}


function mySheet_OnDblClick(Row,Col){
 	var rowData=mySheet.GetRowData(Row);
	
	 window.opener.departmentValue(rowData);
	self.close();
}




</script>
<style type="text/css">

.IBbutton {
	font-size: 13px;
	margin-left: 5px;
	background-color: #2B69A0;
	color: white;
	padding: 5px 15px;
	border-radius: 7px;
	text-decoration: none;
}
.IBbutton:hover {
	background-color: #2C3E50;
}
#searchBar {
	background: #EBEBEB;
	padding: 15px 30px;
	margin-bottom: 30px;
	border-radius: 5px;
	font-size: 12px;
	/*여기서 중간 텀띄우기*/
}
.left{
	position: relative;
	top: 10px;
	left: 30px;
	width: 600px;
}
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
	position: absolute;
	top: 50px;
}

.kindofsearch{
	background: #5E5E5E;
	padding: 5px 5px;
	color: white;
	border-radius: 5px;
}
</style>

</head>
<body onLoad="LoadPage()">
	<form name="frm">
	<div class="clear hidden"></div>
	
	<div class="left">

 
<div style="position: absolute; top: 0px; left: 0px;">
	<div>
	<script>
		createIBSheet("mySheet", "100%", "550px");
	</script>
	</div>
	</div>
	</div>
</form>
	
</body>
</html>