<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>사원검색팝업</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>  
<script>


function LoadPage(){
	mySheet.RemoveAll();  
	//아이비시트 초기화
	var initSheet = {};
	initSheet.Cfg={SearchMode:smLazyLoad,ToolTip:1};
	initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
	initSheet.Cols=[
		{Header:"NO",Type:"Seq",Width:30,SaveName:"seq",Align:"Center"},
		{Header:"사원코드",Type:"Text",Width:90,SaveName:"masterEmployee_CODE",Align:"Center"},
		{Header:"사원명",Type:"Text",Width:90,SaveName:"employee_NAME",Align:"Center"},
		{Header:"사업장",Type:"Text",Width:90,SaveName:"site_NAME",Align:"Center"},
		{Header:"부서",Type:"Text",Width:90,SaveName:"department_NAME",Align:"Center"},
		{Header:"직책",Type:"Text",Width:70,SaveName:"duty_NAME",Align:"Center"},

		];
	IBS_InitSheet(mySheet,initSheet);
	mySheet.SetEditableColorDiff(1);

	mySheet.SetColEditable(2,0);
	mySheet.DoSearch("${contextPath}/hm/p0022/homeSearch_p02.do");
}






function doAction(sAction) {
	switch(sAction){
	
	case "search": //조회
		
		mySheet.DoSearch("${contextPath}/hm/p0022/homeSearch_p02.do");
		break;
	
	case "reload": //초기화
		//조회 데이터 삭제
		mySheet.RemoveAll();
		break;

	}
}


function mySheet_OnDblClick(Row,Col){
 	var rowData=mySheet.GetRowData(Row);
	
	 window.opener.popupValue3(rowData);
	self.close();
}

</script>

</head>
<body onLoad="LoadPage()">
	<div class="clear hidden"></div>
	<div class="left">
	<div class="ib_product">
	<script>
		createIBSheet("mySheet", "500px", "500px");
	</script>
	</div>
	</div>




</body>
</html>