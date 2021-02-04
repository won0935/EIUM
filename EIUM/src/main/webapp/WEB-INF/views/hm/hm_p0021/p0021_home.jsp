<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육평가</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	/*Sheet 기본 설정 */
	
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
		initSheet.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3}
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [

				{Header:"교육코드",Type:"Text",SaveName:"employee_TRAINING_CODE", Align:"Center",Width:120},
				{Header:"교육명",Type:"Text",SaveName:"employee_TRAINING_NAME",Align:"Center",Width:120},			
				{Header:"시작일",Type:"Text",SaveName:"employee_TRAINING_START_DATE", Edit: 1, Align:"Center",Format:"Ymd",Width:130},			
				{Header:"종료일",Type:"Text",SaveName:"employee_TRAINING_END_DATE",Format:"Ymd",Width:130,Align:"Center"},			
				{Header:"교육일수",Type:"Text",SaveName:"employee_TRAINING_DATE_COUNT",Width:120,Align:"Center"},
				{Header:"교육목적",Type:"Text",SaveName:"employee_TRAINING_GOAL",Width:200,Align:"Center"},
				{Header:"교육장소",Type:"Text",SaveName:"employee_TRAINING_LOCATION",Width:120,Align:"Center"},			
				{Header:"담당강사",Type:"Text",SaveName:"employee_TRAINING_TEACHER",Width:120,Align:"Center"},			
				{Header:"교육기관",Type:"Text",SaveName:"employee_TRAINING_INSITUTION",Width:120,Align:"Center"},			
				{Header:"교육시간",Type:"Text",SaveName:"employee_TRAINING_TIME",Width:120,Align:"Center"},
				{Header:"대상인원",Type:"Text",SaveName:"employee_TRAINING_PEOPLE",Width:120,Align:"Center"},	
				{Header:"사내외구분",Type:"Text",SaveName:"employee_TRAINING_IN_OUT",Width:120,Align:"Center"},	

				];
			IBS_InitSheet(mySheet, initSheet);
			if($("#eduCode").val()!=""){
			var param = FormQueryStringEnc(document.frm);
			mySheet.DoSearch("${contextPath}/hm/p0018/searchList.do",param);
			}
			mySheet.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분
			/* mySheet.SetSheetHeight(1000); */

			
			
			
			mySheet2.RemoveAll();
			//아이비시트 초기화
			var initSheet2 = {};
			initSheet2.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3}
			initSheet2.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
			initSheet2.Cols = [
					{Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center",Width:60},
					{Header:"사원코드",Type:"Text",SaveName:"employee_CODE", Align:"Center",Width:60},
					{Header:"사원명",Type:"Text",SaveName:"employee_NAME", Align:"Center",InsertEdit:0,Width:80},	
					{Header:"부서",Type:"Text",SaveName:"department_NAME",InsertEdit:0,Width:80,Align:"Center"},
					{Header:"직책",Type:"Text",SaveName:"position_NAME",InsertEdit:0,Width:80,Align:"Center"},
					{Header:"이수여부",Type:"Combo",SaveName:"finish_YN",InsertEdit:0,"ComboText":"Y|N", "ComboCode":"Y|N",Width:80,Align:"Center"},
					{Header:"출석점수",Type:"Text",SaveName:"attendence_SCORE",InsertEdit:0,Width:80,Align:"Center"},
					{Header:"태도점수",Type:"Text",SaveName:"attitude_SCORE",InsertEdit:0,Width:80,Align:"Center"},
					{Header:"평가점수",Type:"Text",SaveName:"score",InsertEdit:0,Width:80,Align:"Center"},
					{Header:"합계",Type:"Text",SaveName:"total",InsertEdit:0,CalcLogic:"|6|+|7|+|8|",Width:80,Align:"Center"},
					{Header:"교육평가",Type:"Text",SaveName:"assessment_DESC",InsertEdit:0,Width:110,Align:"Center"},

					];
				IBS_InitSheet(mySheet2,initSheet2);
				if($("#eduCode").val()!=""){
				var param = FormQueryStringEnc(document.frm);
				mySheet2.DoSearch("${contextPath}/hm/p0021/eduScoreSearch.do",param);
				}

				mySheet2.FitColWidth();
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

			var param = FormQueryStringEnc(document.frm);
			mySheet2.DoSave("${contextPath}/hm/p0021/saveData.do",param);	
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
	
	  
	  function showPopup() { window.open("${contextPath}/hm/p0018/home2_p01.do", "a", "width=600, height=500");
	  
	  }
	  
	function mySheet2_OnDblClick(Row,Col){
			var status=mySheet2.GetCellValue(Row,0);

			row=Row;
			col=Col;
			
			if(Col=="2"&&status=="I"){
				
			window.open("${contextPath}/hm/p0018/home2_p02.do", "a", "width=500, height=700, left=100, top=50"); 

			}

		
	}
	
</script>

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
.left{
position: absolute;
top: 145px;
left: 50px;
}
.rightbuttons{
   margin-top:40px;
   margin:10px;
   position: absolute;
   right: 0px;
   top:0px;
}
.right{
position: relative;
top: 150px;
left: 600px;
width: 700px;

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
#searchBar {
	background: #EBEBEB;
	padding: 10px 30px;
	margin-bottom: 20px;
	border-radius: 5px;
	font-size: 12px;
	border-radius:5px;
	position:absolute;
	top:120px;
	width:1480px;
	left:60px;
	padding-top:20px;
	padding-bottom:20px;
	
	
}
.leftbuttons{
   margin-top:40px;
   margin:10px;
   position: absolute;
   left: 0px;
   top:0px;
}
.sheet1{
position:relative;
top:190px;
left:55px;
border-bottom:2px solid #C3C3C3;
padding-bottom:15px;
width:1540px;
}
.sheet2{
position:relative;
top:205px;
left:55px;
width:1540px;
}
span{
    margin-left: 110px;
	background: #5E5E5E;
    padding: 5px 5px;
    color: white;
    border-radius: 5px;
    margin-right: 10px;
    vertical-align: middle;
}
img{
margin-left:5px;
margin-right:5px;
vertical-align: middle;
}
#frm a{

	text-decoration: none;
}
#frm input{
height: 22px;
	border-radius: 3px;
	border: none;
	padding-left:5px;
	vertical-align: middle;
}


</style>

</head>
<body onload="LoadPage()">

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 등록정보관리 :
			교육평가
		</header>
	</div>



	<div class="sheet1">
		<script>
			//IBSheet 객체 생성 (객체 id, 너비, 높이)
			createIBSheet("mySheet", "1600px", "300px");
		</script>
	</div>

	<div class="sheet2">
		<script>
			createIBSheet("mySheet2", "1545px", "300px");
		</script>
	</div>




	<div class="rightbuttons">
	  <a href="javascript:doAction('reload')"  class="IBbutton">초기화</a>
	  <a href="javascript:doAction('save')" class="IBbutton">저장</a>
	</div>
  	<div class="leftbuttons">
		<button type="button" onclick="doAction('down')" class="IBbutton">엑셀</button>
	</div>
	<div id="searchBar">
	<form id="frm" name="frm" >
	<span>교육코드</span><input type="text" id="eduCode" value="" onChange="LoadPage()"style="width: 150px;" placeholder="교육코드">
	 <input type="text" id="eduName" placeholder="교육명" style="width: 200px;"readonly ><a href="javascript:showPopup();" ><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
	</form>
	</div>
	
	<input type="hidden" id="PeduCode">
	<input type="hidden" id="PeduName">
	<input type="hidden" id="Pcode">
	<input type="hidden" id="Pname">

</body>
</html>