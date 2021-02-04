<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

<script language="javascript">
var pageheightoffset = 200; //시트높이 계산용


//sheet 기본설정
function LoadPage(){
	   mySheet.SetWaitImageVisible(0);
   
   mySheet.RemoveAll();
   //아이비시트 초기화
   var initSheet = {};
   initSheet.Cfg={SearchMode:smLazyLoad,ToolTip:1,MouseHoverMode:2};
   initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:12,HeaderCheck:1};
   initSheet.Cols=[
	   {Header:"상태",SaveName:"sStatus",Type:"Status",align:"Center" ,Width:60, Align:"Center"},
	   {Header:"삭제",SaveName:"DEL_CHK",Type:"DelCheck" ,Width:60},
	   {Header:"사원코드",SaveName:"employee_code",Type:"Text", Width:180, Align:"Center" , KeyField:1, UpdateEdit:"0"},
	   {Header:"사원명",SaveName:"employee_name",Type:"Text", Align:"Center", Width:150, KeyField:1 },
	   {Header:"회사코드", Type:"Popup", SaveName:"company_code",Width:180, Align:"Center" , KeyField:1},
	   {Header:"회사명",SaveName:"company_name",Type:"Text",Width:170, KeyField:1, Align:"Center", UpdateEdit:"0", InsertEdit:"0" },
	   {Header:"사용자여부",Type:"Combo", Width:110, Align:"Center", SaveName:"employee_available_yn", ComboText:"Y|N", ComboCode:"Y|N"},
	   {Header:"아이디",SaveName:"employee_id", Align:"Center",type:"Text",Width:180, KeyField:1, UpdateEdit:"0"},
	   {Header:"암호",SaveName:"employee_password", Align:"Center",type:"Text", KeyField:1, Width:180},
	   {Header:"전화번호",Type:"Text", Align:"Center", Align:"Center", SaveName:"contact", Format:"PhoneNo", Width:180},
	      ];
   
  
   IBS_InitSheet(mySheet,initSheet);
   mySheet.SetEditableColorDiff(1);
   mySheet.SetActionMenu("엑셀 파일 저장");
   mySheet.SetSelectionMode(1);

}


function doAction(sAction){
   switch(sAction){
   case "search":
      mySheet.DoSearch("${contextPath}/sm/p0004/search.do");
      break;
   case "reload":
      mySheet.RemoveAll();
      break;
   case "save":
     mySheet.DoSave("${contextPath}/sm/p0004/saveData.do");
      var tempStr = mySheet.GetSaveString();
      break;
           
   case "insert":
      var row = mySheet.DataInsert(-1);
      break;
      
   case "down":
		  mySheet.Down2Excel();

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
	
	function mySheet_OnPopupClick(Row,Col,Value){
		
		if(Col=="4"){
			
		window.open("${contextPath}/sm/p0004/company_Search.do", "a", "width=480, height=650, left=100, top=50"); 
		}
		
		
	}
	
	
	function companyValue(rowData){
		mySheet.SetRowData(mySheet.GetSelectRow(),rowData);
	}

	


   </script>
<style type="text/css">
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

.leftbuttons {
	margin-top: 40px;
	margin: 10px;
	position: absolute;
	left: 0px;
}

.rightbuttons {
	margin-top: 40px;
	margin: 10px;
	position: absolute;
	right: 0px;
}

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

.innerheader{
font-size:14px;
border-radius:3px;
position:relative;
margin:20px;
top:20px;
left:10px;
background: #333333;
width: 100px;
text-align: center;
color:white;
padding: 10px;0px;10px;0px;
}
 
</style> 
</head>
<body onload="LoadPage()">


<!--    <form name="frm"> -->
  <div class="leftbuttons">
      <a href="javascript:doAction('down')" class="IBbutton">엑셀</a>
   </div> 


   <div class="rightbuttons">
      <a href="javascript:doAction('reload')" class="IBbutton">초기화</a><a
         href="javascript:doAction('search')" class="IBbutton">조회</a> <a
         href="javascript:doAction('insert')" class="IBbutton">추가</a>  <a
         href="javascript:doAction('save')" class="IBbutton">저장</a>
   </div>

<div class="title"> 
<header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 등록정보관리 : 사원등록</header>
</div>

<!--  &nbsp;&nbsp; 사업장 : <select name="sa_Name">
        <option>나의 사업장</option>
        <option>너의 사업장</option>
        <option>우리의 사업장</option>
      </select>
      
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 부서 : <select name="sa_Dept">
        <option>인사</option>
        <option>아싸</option>
        <option>안사</option>
      </select>
      
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <select name="sa_Select">
          <option>사원명</option>
          <option>사원코드</option>
       </select>
       
       <input type="text" placeholder="내용을 입력해주세요.">  -->

<div style="position:absolute; top:140px; left:60px;">
<script>
       createIBSheet("mySheet", "1500px", "700px");
</script>
</div>

<!-- <div style="position:absolute; top:100px; left:400px;">
<script>
createIBSheet("mySheet2", "1500px", "600px");
</script>
</div> -->

<!--    </form>
 --></body>
</html>