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
top: 145px;
left: 50px;
}
.rightbuttons {
	margin-top: 50px;
	margin: 20px;
	position: absolute;
	right: 30px;
	top:0px;
}
.right{
position: relative;
top: 150px;
left: 600px;
width: 700px;
}
.right table{
font-size:13px;
font-weight:bold;
position: relative;
left: 40px;
padding: 20px;
}
.right table tr td:nth-child(1){
text-align:right;
}
.right table tr td:nth-child(2){
width: 20px;
height: 25px;
}
.right table tr td:nth-child(3) input{
width: 130px;
height: 20px;
padding-left: 10px;
margin-right:10px;
box-sizing: border-box;
border: 1px solid #CCCCCC;
border-radius: 2px;
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
.sheet1{
position:relative;
top:110px;
left:20px;
border-bottom:2px solid #C3C3C3;
padding-bottom:10px;
width:1540px;
}
.sheet2{
position:relative;
top:120px;
left:20px;
}
#searchBar {
	background: #EBEBEB;
	margin-bottom: 20px;
	border-radius: 5px;
	font-size: 12px;
	border-radius:5px;
	position:relative;
	top:120px;
	width:1540px;
	left:20px;
	padding-top:20px;
	padding-bottom:12px;
	
}
.leftbuttons {
	margin-top: 40px;
	margin: 10px;
	position: absolute;
	left: 0px;
	top: 0px;
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
	margin-left: 100px;
	font-size:12px;
}
</style>

<script>
function LoadPage() {
	mySheet1.SetWaitImageVisible(0);
	mySheet2.SetWaitImageVisible(0);
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
$("#date2").change(function() {
	if($("#date").val()>$("#date2").val()){
		alert("종료일이 시작일 보다 커야합니다.");
		$(this).val("");
		return;
	}
	});
mySheet1.RemoveAll();
//아이비시트 초기화
var initSheet = {};
initSheet.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3, MergeSheet:msHeaderOnly,MouseHoverMode:2}
initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
initSheet.Cols = [
      {Header:"상태|상태",Type:"Status",SaveName:"Status", Align:"Center",Hidden:1},
      {Header:"삭제|삭제",Type:"DelCheck",SaveName:"DEL_CHK", Width:60},
      {Header:"발령일자|발령일자",Type:"Date",SaveName:"appoint_DATE",Align:"Center",Width:150},
      {Header:"발령번호|발령번호",Type:"Text",SaveName:"appoint_CODE",Align:"Center",Width:150},   
      {Header:"제목|제목",Type:"Text",SaveName:"appoint_TITLE",Align:"Center",Width:280},         
      {Header:"마감|마감",Type:"Button",SaveName:"appoint_YN",Align:"Center",Width:150,InsertEdit:0},         
      {Header:"작성자|직원번호",Type:"Popup",SaveName:"masterEmployee_CODE",Align:"Center",Width:150},
      {Header:"작성자|작성자명",Type:"Text",SaveName:"employee_NAME",Align:"Center",Width:150,InsertEdit:0},
      {Header:"작성자|사업장",Type:"Text",SaveName:"site_NAME",Align:"Center",Width:150,InsertEdit:0},
      {Header:"작성자|부서",Type:"Text",SaveName:"department_NAME",Align:"Center",Width:150,InsertEdit:0},
      {Header:"작성자|직책",Type:"Text",SaveName:"duty_NAME",Align:"Center",Width:150,InsertEdit:0}
      ];
   IBS_InitSheet(mySheet1, initSheet);
   mySheet1.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분
   
   mySheet2.RemoveAll();
   //아이비시트 초기화
   var initSheet2 = {};
   initSheet2.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3, FrozenCol:5,MouseHoverMode:2}
   initSheet2.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
   initSheet2.Cols = [
         {Header:"상태",Type:"Status",SaveName:"Status", Align:"Center",Width:60},
         {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",Width:60},
         {Header:"인사발령내역고유번호",Type:"Text",SaveName:"appoint_HISTORY_CODE",Align:"Center",Width:100,"Hidden":1},   
         {Header:"사원코드",Type:"Text",SaveName:"employee_CODE",Align:"Center",Width:100,InsertEdit:0},
         {Header:"사원명",Type:"Popup",SaveName:"employee_NAME",Align:"Center",Width:100},         
         {Header:"시작일자",Type:"Date",SaveName:"start_DATE",Align:"Center",Width:100,Format:"Ymd"},         
         {Header:"종료일자",Type:"Date",SaveName:"end_DATE",Align:"Center",Width:100,Format:"Ymd"},
         {Header:"발령구분",Type:"Combo",SaveName:"hr_APPOINT_INDEX_NAME",Align:"Center",Width:100,"ComboText":"|채용|승진|이동|파견|파견복귀|휴직|복직|퇴직|보직|보직해제|조직개편|계약연장|정직|정직해제", "ComboCode":"|100|1|2|3|4|5|6|7|8|9|10|11|12|13"},
         {Header:"재직상태",Type:"Combo",SaveName:"work_STATUS_NAME",Align:"Center",Width:100,"ComboText":"|재직|파견|휴직|정직|퇴직", "ComboCode":"|J01|J02|J03|J04|J05"},
         {Header:"입사일자",Type:"Date",SaveName:"employee_JOIN_DATE",Align:"Center",Width:100,Format:"Ymd"},
         {Header:"사업장",Type:"Popup",SaveName:"site_NAME",Align:"Center",Width:100},
         {Header:"사업장코드",Type:"Text",SaveName:"site_CODE",Align:"Center",Width:100,Hidden:1},
         {Header:"부서",Type:"Popup",SaveName:"department_NAME",Align:"Center",Width:100},
         {Header:"부서코드",Type:"Text",SaveName:"department_CODE",Align:"Center",Width:100,Hidden:1},
         {Header:"직종",Type:"Combo",SaveName:"job_CLASS_NAME",Align:"Center",Width:100,"ComboText":"|서비스|제조", "ComboCode":"|100|200"},
         {Header:"직급",Type:"Combo",SaveName:"position_NAME",Align:"Center",Width:100,"ComboText":"|대표이사|부사장|전무|상무|이사|부장|차장|과장|생산계장|대리|주임|사원|생산사원|계약직", "ComboCode":"|100|120|150|200|300|400|500|600|650|700|800|900|910|990"},
         {Header:"직책",Type:"Combo",SaveName:"duty_NAME",Align:"Center",Width:100,"ComboText":"|생산부장|생산과장", "ComboCode":"|100|200"},
         {Header:"직무",Type:"Combo",SaveName:"job_DIS_NAME",Align:"Center",Width:100,"ComboText":"|CEO|CTO", "ComboCode":"|100|200"},
         {Header:"급여유형",Type:"Combo",SaveName:"pay_TYPE_NAME",Align:"Center",Width:100},
         {Header:"급여호봉",Type:"Combo",SaveName:"pay_GRADE_NAME",Align:"Center",Width:100,"ComboText":"|1호봉|2호봉|3호봉|4호봉|5호봉|6호봉|7호봉|8호봉|9호봉|10호봉", "ComboCode":"|C01|C02|C03|C04|C05|C06|C07|C08|C09|C10"},
         {Header:"퇴직사유",Type:"Combo",SaveName:"out_REASON_NAME",Align:"Center",Width:100,"ComboText":"|해고|병가", "ComboCode":"|100|200"},
         {Header:"퇴직일자",Type:"Date",SaveName:"resignation_DATE",Align:"Center",Width:100}        
         ];
      IBS_InitSheet(mySheet2,initSheet2);
      mySheet2.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분
}
function mySheet1_OnRowSearchEnd(Row) {
	x = mySheet1.GetCellValue(Row, 5);
    if(mySheet1.GetCellValue(Row, 5) == "마감완료"){
	    mySheet1.SetRowEditable(Row,0);
	}
}
function mySheet2_OnRowSearchEnd(Row) {
    if(x == "마감완료"){
	    mySheet2.SetRowEditable(Row,0);
	}
}
function mySheet1_OnClick(Row,Col){
	var status=mySheet1.GetCellValue(Row,0);
	var finish=mySheet1.GetCellValue(Row,5);
	if(status!="I"&& Col!=5){
	appointCode ="appointCode="+mySheet1.GetCellValue(Row,3);
	mySheet2.DoSearch("${contextPath}/hm/p0022/appointList2.do",appointCode);
	
	}if(finish=="마감완료"){
		
		document.all.option.style.display="none";
	}else{
		document.all.option.style.display="";
	}
	
}
	
	function mySheet1_OnButtonClick(Row,Col){
		 var appointCode ="appointCode="+mySheet1.GetCellValue(Row,3);
		
		if(mySheet1.GetCellValue(Row,Col)=="마감"){
	  
		var result = confirm('마감하시겠습니까?');
		if(result){
		mySheet1.SetCellValue(Row,Col,"마감완료");
		mySheet1.DoSave("${contextPath}/hm/p0022/saveData3.do",{Quest:0});
		
		magam(appointCode);
			alert('작업이 완료되었습니다');
		}
		}else{
			alert("이미 마감되었습니다.");
		}
		
	}
	
	function magam(appointCode){
	
		var dataMap = JSON.parse(mySheet2.GetSearchData("${contextPath}/hm/p0022/appointList3.do",appointCode));
		console.log(dataMap);
		for(var i in dataMap.Data){
			var send = {"Status":"U","employee_JOIN_DATE":dataMap.Data[i].join_DATE,"department_CODE":dataMap.Data[i].department_CODE,"job_CLASS_CODE":dataMap.Data[i].job_CLASS_CODE,"position_CODE":dataMap.Data[i].position_CODE,"duty_CODE":dataMap.Data[i].duty_CODE,"job_DIS_CODE":dataMap.Data[i].job_DIS_CODE,"pay_TYPE_CODE":dataMap.Data[i].pay_TYPE_CODE,"pay_GRADE_CODE":dataMap.Data[i].pay_GRADE_CODE,"out_REASON_CODE":dataMap.Data[i].out_REASON_CODE,"employee_CODE":dataMap.Data[i].employee_CODE,"work_STATUS_CODE":dataMap.Data[i].work_STATUS_CODE,"resignation_DATE":dataMap.Data[i].resignation_DATE}
			$.ajax({
			    url:'${contextPath}/hm/p0022/saveData4.do', //request 보낼 서버의 경로
			    type:'post', // 메소드(get, post, put 등)
			    data:send, //보낼 데이터
			    success: function(data) {
			        //서버로부터 정상적으로 응답이 왔을 때 실행
			    },
			    error: function(err) {
			        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
			    }
			});
		}
		var send="";
			
	}
function doAction(sAction) {
	switch (sAction) {
	case "search":
		var param = FormQueryStringEnc(document.frm);
	    mySheet1.DoSearch("${contextPath}/hm/p0022/appointList.do", param);
	    mySheet2.RemoveAll();
		break;
	case "reset":
		mySheet1.RemoveAll();
		mySheet2.RemoveAll();
		$("form").each(function() {  
            this.reset();
		});
		
	    break;
	case "insert1":
		mySheet1.DataInsert(-1);
		break;
	case "insert2":
		mySheet2.DataInsert(-1);
		break;
	case "save1": //저장
		mySheet1.DoSave("${contextPath}/hm/p0022/saveData1.do");		
		break;
	case "save2": //저장
		mySheet2.DoSave("${contextPath}/hm/p0022/saveData2.do",appointCode);		
		break;
	case "down":
		mySheet1.Down2ExcelBuffer(true);
		mySheet1.Down2Excel();
		mySheet2.Down2Excel();
		mySheet2.Down2ExcelBuffer(false);
		break;
	}
}
function goPopup(){
	window.open("${contextPath}/hm/p0022/homeInit_p03.do", "a","width=342,height=520,resizable = no, scrollbars = no");
}
function popupValue(emplyCode,emplyName){
	$("#masterEmpl").val(emplyName);
	$("#masterEmplCode").val(emplyCode);
	
	
	
}
function popupValue2(rowData){
	
	mySheet2.SetRowData(mySheet2.GetSelectRow(),rowData);
	
}
function popupValue3(rowData){
	
	mySheet1.SetRowData(mySheet1.GetSelectRow(),rowData);
	
}
function popupValue4(rowData){
	
	mySheet2.SetRowData(mySheet2.GetSelectRow(),rowData);
	
}
function popupValue5(rowData){
	
	mySheet2.SetRowData(mySheet2.GetSelectRow(),rowData);
	
}
	
function mySheet2_OnPopupClick(Row,Col) {  	
	
	if(Col==4){
		window.open("${contextPath}/hm/p0022/homeInit_p01.do", "a", "width=500,height=705,resizable = no, scrollbars = no");
	}
	 if(Col==10){
		 window.open("${contextPath}/hm/p0022/homeInit_p04.do", "a", "width=503,height=710,resizable = no, scrollbars = no");
	 }
	 if(Col==12){
		var x=mySheet2.GetCellValue(Row,10);

		window.open("${contextPath}/hm/p0022/homeInit_p05.do?name="+x, "a",  "width=350,height=520,resizable = no, scrollbars = no");

	 }
}
function mySheet1_OnPopupClick(Row,Col){
	if(Col==6){

	window.open("${contextPath}/hm/p0022/homeInit_p02.do", "a","width=510,height=526,resizable = no, scrollbars = no" );

	}
}
function mySheet1_OnSaveEnd(){
	var param = FormQueryStringEnc(document.frm);
    mySheet1.DoSearch("${contextPath}/hm/p0022/appointList.do", param);
    mySheet2.RemoveAll();
}
</script>
<meta charset="UTF-8">
<title>인사발령</title>
</head>
<body onload="LoadPage()">

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 등록정보관리 :
			인사발령
		</header>
	</div>
	<div class="rightbuttons">
		<a href="javascript:doAction('search')" class="IBbutton">조회</a> <a
			href="javascript:doAction('reset')" class="IBbutton">초기화</a>
	</div>
	<div class="leftbuttons">
		<button type="button" onclick="doAction('down')" class="IBbutton">엑셀</button>
	</div>
	<div id="searchBar">
		<form name="frm">

			<span class="searchBarTitle">발령일</span> <input id="date" type="text" class="Datepicker" readonly> ~ <input id="date2" type="text" class="Datepicker" readonly>
			<span class="searchBarTitle" >제목</span> <input id="title" type="text"  style="width:300px;"> 
			<span class="searchBarTitle">작성자</span><input id="masterEmpl" type="text"> <input id="masterEmplCode" type="hidden"> <a href="javascript:goPopup()"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
	
		</form>
	</div>
	<div class="sheet1">
		<div style="padding:5px;">
		<span>발령제목</span>
			<a href="javascript:doAction('insert1')" class="IBbutton" style="position:relative;left:1335;">입력</a>	
			<a href="javascript:doAction('save1')" class="IBbutton" style="position:relative;left:1335;">저장</a>
		</div>
		<script type="text/javascript">
			createIBSheet("mySheet1", "1600px", "200px");
		</script>  
	</div>


	<div class="sheet2">
			<div style="padding:5px;">
			<span>발령후내역</span>
			<a href="javascript:doAction('insert2')" class="IBbutton" style="position:relative;left:1320;">입력</a>
			<a href="javascript:doAction('save2')" class="IBbutton"style="position:relative;left:1320;">저장</a>
			</div>
		<script type="text/javascript">
			createIBSheet("mySheet2", "1542px", "300px");
		</script>
	</div>


</body>
</html>