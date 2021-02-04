<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>  
<script type="text/javascript">

function LoadPage(){
	mySheet.RemoveAll();
	//아이비시트 초기화
	var initSheet = {};
	initSheet.Cfg={SearchMode:smLazyLoad,ToolTip:1};
	initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
	initSheet.Cols=[

		{Header:"부문코드",Type:"Text",MinWidth:100,SaveName:"sector_CODE",Align:"Center"},
		{Header:"부문명",Type:"Text",MinWidth:100,SaveName:"sector_NAME",Align:"Center"},
		{Header:"사용기간",Type:"Text",MinWidth:120,SaveName:"sector_TERM",Align:"Center"},


		];
	IBS_InitSheet(mySheet,initSheet);
	mySheet.SetEditableColorDiff(1);

	mySheet.SetColEditable(2,0);
	mySheet.DoSearch("${contextPath}/sm/p0003/sectorSearch_p01.do")


}

function mySheet_OnDblClick(Row, Col, Value) { 


 	var rowData=mySheet.GetRowData(Row);
	
	 window.opener.sectorValue(rowData);
	
	    
	self.close(); 
	
	return false; //창을 닫는 경우에는 false를 리턴해 줘야 함. }
}

</script>
</head>
<body onload="LoadPage()">
				<script>
					createIBSheet("mySheet", "100%", "500px");
			
				</script>
	<input type="hidden" id="CsectorCode">
	<input type="hidden" id="CsectorName">
</body>
</html>