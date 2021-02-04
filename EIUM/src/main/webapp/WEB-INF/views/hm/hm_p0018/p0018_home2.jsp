<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사등록</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	/*Sheet 기본 설정 */
	
	$(document).ready(function(){
	       $("#eduCode").keypress(function (e) {
	        if (e.which == 13){
	        	var param = FormQueryStringEnc(document.frm);
	        	
	        	$.ajax({

				url : "${contextPath}/hm/p0018/autocomplete.do",//목록을 조회 할 url

				type : "POST",
				
				data:param,
				
				dataType : "JSON",

				success : function(data) {
			
				if(data.Data.length==1){
					
					$("#eduCode").val(data.Data[0].employee_TRAINING_CODE);
					$("#eduName").val(data.Data[0].employee_TRAINING_NAME);
				}else{
					window.open("${contextPath}/hm/p0018/home2_p01.do?eduCode="+$("#eduCode").val(), "a", "width=600, height=500, left=100, top=50");
				}
				
				},

				error : function(jqxhr, status, error) {

					alert("에러");

				}

			}); 

	               
	        }
	    });
	});
	
	function setEdu(){
	
	 eduName=document.getElementById("PeduName").value;
	 eduCode=document.getElementById("PeduCode").value;
	$("#eduCode").val(eduCode);
	$("#eduName").val(eduName);
	
	LoadPage();
};
function setPopupValue(){
	
	 Pname=document.getElementById("Pname").value;
	 Pcode=document.getElementById("Pcode").value;
	 mySheet2.SetCellValue(row,col,Pcode);
	 mySheet2.SetCellValue(row,col+1,Pname);
	
};


function LoadPage() {
		mySheet.SetWaitImageVisible(0);
		mySheet2.SetWaitImageVisible(0);
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:0}
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:1,HeaderCheck:1};
		initSheet.Cols = [

				{Header:"교육코드",Type:"Text",SaveName:"employee_TRAINING_CODE", Align:"Center",Width:100,UpdateEdit:0},
				{Header:"교육명",Type:"Text",SaveName:"employee_TRAINING_NAME", Align:"Center",Width:100,UpdateEdit:0},			
				{Header:"시작일",Type:"Date",SaveName:"employee_TRAINING_START_DATE", Edit: 1, Align:"Center",Format:"Ymd",Width:100,UpdateEdit:0},			
				{Header:"종료일",Type:"Date",SaveName:"employee_TRAINING_END_DATE",Format:"Ymd",Width:100,UpdateEdit:0,Align:"Center"},			
				{Header:"교육일수",Type:"Text",SaveName:"employee_TRAINING_DATE_COUNT",Width:100,UpdateEdit:0,Align:"Center"},
				{Header:"교육목적",Type:"Text",SaveName:"employee_TRAINING_GOAL",Width:100,UpdateEdit:0,Align:"Center"},
				{Header:"교육장소",Type:"Text",SaveName:"employee_TRAINING_LOCATION",Width:100,UpdateEdit:0,Align:"Center"},			
				{Header:"담당강사",Type:"Text",SaveName:"employee_TRAINING_TEACHER",Width:100,UpdateEdit:0,Align:"Center"},			
				{Header:"교육기관",Type:"Text",SaveName:"employee_TRAINING_INSITUTION",Width:100,UpdateEdit:0,Align:"Center"},			
				{Header:"교육시간",Type:"Text",SaveName:"employee_TRAINING_TIME",Width:100,UpdateEdit:0,Align:"Center"},			
				{Header:"대상인원",Type:"Text",SaveName:"employee_TRAINING_PEOPLE",Width:100,UpdateEdit:0,Align:"Center"},			

				{Header:"교육명",Type:"Text",SaveName:"employee_TRAINING_NAME", Align:"Center",Width:100},			
				{Header:"시작일",Type:"Date",SaveName:"employee_TRAINING_START_DATE", Edit: 1, Align:"Center",Format:"Ymd",Width:100},			
				{Header:"종료일",Type:"Date",SaveName:"employee_TRAINING_END_DATE",Format:"Ymd",Width:100, Align:"Center"},			
				{Header:"교육일수",Type:"Text",SaveName:"employee_TRAINING_DATE_COUNT",Width:100, Align:"Center"},
				{Header:"교육목적",Type:"Text",SaveName:"employee_TRAINING_GOAL",Width:100, Align:"Center"},
				{Header:"교육장소",Type:"Text",SaveName:"employee_TRAINING_LOCATION",Width:100, Align:"Center"},			
				{Header:"담당강사",Type:"Text",SaveName:"employee_TRAINING_TEACHER",Width:100, Align:"Center"},			
				{Header:"교육기관",Type:"Text",SaveName:"employee_TRAINING_INSITUTION",Width:100, Align:"Center"},			
				{Header:"교육시간",Type:"Text",SaveName:"employee_TRAINING_TIME",Width:100, Align:"Center"},			
				{Header:"대상인원",Type:"Text",SaveName:"employee_TRAINING_PEOPLE",Width:100, Align:"Center"},			
				{Header:"사내외구분",Type:"Text",SaveName:"employee_TRAINING_IN_OUT",Width:100, Align:"Center"},			


				];
			IBS_InitSheet(mySheet, initSheet);

			; //편집불가능한 셀 표시 구분
			/* mySheet.SetSheetHeight(1000); */

			
			
			
			mySheet2.RemoveAll();
			//아이비시트 초기화
			var initSheet2 = {};
			initSheet2.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3}
			initSheet2.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
			initSheet2.Cols = [
					{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center",Width:60},
					{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",Align:"Center",Width:60},
					{Header:"사원코드",Type:"Popup",SaveName:"employee_CODE",Align:"Center",Width:100},
					{Header:"사원명",Type:"Text",SaveName:"employee_NAME",Align:"Center",InsertEdit:0,Width:100},			
					{Header:"부서",Type:"Text",SaveName:"department_NAME",InsertEdit:0,Width:100,Align:"Center"},			
					{Header:"직책",Type:"Text",SaveName:"position_NAME",InsertEdit:0,Width:100,Align:"Center"},
					{Header:"교육코드",Type:"Text",SaveName:"EMPLOYEE_TRAINING_CODE",Hidden:1,Align:"Center"}	

					];
				IBS_InitSheet(mySheet2,initSheet2);
			

				
				mySheet2.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분
				/* mySheet.SetSheetHeight(1000); */
		}


	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction){

		case "reload": //초기화
			//조회 데이터 삭제
			mySheet.RemoveAll();
			mySheet2.RemoveAll();
			$("#eduCode").val("");
			$("#eduName").val("");
			break;
		case "save": //저장

			var param ="param="+mySheet.GetCellValue(1,0);
			mySheet2.DoSave("${contextPath}/hm/p0018/emplyoeeListsaveData.do",param);	

			break;	
		case "search":

			if($("#eduCode").val() != '' ){
			var param = FormQueryStringEnc(document.frm);
			mySheet.DoSearch("${contextPath}/hm/p0018/searchList.do",param);
			mySheet2.DoSearch("${contextPath}/hm/p0018/emplyoeeListSearch.do",param);
			}else{
				alert("교육코드를 입력하세요.");
			}

		break;
		case "insert": //신규행 추가
			var row = mySheet2.DataInsert(-1);
			break;
		case "down":
			mySheet.Down2ExcelBuffer(true);
			mySheet.Down2Excel();
			mySheet2.Down2Excel();
			mySheet2.Down2ExcelBuffer(false);
			break;
		}
	
	
	}
	

	
	// 조회완료 후 처리할 작업
	function mySheet_OnSearchEnd() {
      
	}
	
	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code,msg){
		if(msg != ""){
			alert(msg);	
			//번호 다시 매기기
            //mySheet.ReNumberSeq();
		}	
	}
	
	  
	  function showPopup() { window.open("${contextPath}/hm/p0018/home2_p01.do", "a", "width=600, height=500, left=100, top=50");
	  
	  }

	  function mySheet2_OnPopupClick(Row,Col){
			if(Col=="2"){
				
				window.open("${contextPath}/hm/p0018/home2_p02.do", "a", "width=550, height=700, left=100, top=50"); 

				}
	  }
		function employeeValue(rowData){
			mySheet2.SetRowData(mySheet2.GetSelectRow(),rowData);
		}
		
	
</script>

<style type="text/css">
.IBbutton {
    font-size: 13px;
    margin-left: 5px;
    border: 0;
    background-color: #2B69A0;
    color: white;
    padding: 5px 15px;
    border-radius: 7px;
    text-decoration: none;
}

.IBbutton:hover {
	background-color: #2C3E50;
}

.left {
	position: absolute;
	top: 145px;
	left: 50px;
}

.rightbuttons {
	margin-top: 50px;
	margin: 20px;
	position: absolute;
	right: 30px;
}

.right {
	position: relative;
	top: 150px;
	left: 600px;
	width: 700px;
	background: #EDF0F5;
	border-radius: 10px;
}

.right table {
	font-size: 13px;
	font-weight: bold;
	position: relative;
	left: 40px;
	padding: 20px;
}

.right table tr td:nth-child(1) {
	text-align: right;
}

.right table tr td:nth-child(2) {
	width: 20px;
	height: 25px;
}

.right table tr td:nth-child(3) input {
	width: 130px;
	height: 20px;
	padding-left: 10px;
	margin-right: 10px;
	box-sizing: border-box;
	border: 1px solid #CCCCCC;
	border-radius: 2px;
}


.rightbuttons {
	margin-top: 50px;
	margin: 20px;
	position: absolute;
	right: 5px;
	boder-right:1px solid #C3C3C3;
	top:0px;
	}
.leftbuttons {
    margin-top: 40px;
    margin: 10px;
    position: absolute;
    left: 0px;
    top: 5px;
}
.title {
	width: 1635px;
	color: #2C3E50;
	font-weight: bold;
	font-size: 20px;
	padding-left: 30px;
	padding-bottom: 10px;
	padding-top: 20px;
	border-top: thin solid #5E5E5E;
	position: absolute;
	top: 50px;
}
#searchBar {
	background: #EBEBEB;
	padding: 10px 30px;
	margin-bottom: 20px;
	border-radius: 5px;
	font-size: 12px;
	border-radius:5px;
	position:absolute;
	top:65px;
	width:1500px;
	left:20px;
	
}


.right {
	position: relative;
	top: 113px;
	left: 1050px;
	width: 450px;
	height:505px;
	background: #EDF0F5;
	border-radius: 10px;

}
.left {
	position: absolute;
	top: 120px;
	left: 20px;
	padding-right:18px;
	border-right:2px solid #C3C3C3;
	
}
span{
    background: #5E5E5E;
    padding: 5px 5px;
    color: white;
    border-radius: 5px;
    margin-right:10px;
}
img{
margin-left:5px;
margin-right:5px;
vertical-align: middle;
}
#eduCode{
    height: 22px;
    border-radius: 3px;
    border: none;
    padding-left: 5px;
    vertical-align: middle;
    text-align: center;
    width:200px;
}
#eduName{
border-radius:3px;
width:200px;
}

</style>

</head>
<body onload="LoadPage()">





	<div class="left">
		<script>
			//IBSheet 객체 생성 (객체 id, 너비, 높이)
			createIBSheet("mySheet", "1000px", "600px");
			
		</script>
	</div>
	<div class="title"></div>

	
	<div class="right">
		<script>
			//IBSheet 객체 생성 (객체 id, 너비, 높이)
			createIBSheet("mySheet2", "550px", "600px");
			
		</script>
	</div>





	<div class="rightbuttons">
		<a href="javascript:doAction('reload')" class="IBbutton">초기화</a> <a
			href="javascript:doAction('search')" class="IBbutton">조회</a> <a
			href="javascript:doAction('insert')" class="IBbutton">사원추가</a> <a
			href="javascript:doAction('save')" class="IBbutton">저장</a>
	</div>
	
	<div class="leftbuttons">
		<button type="button" onclick="doAction('down')" class="IBbutton">엑셀</button>
	</div>

	<div id="searchBar">
		<form name="frm">
			<span>교육코드</span>
			<input type="text" id="eduCode" value="" onChange="LoadPage()">
			<a href="javascript:showPopup();"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a> 
			<input type="text" id="eduName" disabled>
		</form>
	</div>
	
	<input type="hidden" id="PeduCode">
	<input type="hidden" id="PeduName">
	<input type="hidden" id="Pcode">
	<input type="hidden" id="Pname">

</body>
</html>