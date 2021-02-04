<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>

<script type="text/javascript">
var pageheightoffset = 200; //시트높이 계산용

//sheet 기본설정
function LoadPage(){
   mySheet.SetWaitImageVisible(0);
	
   mySheet.RemoveAll();
   mySheet2.RemoveAll();
   //아이비시트 초기화
   var initSheet = {};
   initSheet.Cfg={SearchMode:smLazyLoad,ToolTip:1,MouseHoverMode:2};
   initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:10,HeaderCheck:1};
   initSheet.Cols=[
	    {"Header":"상태","SaveName":"sStatus","Type":"Status","Align":"Center","Width":60},
	    {"Header":"삭제","SaveName":"DEL_CHK","Type":"DelCheck","Width":60},
		{"Header":"권한코드","SaveName":"authority_CODE","Type":"Text","Width":150,"Align":"Center","UpdateEdit":0, "KeyField":1 },
		{"Header":"권한명","SaveName":"authority_NAME","Type":"Text","Width":150,"Align":"Center"}
      ];
   
   var initSheet2 = {};
   initSheet2.Cfg={SearchMode:smLazyLoad, ToolTip:1,  MergeSheet:msPrevColumnMerge + msHeaderOnly};
   initSheet2.HeaderMode = {Sort:1,ColMove:1,ColResize:10,HeaderCheck:1};
   initSheet2.Cols=[
	    {"Header":"상태","SaveName":"sStatus","Type":"Status","Align":"Center","Width":60,"ColMerge":0},
		{"Header":"사용가능한메뉴","SaveName":"access_GRANT","Type":"CheckBox","Width":50,"Align":"Center","ColMerge":0},
		{"Header":"사용가능한메뉴","SaveName":"menu_NAME","Type":"Text","Width":300,"Align":"Center","ColMerge":0},
		{"Header":"조회권한","SaveName":"access_RANGE","Type":"Combo", "ComboText":"사업장|부서|사원", "ComboCode":"사업장|부서|사원", "Width":150,"ColMerge":0,"Align":"Center"},
		{"Header":"추가","SaveName":"access_INSERT","Type":"CheckBox","Width":120,"ColMerge":0},
		{"Header":"수정","SaveName":"access_UPDATE","Type":"CheckBox","Width":120,"ColMerge":0},
		{"Header":"삭제","SaveName":"access_DELETE","Type":"CheckBox","Width":120,"ColMerge":0}
      ];
   

   
   IBS_InitSheet(mySheet,initSheet);
   IBS_InitSheet(mySheet2,initSheet2);
   mySheet.SetEditableColorDiff(1);
   mySheet2.SetEditableColorDiff(1);
   mySheet.SetActionMenu("엑셀 파일 저장");
   mySheet2.SetColEditable(2,0);
   mySheet.SetSelectionMode(1);
}

function mySheet_OnClick(Row){
    x = "x=" + mySheet.GetCellValue(Row, 2);
	mySheet2.DoSearch("${contextPath}/sm/p0005_01/search.do", x);
}
  
function doAction(sAction){
   switch(sAction){
   case "search":
      mySheet.DoSearch("${contextPath}/sm/p0005/searchList.do");
      break;
   case "reset":
      mySheet.RemoveAll();
      mySheet2.RemoveAll();
      break;
   case "save1":
	  mySheet.DoSave("${contextPath}/sm/p0005/saveData.do", x);
	  mySheet2.RemoveAll();
      break;
   case "save2":
		  mySheet2.DoSave("${contextPath}/sm/p0005_01/saveData.do", x);
		  mySheet2.RemoveAll();
	      break;
   case "insert":
	      var row = mySheet.DataInsert(-1);
	      break;
   case "down":
		  mySheet.Down2ExcelBuffer(true);  
		  mySheet.Down2Excel();
		  mySheet2.Down2Excel();
		  mySheet.Down2ExcelBuffer(false); 
		  break;
   }
  
   
}

function mySheet_OnSaveEnd(code, msg) {
	if (msg != "") {
		alert(msg);
		//번호 다시 매기기
		//mySheet.ReNumberSeq();
	}
}

function mySheet2_OnSaveEnd(code, msg) {
	if (msg != "") {
		alert(msg);
		//번호 다시 매기기
		//mySheet.ReNumberSeq();
	}
}
	</script>
	<style type="text/css">
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
.right{
 position: relative;
 width:830px;
top: -570px;
left: 390px; 
padding: 0 0 0 30px;
border-left: 2px solid #C3C3C3;
margin-left: 15px;
}
	
	</style>
</head>
<body onload="LoadPage()">
	<form name="frm">
	
	<div class="leftbuttons">
	<button type="button" onclick="doAction('down')" class="IBbutton">엑셀</button>
    </div> 
    
    <div class="rightbuttons">
	<button type="button" onclick="doAction('reset')" class="IBbutton">초기화</button>
	<button type="button" onclick="doAction('search')" class="IBbutton">조회</button>
	<button type="button" onclick="doAction('insert')" class="IBbutton">추가</button>
	<button type="button" onclick="doAction('save1')" class="IBbutton">코드저장</button>
	<button type="button" onclick="doAction('save2')" class="IBbutton">메뉴저장</button>
	</div>
	
	<div class="title"> 
    <header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 등록정보관리 : 권한관리</header>
    </div>
    
<div style="position:absolute; top:140px; left:65px;width: 1500px;">
<script type="text/javascript">
createIBSheet("mySheet", "1500px", "710px");
</script>
</div>

<div class="right" style="position:absolute; top:140px; left:500px; width: 1500px;">
<script>
createIBSheet("mySheet2", "1500px", "710px");
</script>
</div>

	</form>
</body>