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
<script language="javascript">

	/*Sheet 기본 설정 */
	function LoadPage() {
		
		//아이비시트1 
		mySheet.RemoveAll();
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [		
			{Header:"코드",Type:"Text",SaveName:"admin_CODE",MinWidth:120,KeyField:1,Edit:0, Align:"Center"},
			{Header:"관리항목명",Type:"Text",SaveName:"admin_NAME",MinWidth:230,KeyField:1,Edit:0, Align:"Center"},			
			{Header:"테이블물리명",Type:"Text",SaveName:"admin_LIST_NAME" ,Hidden:1}			
		];   
		IBS_InitSheet( mySheet , initSheet);
  
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet.SetSheetHeight(700);
		
		
		//아이비시트2 -----------------------------------------------------------------------------------------------------
		mySheet2.RemoveAll();
		var initSheet2 = {};
		initSheet2.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet2.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet2.Cols = [
			
	     	{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:65},
	        {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:65},	
	        {Header:"테이블물리명",Type:"Text",SaveName:"t_NAME",Hidden:1 } ,	
			{Header:"코드",Type:"Text",SaveName:"admin_LIST_CODE",MinWidth:200,KeyField:1, Align:"Center",Edit:0},			
			{Header:"관리내역명",Type:"Text",SaveName:"admin_LIST_NAME",MinWidth:700, Align:"Center"}					

			
		];   
		IBS_InitSheet( mySheet2 , initSheet2);
  
		mySheet2.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet2.SetSheetHeight(700);
		
		
		
		
		mySheet.DoSearch("${contextPath}/hm/p0003/searchList.do");
	}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "search": //조회
				 mySheet2.DoSearch("${contextPath}/hm/p0003/searchList2.do","admin_LIST_NAME="+mySheet.GetCellValue(mySheet.GetSelectRow(),2));
				break;
				
			case "reload": //초기화
				mySheet2.RemoveAll(); 
				break;
			case "save": // 저장
		
				var tempStr = mySheet2.GetSaveString();
				tempStr= tempStr+"&table_NAME="+mySheet2.GetCellValue(0,2);
				mySheet2.DoSave("${contextPath}/hm/p0003/saveData.do",tempStr);
				break;			
			case "insert": //신규행 추가
				var row = mySheet2.DataInsert();
				mySheet2.SetCellEditable(row, 3, 1);
				break;
		}
	}
	
	//로우 클릭시
	function mySheet_OnClick(Row, Col) {
		if (Row != 0) {
			mySheet2.DoSearch("${contextPath}/hm/p0003/searchList2.do",
					"admin_LIST_NAME=" + mySheet.GetCellValue(Row, 2));
			mySheet2.SetCellValue(0, 2, mySheet.GetCellValue(Row, 2));

		}
	}


	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code, msg) {
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
position: relative;
width:350px;
top: 130px;
left: 60px;
padding: 0 30px 0 0;
border-right: 2px solid #C3C3C3;
}
.right{
 position: relative;
 width:1030px;
top: -570px;
left: 440px; 
padding: 0 0 0 30px;
border-left: 2px solid #C3C3C3;
}


</style>
</head>
<body onload="LoadPage()" style="overflow-x: hidden">



 <div class="leftbuttons">
		 <a href="javascript:doAction('excel')" class="IBbutton">엑셀</a>
	</div> 

	<div class="rightbuttons">  
		<a href="javascript:doAction('reload')" class="IBbutton">초기화</a> <a
			href="javascript:doAction('insert')" class="IBbutton">추가</a> <a
			href="javascript:doAction('search')" class="IBbutton">조회</a> <a
			href="javascript:doAction('save')" class="IBbutton">저장</a>
	</div>

<div class="title"> 
<header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 기초환경설정 : 인사기초코드등록</header>
</div>
	<div class="left"><script>createIBSheet("mySheet", "100%", "100%");</script></div>
	<div class="right"><script>createIBSheet("mySheet2", "100%", "100%");</script></div>
</body>
</html>