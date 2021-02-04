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
	mySheet3.RemoveAll();
	//아이비시트 초기화
	var initSheet = {};
	initSheet.Cfg={SearchMode:smLazyLoad,ToolTip:1};
	initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
	initSheet.Cols=[

		{Header:"회사코드",Type:"Text",Width:230,SaveName:"company_code",Align:"Center"},
		{Header:"회사명",Type:"Text",Width:230,SaveName:"company_name",Align:"Center"},
		];
	IBS_InitSheet(mySheet3,initSheet);
	mySheet3.SetEditableColorDiff(1);
	mySheet3.SetColEditable(0,0);
	mySheet3.SetColEditable(1,0);
	mySheet3.SetSheetHeight(620);

	mySheet3.DoSearch("${contextPath}/sm/p0004/company_list.do")


}



function mySheet3_OnDblClick(Row, Col, Value) { 

	var rowData=mySheet3.GetRowData(Row);
	
	 window.opener.companyValue(rowData);
	
	    
	self.close(); 
	
	return false; //창을 닫는 경우에는 false를 리턴해 줘야 함. }
}

</script>
</head>
<body onload="LoadPage()">
				<script>
					createIBSheet("mySheet3", "100%", "500px");
			
				</script>
	<input type="hidden" id="Csite_code">
	<input type="hidden" id="Csite_name">
</body>
</html>