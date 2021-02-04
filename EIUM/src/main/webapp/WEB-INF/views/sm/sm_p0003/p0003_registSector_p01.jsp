<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<style>
.rightbuttons {
	margin-top: 50px;
	margin: 20px;
	position: absolute;
	right: 150px;
	boder-right:1px solid #C3C3C3;
	top:0px;
	}
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
</style>
<meta charset="UTF-8">
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script type="text/javascript">


//sheet 기본설정
function LoadPage(){
	mySheet.RemoveAll();
	//아이비시트 초기화
	var initSheet = {};
	initSheet.Cfg={SearchMode:smLazyLoad,ToolTip:1};
	initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
	initSheet.Cols=[
		{Header:"상태",Type:"Status",Width:60,SaveName:"Status",Align:"Center"},
		{Header:"삭제	",Type:"DelCheck",Width:60,SaveName:"Delete",Align:"Center"},
		{Header:"부문코드",Type:"Text",Width:100,SaveName:"sector_CODE",Align:"Center"},
		{Header:"부문명",Type:"Text",Width:100,SaveName:"sector_NAME",Align:"Center"},
		{Header:"사용기간",Type:"Text",Width:100,SaveName:"sector_TERM",Align:"Center"},


		];
	IBS_InitSheet(mySheet,initSheet);
	mySheet.SetEditableColorDiff(1);

	//mySheet.SetColEditable(2,0);
	mySheet.DoSearch("${contextPath}/sm/p0003/searchpopup.do")


}

function doAction(sAction){
	switch(sAction){

	case "reload":
		//조회 데이터 삭제
		mySheet.RemoveAll();
		break;
	case "save":
		mySheet.DoSave("${contextPath}/sm/p0003/saveDatapopup.do");
		break;
			
	case "insert":
		
		//신규행 추가
		var row = mySheet.DataInsert(-1);
		break;
	
	
	}
}
</script>
<title>부문등록</title>
</head>
<body onload="LoadPage()">
  			  <div class="rightbuttons">
 				<a href="javascript:doAction('insert')" class="IBbutton">추가</a>
                <a href="javascript:doAction('save')" class="IBbutton">저장</a>
               </div>
               <div style="position:absolute;top:50px;left:20px;">
				<script>
				createIBSheet("mySheet","100","300px");
				</script>
     		  </div>     
     		  
</body>
</html>