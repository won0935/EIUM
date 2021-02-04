<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<link href="${contextPath}/resources/tab/css/ibtab-style.css"rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js"type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js"type="text/javascript"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
	
<style type="text/css">
.IBbutton {
   font-size: 13px;
   margin-left: 5px;
   border:0;
   background-color: #2B69A0;
   color: white;
   padding: 5px 15px;
   border-radius: 7px;
   text-decoration: none;   
}
.IBbutton:hover {
	background-color: #2C3E50;
}

.rightbuttons{
   margin-top:40px;
   margin:10px;
   position: absolute;
   right: 0px;
}

.title {
    width:100%;
   color: #2C3E50;
   font-weight: bold;
   font-size: 20px;
   padding-left : 30px;
   padding-bottom: 10px;
   padding-top:20px;
   border-top: thin solid #5E5E5E;
   border-bottom: thin dashed #5E5E5E;
   position: absolute;
   top: 50px;

}

.leftbuttons{
   margin-top:40px;
   margin:10px;
   position: absolute;
   left: 0px;
}
#searchBar {
	background: #EBEBEB;
	margin-bottom: 20px;
	border-radius: 5px;
	font-size: 12px;
	border-radius:5px;
	position:relative;
	top:130px;
	width:1500px;
	left:20px;
	padding-top:20px;
	padding-bottom:20px;
}

#searchBar input, select {
	height: 24px;
	border-radius: 3px;
	border: none;
	padding-left: 5px;
	vertical-align: middle;
	text-align: center;
}
.searchBarTitle {
	background: #5E5E5E;
	padding: 4px;
	color: white;
	border-radius: 5px;
	margin: 5px 5px 0 70px;
	vertical-align: middle;
	margin-left: 30px;
	font-size:12px;

}
span{
    background: #5E5E5E;
    padding: 5px 5px;
    color: white;
    border-radius: 5px;
    margin-right:10px;
    font-size:12px;
}
img{
margin-left:5px;
margin-right:5px;
vertical-align: middle;
}
.sheet1{
position:relative;
top:130px;
left:20px;
}
</style>
	
<script>
	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.SetWaitImageVisible(0);
		$("#date").datepicker().datepicker("setDate", new Date());
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3}
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [
			{Header:"NO",Type:"Seq",SaveName:"SEQ",Edit:0,Width:60,Align:"Center"},
			{Header:"사원코드",Type:"Text",SaveName:"employee_CODE",Edit:0,Width:"235",Align:"Center"},
			{Header:"사원명",Type:"Text",SaveName:"employee_NAME",Edit:0,Width:"235",Align:"Center"},
			{Header:"부서",Type:"Text",SaveName:"department_NAME",Edit:0,Width:"235",Align:"Center"},
			{Header:"직책",Type:"Text",SaveName:"duty_NAME",Edit:0,Width:"235",Align:"Center"},
			{Header:"입사일",Type:"Text",SaveName:"employee_JOIN_DATE",Edit:0,Width:"260",Align:"Center"},
			{Header:"년수",Type:"Text",SaveName:"working_YEARS",Edit:0,Width:"235",Align:"Center"},
				];
			IBS_InitSheet(mySheet, initSheet);
			
			mySheet.SetEditableColorDiff(0); //편집불가능한 셀 표시 구분
			/* mySheet.SetSheetHeight(1000); */
		}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction){
		case "search": // 조회
			var param = FormQueryStringEnc(document.frm);
			mySheet.DoSearch("${contextPath}/hm/p0039/searchList.do",param);

			break;
		case "reload": //초기화
			//조회 데이터 삭제
			mySheet.RemoveAll();

			
			$("form").each(function() {  
	            this.reset();
	         });  

			break;
		case "down":
			mySheet.Down2Excel();
			break;
	}
	}
	
	//로우 클릭시
	function mySheet_OnClick(Row, Col){
		var param = "param="+mySheet.GetCellValue(Row,0);
		mySheet2.DoSearch("${contextPath}/hm/p0040/searchEmployee.do",param);

		
	}

	// 조회완료 후 처리할 작업
	function mySheet_OnSearchEnd() {
      
	}
	
	//달력 API
	$(function() {
	  $( ".Datepicker" ).datepicker({
	  	dateFormat: "yymmdd",
	  	showOn: "both", 
	      buttonImage: "${contextPath}/resources/image/icons/icon_calendar.png", 
	      buttonImageOnly: true , 
	       dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	       dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	       monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	       monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});
	});
	
function siteSearch(){
	window.open("${contextPath}/hm/p0040/siteSearch_p01.do", "a", "width=500, height=700, left=100, top=50 location=0");
	
}
function departmentSearch(){
	window.open("${contextPath}/hm/p0040/departmentSearch_p02.do", "a", "width=500, height=700, left=100, top=50 location=0");
}
	
function siteValue(rowData){
	console.log("dddd"+rowData.site_NAME);
	$("#site").val(rowData.site_NAME);
}
function departmentValue(rowData){
	$("#department").val(rowData.department_NAME);
}	
</script>

</head>
<body onload="LoadPage()">
		<form name="frm" >
        <div class="leftbuttons">  
		<button type="button" onclick="doAction('down')" class="IBbutton">엑셀</button>
        </div> 
		<div class="rightbuttons">
		<button type="button" onclick="doAction('reload')" class="IBbutton">초기화</button>
		<button type="button" onclick="doAction('search')" class="IBbutton">조회</button>
		</div>
		
		<div class="title">
			<header>
				<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 인사관리 :
				근속년수현황
			</header>
		</div>

	 
       <div id="searchBar">

		<span class="searchBarTitle">사업장</span><input type="text" id="site"><a href="javascript:siteSearch()" ><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
		<span class="searchBarTitle" style="padding:4 13px 4 13px;">부 서</span><input id="department" type="text" ><a href="javascript:departmentSearch()" ><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
		<span class="searchBarTitle">퇴사자</span><select id="resigner">
		<option value='0'selected>0.제외</option>
		<option value='1'>1.포함</option>
		</select>
		<span class="searchBarTitle">기준일</span><input id="date"type="text"  class="Datepicker">
		<span class="searchBarTitle">년수기준</span><select id="day">
		<option value='0' selected>0.일수 버림</option>
		<option value='1'>1.일수 표시</option>
		</select>
		<input style="margin-left:30px;" type="text" id="yearsOption"><span class="searchBarTitle" style="margin-left:5px;">년이하</span>
		</div>







<div class="sheet1">
<script>
createIBSheet("mySheet", "1500px", "600px");
</script>
</div>
</form>
</body>
</html>