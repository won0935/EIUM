<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.mtz.monthpicker.js"></script>
<script type="text/javascript">
	var pageheightoffset = 200; //시트높이 계산용
	
	function setSite(){
		site_code=document.getElementById("Poption_code").value;
		site_name=document.getElementById("Poption_name").value;
		$("#Poption_code_temp").val($("#searchList option").index($("#searchList option:selected")));
	};

	//sheet 기본설정
	function LoadPage() {
		mySheet.SetWaitImageVisible(0); 
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = { SearchMode : smLazyLoad, ToolTip : 1, MouseHoverMode:2};
		initSheet.HeaderMode = { Sort : 1, ColMove : 1, ColResize : 10, HeaderCheck : 1 };
		initSheet.Cols = [ 
			 	{Header:"NO",Type:"Seq",SaveName:"NUMBER",Width:60, Align:"Center" },
			 	{Header:"사원코드",Type:"Text",SaveName:"employee_CODE",  Align:"Center", Edit: 0,Hidden:1},	
		        {Header:"사원명",Type:"Text",SaveName:"employee_NAME", Width:180,  Align:"Center", Edit: 0},	
		        {Header:"어학시험명",Type:"Text",SaveName:"language_NAME", Width:180, Align:"Center", Edit: 0},
				{Header:"유효기간 시작일",Type:"Date",SaveName:"start_DATE", Width:190, Align:"Center", Edit: 0},
				{Header:"유효기간 만료일",Type:"Date",SaveName:"end_DATE", Width:190, Align:"Center", Edit: 0},
				{Header:"점수",Type:"Text",SaveName:"grade", Width:190, Align:"Center", Edit: 0},
				{Header:"백분율",Type:"Text",SaveName:"percent", Width:200, Align:"Center", Edit: 0},
				{Header:"주관기간",Type:"Text",SaveName:"institute", Width:210, Align:"Center", Edit: 0},
				{Header:"어학시험코드",Type:"Text",SaveName:"language_CODE", Width:200, Align:"Center", Edit: 0, Hidden:1}
		];

		IBS_InitSheet(mySheet, initSheet);
		mySheet.SetEditableColorDiff(1);
		mySheet.SetActionMenu("엑셀 파일 저장");
		mySheet.SetSelectionMode(1);
		mySheet.SetSheetHeight(550);
		mySheet.SetColEditable(0, 0);
		mySheet.SetColEditable(1, 0);
		mySheet.SetColEditable(2, 0);
		mySheet.SetColEditable(3, 0);
		mySheet.SetColEditable(4, 0);
		mySheet.SetColEditable(5, 0);
		mySheet.SetColEditable(6, 0);
		mySheet.SetColEditable(7, 0);
		mySheet.SetColEditable(8, 0);
		mySheet.SetColEditable(9, 0);
	}

	function doAction(sAction) {
		switch (sAction) {
		case "search":
			var param = FormQueryStringEnc(document.frm);
		    mySheet.DoSearch("${contextPath}/hm/p0029/searchList_LA.do", param);
			break;
		case "reset":
			mySheet.RemoveAll();
			$("form").each(function() {  
	            this.reset();
	         });  
			break;
		case "down":
			var param = { Mode : -1 };
			mySheet.Down2Excel(param);
	        break;
		}
	}
	
	 //조회조건 팝업(과거)
	 function showPopup_option() { //조회조건
		 var selectItem = $("#searchList option").index($("#searchList option:selected"));
		 
		 if(selectItem == "0"){
			 var url = '${contextPath}/hm/p0029/search_Site.do';
			 window.open(url, "a", "width=600, height=500, left=100, top=50");
		 }else if(selectItem == "1"){
			 var url = '${contextPath}/hm/p0029/search_Dept.do';
			 window.open(url, "a", "width=600, height=500, left=100, top=50");
		 }
	  
	  }
	 function departmentValue(rowData){
		 $("#Poption_name").val(rowData.department_NAME);
		 $("#Poption_code").val(rowData.department_CODE);
		 $("#Poption_code_temp").val($("#searchList option").index($("#searchList option:selected")));
	 }

	 //팝업 도움 코드
	 function findPopup(tablename){
	      var pop = window.open("findPopup.do?command="+tablename,"findPopup","width=342,height=520,resizable = no, scrollbars = no"); 

	   }
	 function findPopup(tablename, index){
	      var pop = window.open("findPopup.do?command="+tablename+"&index="+index,"findPopup","width=342,height=520,resizable = no, scrollbars = no"); 

	   }
</script>

<style type="text/css">
.title {
    width:97%;
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
.rightbuttons{
   margin-top:40px;
   margin:10px;
   position: absolute;
   right: 0px;
}
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
#searchBar {
	background: #EBEBEB;
	padding: 15px 0px;
	margin-bottom: 30px;
	border-radius: 5px;
	font-size: 12px;
	/*여기서 중간 텀띄우기*/
}
.searchBarTitle {
	background: #5E5E5E;
	padding: 4px;
	color: white;
	border-radius: 5px;
	margin: 0 10px 0 80px;
	vertical-align: middle;
}
.left{
	position: relative;
	top: 80px;
	left: 30px;
	width: 1403px;
}
.center{
	position: relative;
	top: 60px;
	left: 30px;
	width: 870px;
	/* 670px; */
}
#searchBar input, select {
	height: 24px;
	border-radius: 3px;
	border: none;
	padding-left: 5px;
	vertical-align: middle;
}

#searchBar img {
	margin: 0 10px 0 3px;
	vertical-align: middle;
}
.otherline{
	padding: 10px 10px 0px 10px;
}
.checks{
	display: inline-block;
}
.checks input[type="checkbox"] {  /* 실제 체크박스는 화면에서 숨김 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0
}

.checks input[type="checkbox"] + label {
  display: inline-block;
  position: relative;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
}

.checks input[type="checkbox"] + label:before {  /* 가짜 체크박스 */
  content: ' ';
  display: inline-block;
  width: 21px;  /* 체크박스의 너비를 지정 */
  height: 21px;  /* 체크박스의 높이를 지정 */
  line-height: 21px; /* 세로정렬을 위해 높이값과 일치 */
  margin: -2px 8px 0 0;
  text-align: center; 
  vertical-align: middle;
  background: #fafafa;
  border: 1px solid #5E5E5E;
  border-radius : 3px;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}

.checks.etrans input[type="checkbox"] + label {
  padding-left: 30px;
}
.checks.etrans input[type="checkbox"] + label:before {
  position: absolute;
  left: 0;
  top: 0;
  margin-top: -14px;
  opacity: .6;
  box-shadow: none;
  border-color: #5E5E5E;
  -webkit-transition: all .12s, border-color .08s;
  transition: all .12s, border-color .08s;
}

.checks.etrans input[type="checkbox"]:checked + label:before {
  position: absolute;
  content: "";
  width: 10px;
  top: -5px;
  left: 5px;
  border-radius: 0;
  opacity:1; 
  background: transparent;
  border-color:transparent #5E5E5E #5E5E5E transparent;
  border-top-color:transparent;
  border-left-color:transparent;
  -ms-transform:rotate(45deg);
  -webkit-transform:rotate(45deg);
  transform:rotate(45deg);
}

.no-csstransforms .checks.etrans input[type="checkbox"]:checked + label:before {
  /*content:"\2713";*/
  content: "\2714";
  top: 0;
  left: 0;
  width: 21px;
  line-height: 21px;
  color: #6cc0e5;
  text-align: center;
  border: 1px solid #6cc0e5;
}

label{
	display: inline-block;
}
.ui-datepicker{ font-size: 12px; width: 160px; }
.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
/* #searchBar img {vertical-align: middle; padding: 0px 5px 0px 2px; } */
	
	</style>

</head>
<body onload="LoadPage()">
 		<div class="leftbuttons">
		<button type="button" onclick="doAction('down')" class="IBbutton">엑셀</button>
        </div> 
        
        <div class="rightbuttons">
		<button type="button" onclick="doAction('reset')" class="IBbutton">초기화</button>
		<button type="button" onclick="doAction('search')" class="IBbutton">조회</button>
		</div>

		<div class="title"> 
        </div>
	<form name="frm">
       
        
        <div class="left">
        <div id="searchBar">
       <span class="searchBarTitle" style="margin-left:110px;margin-right: 10px;padding: 4px 10px 4px 10px;">조회조건</span>
				<select id="searchList" >
					<option selected >1. 사업장</option>
					<option >2. 부서</option>
				</select>
				<input type="text" id="Poption_code" style="width: 60px;"><a href="javascript:showPopup_option();"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
				<input type="text" id="Poption_name">
				<span class="searchBarTitle" style="margin-left:110px;">재직구분</span>
				<input type="text" id="WORK_STATUS_CODE" style="width: 60px;"><a href="javascript:findPopup('WORK_STATUS');"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
				<input type="text" id="WORK_STATUS_NAME" style="width: 60px;">
				<span class="searchBarTitle" style="margin-left:135px;margin-right:10px;padding:4px 22px 4px 22px">직급</span>
				<input type="text" id="POSITION_CODE" style="width: 60px;"><a href="javascript:findPopup('POSITION');"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
				<input type="text" id="POSITION_NAME" style="width: 60px;">
				<div class="otherline">
             	<span class="searchBarTitle" style="margin-left:100px;margin-right:10px;padding:4px 4px 4px 4px">어학시험명</span>
				<input type="text" id="LANGUAGE_CODE" style="width: 60px;"><a href="javascript:findPopup('LANGUAGE');"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
				<input type="text" id="LANGUAGE_NAME">
				<span class="searchBarTitle" style="margin-left:570px;margin-right:13px;padding:4px 4px 4px 4px">퇴사자포함</span><div class="checks etrans"><input type="checkbox" id ="resigner" value="1"><label for="resigner"></label></div>
				</div>
           
        </div>
		</div>

		<div class="center">
			<script type="text/javascript">
				createIBSheet("mySheet", "1500px", "500px");
			</script>
		</div>
      <input type="hidden" id="Poption_code_temp" >
      

	</form>
</body>