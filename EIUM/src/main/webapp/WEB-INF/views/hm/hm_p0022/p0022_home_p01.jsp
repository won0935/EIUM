<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

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

.left{
position: absolute;
top: 70px;
left: 10px;
width:300px;
}

.rightbuttons {
	margin: 20px;
	position: absolute;
	right: 20px;
	top:10px;
}


#searchBar {
	background: #EBEBEB;
	margin-bottom: 20px;
	border-radius: 5px;
	font-size: 12px;
	border-radius:5px;
	position:relative;
	top:10px;
	width:280px;
	left:10px;
	padding-top:10px;
	padding-bottom:10px;
	
}
span{
    background: #5E5E5E;
    padding: 5px 5px;
    color: white;
    border-radius: 5px;
    margin-right:10px;
    font-size:12px;
    margin-left:20px;
}
#searchBar input, select {
	height: 24px;
	border-radius: 3px;
	border: none;
	padding-left: 5px;
	vertical-align: middle;
	text-align: center;
}

</style>

<meta charset="UTF-8">
<title>사원검색팝업</title>
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
		{Header:"NO",Type:"Seq",Width:70,SaveName:"seq",Align:"Center"},
		{Header:"사원코드",Type:"Text",Width:230,SaveName:"employee_CODE",Align:"Center"},
		{Header:"사원명",Type:"Text",Width:170,SaveName:"employee_NAME",Align:"Center"},
		{Header:"재직상태",Type:"Text",Width:70,SaveName:"work_STATUS_NAME",Align:"Center",Hidden:1},
		{Header:"입사일",Type:"Text",Width:70,SaveName:"employee_JOIN_DATE",Align:"Center",Hidden:1},
		{Header:"사업장명",Type:"Text",Width:70,SaveName:"site_NAME",Align:"Center",Hidden:1},
		{Header:"사업장명",Type:"Text",Width:70,SaveName:"site_CODE",Align:"Center",Hidden:1},
		{Header:"부서명",Type:"Text",Width:70,SaveName:"department_NAME",Align:"Center",Hidden:1},
		{Header:"부서명",Type:"Text",Width:70,SaveName:"department_CODE",Align:"Center",Hidden:1},
		{Header:"직종",Type:"Text",Width:70,SaveName:"job_CLASS_NAME",Align:"Center",Hidden:1},
		{Header:"직급",Type:"Text",Width:70,SaveName:"position_NAME",Align:"Center",Hidden:1},
		{Header:"직책",Type:"Text",Width:70,SaveName:"duty_NAME",Align:"Center",Hidden:1},
		{Header:"직무",Type:"Text",Width:70,SaveName:"job_DIS_NAME",Align:"Center",Hidden:1},
		{Header:"급여형태",Type:"Text",Width:70,SaveName:"pay_TYPE_NAME",Align:"Center",Hidden:1},
		{Header:"호봉",Type:"Text",Width:70,SaveName:"pay_GRADE_NAME",Align:"Center",Hidden:1},
		{Header:"퇴직사유",Type:"Text",Width:70,SaveName:"out_REASON_NAME",Align:"Center",Hidden:1},
		{Header:"퇴직일자",Type:"Text",Width:70,SaveName:"employee_RESIGNATION_DATE",Align:"Center",Hidden:1}
		
		];
	IBS_InitSheet(mySheet,initSheet);
	mySheet.SetEditableColorDiff(1);

	mySheet.SetColEditable(2,0);

}





function doAction(sAction) {
	switch(sAction){
	
	case "search": //조회
		var param=FormQueryStringEnc(document.frm);
		mySheet.DoSearch("${contextPath}/hm/p0022/homeSearch_p03.do",param);
		break;
	
	case "reload": //초기화
		//조회 데이터 삭제
		mySheet.RemoveAll();
		break;

	}
}


function mySheet_OnDblClick(Row,Col){
var rowData = mySheet.GetRowData(Row);
window.opener.popupValue2(rowData);

	self.close();
}

</script>

</head>
<body onLoad="LoadPage()">
	<div class="clear hidden"></div>
	<div class="left">
	<div class="ib_product">
	<script>
		createIBSheet("mySheet", "490px", "620px");
	</script>
	</div>
	</div>
<div id="searchBar">
<form name="frm">
<span>사원명</span><input type="text" id="E_id"  onKeypress="if(event.keyCode==13) {doAction('search'); return false;}">
</form>
</div>
    <div class="rightbuttons">
	  <a href="javascript:doAction('reload')"  class="IBbutton">초기화</a>
	  <a href="javascript:doAction('search')"  class="IBbutton">조회</a>

	</div>

	
</body>
</html>