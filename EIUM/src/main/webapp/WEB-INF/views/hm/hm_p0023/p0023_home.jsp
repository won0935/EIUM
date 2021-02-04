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
	

<style>
.rightbuttons {
	margin-top: 50px;
	margin: 20px;
	position: absolute;
	right: 30px;
	top:0px;
}
div.sheet_search{
border:1px solid#dbdbdb;
background:#f9f9f9;
padding:4px 4px 4px  10px;
overflow:auto;
}

.Mandatory:after {
    color: #e32;
    content: "*";
    display: inline;
    font-weight: bold;
    font-size: 12px;
}
.bbit-dp-input {
    width: 100px;
    height: 18px;
    padding-left: 4px;
}
div.sheet_title {
    clear: both;
    overflow: auto;
}
div.sheet_title li.txt {
    float: left;
    font-weight: bold;
    height: 35px;
    line-height: 35px;
}
div.sheet_title li.btn {
    float: right;
    height: 28px;
    padding-top: 7px;
}
ul, ol {
    list-style: none;
}

.IBbutton {
	font-size: 13px;
	margin-left: 5px;
	background-color: #2B69A0;
	color: white;
	padding: 5px 15px;
	border-radius: 7px;
	text-decoration: none;
	border:0px;
}


.IBbutton:hover {
	background-color: #2C3E50;
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
	top: 50px;
	position:relative;

}
.leftbuttons {
	margin-top: 40px;
	margin: 10px;
	position: absolute;
	left: 0px;
	top: 10px;
}
.sheet1{
position:relative;
top:70px;
left:20px;
}
#searchBar {
	background: #EBEBEB;
	margin-bottom: 20px;
	border-radius: 5px;
	font-size: 12px;
	border-radius:5px;
	position:relative;
	top:70px;
	width:1590px;
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
	margin: 0 5px 0 70px;
	vertical-align: middle;
	margin-left: 50px;
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

</style>

<script>
function LoadPage() {
	mySheet1.SetWaitImageVisible(0);
//달력 API
$(function() {
  $( ".Datepicker" ).datepicker({
  	dateFormat: "yy-mm-dd",
  	showOn: "both", 
      buttonImage: "${contextPath}/resources/image/icons/icon_calendar.png", 
      buttonImageOnly: true , 
       dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
       dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
       monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
       monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
});
});

mySheet1.RemoveAll();
//아이비시트 초기화
var initSheet = {};
initSheet.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3, MergeSheet:msHeaderOnly}
initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
initSheet.Cols = [
	  {Header:"NO",Type:"Seq",SaveName:"seq",Align:"Center",Width:60},
      {Header:"인사발령내역고유번호",Type:"Text",SaveName:"appoint_HISTORY_CODE",Align:"Center",Width:100,"Hidden":1},   
      {Header:"사원코드",Type:"Text",SaveName:"employee_CODE",Align:"Center",Width:80,InsertEdit:0},
      {Header:"사원명",Type:"Text",SaveName:"employee_NAME",Align:"Center",Width:80},         
      {Header:"시작일자",Type:"Date",SaveName:"start_DATE",Align:"Center",Width:100,Format:"Ymd"},         
      {Header:"종료일자",Type:"Date",SaveName:"end_DATE",Align:"Center",Width:100,Format:"Ymd"},
      {Header:"발령구분",Type:"Text",SaveName:"hr_APPOINT_INDEX_NAME",Align:"Center",Width:100},
      {Header:"재직상태",Type:"Text",SaveName:"work_STATUS_NAME",Align:"Center",Width:100},
      {Header:"입사일자",Type:"Text",SaveName:"employee_JOIN_DATE",Align:"Center",Width:100,Format:"Ymd"},
      {Header:"사업장",Type:"Text",SaveName:"site_NAME",Align:"Center",Width:100},
      {Header:"사업장코드",Type:"Text",SaveName:"site_CODE",Align:"Center",Width:100,Hidden:1},
      {Header:"부서",Type:"Text",SaveName:"department_NAME",Align:"Center",Width:100},
      {Header:"부서코드",Type:"Text",SaveName:"department_CODE",Align:"Center",Width:100,Hidden:1},
      {Header:"직종",Type:"Text",SaveName:"job_CLASS_NAME",Align:"Center",Width:90},
      {Header:"직급",Type:"Text",SaveName:"position_NAME",Align:"Center",Width:90},
      {Header:"직책",Type:"Text",SaveName:"duty_NAME",Align:"Center",Width:90},
      {Header:"직무",Type:"Text",SaveName:"job_DIS_NAME",Align:"Center",Width:100},
      {Header:"급여유형",Type:"Text",SaveName:"pay_TYPE_NAME",Align:"Center",Width:100},
      {Header:"급여호봉",Type:"Text",SaveName:"pay_GRADE_NAME",Align:"Center",Width:100},
      {Header:"퇴직사유",Type:"Text",SaveName:"out_REASON_NAME",Align:"Center",Width:100}
      
      ];
   IBS_InitSheet(mySheet1, initSheet);
   mySheet1.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분


}


function doAction(sAction) {
	switch (sAction) {
	case "search":
		var param = FormQueryStringEnc(document.frm);
	    mySheet1.DoSearch("${contextPath}/hm/p0023/searchList.do", param);
		break;
	case "reset":
		mySheet1.RemoveAll();
		$("form").each(function() {  
            this.reset();
		});
        break;
	case "down":
		mySheet1.Down2Excel();
		break;

	}
	

}

function goPopup(){
	window.open("${contextPath}/hm/p0023/departmentSearch_p01.do", "a", "width=500, height=700, left=100, top=50 location=0");
}

function goPopup2(){
	window.open("${contextPath}/hm/p0023/employeeSearch_p02.do", "a", "width=500, height=700, left=100, top=50 location=0");
}
function employeeValue(rowData){
	$("#employee").val(rowData.employee_NAME)
	
}
function departmentValue(rowData){
	$("#department").val(rowData.department_NAME)
	
}

</script>
<meta charset="UTF-8">
<title>인사발령조회</title>
</head>
<body onload="LoadPage()">

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 등록정보관리 :
			인사발령조회
		</header>
	</div>
<form name="frm" >


<div id="searchBar">
<span class="searchBarTitle">발령일시작일</span>

<input id="date"type="text"  class="Datepicker">
~
<input  id="date2"type="text" class="Datepicker">

<span class="searchBarTitle">발령구분</span>
<select id = "appoint_index"  class="" style="width: 160px">
<option value="" selected >전체</option>
<option value="채용" >채용</option>
<option value="승진">승진</option>
<option value="이동">이동</option>
<option value="파견">파견</option>
<option value="파견복귀">파견복귀</option>
<option value="휴직">휴직</option>
<option value="복직">복직</option>
<option value="퇴직">퇴직</option>
<option value="보직">보직</option>
<option value="보직해제">보직해제</option>
<option value="조직개편">조직개편</option>
<option value="계약연장">계약연장</option>
<option value="정직">정직</option>
<option value="정직해제">정직해제</option>
</select>

<span class="searchBarTitle">부서</span>
<input id="department" type="text" >
<a href="javascript:goPopup()" ><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>

<span class="searchBarTitle">직원</span>
<input id="employee" type="text" >
<input id="EmplCode" type="hidden">
<a href="javascript:goPopup2()" ><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>

</div>
</form>
	<div class="rightbuttons">
		<a href="javascript:doAction('reset')" class="IBbutton">초기화</a> <a
			href="javascript:doAction('search')" class="IBbutton">조회</a>
	</div>
	<div class="leftbuttons">
		<button type="button" onclick="doAction('down')" class="IBbutton">엑셀</button>
	</div>
	<div class="sheet1">
		<script type="text/javascript">
			createIBSheet("mySheet1", "1600px", "600px");
		</script>
	</div>
</body>
</html>