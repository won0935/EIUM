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
	initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
	initSheet.Cols=[
		{Header:"사원코드",Type:"Text",Width:230,SaveName:"employee_CODE",Align:"Center"},
		{Header:"사원명",Type:"Text",Width:230,SaveName:"employee_NAME",Align:"Center"},
		{Header:"부서명",Type:"Text",Width:100,SaveName:"department_NAME",Align:"Center", Hidden:1},
		{Header:"직급",Type:"Text",Width:100,SaveName:"position_NAME",Align:"Center", Hidden:1}
		];
	IBS_InitSheet(mySheet,initSheet);
	mySheet.SetEditableColorDiff(1);
	mySheet.SetSheetHeight(620);
	mySheet.SetColEditable(0,0);
	mySheet.DoSearch("${contextPath}/wm/p0004/employeeSearch_p01.do")


}

function mySheet_OnDblClick(Row, Col, Value) { 

	 var selectRowJson = mySheet.GetRowData(Row);
	 opener.GetData(selectRowJson);
	 
	 self.close();
	 return false;

}



</script>

</head>
<body >
				<script>
					createIBSheet("mySheet", "100%", "500px");
					LoadPage(); 	
				</script>

	<input type="hidden" id="CemployeeCode">
	<input type="hidden" id="CemployeeName">
	<input type="hidden" id="CdepartmentName">
	<input type="hidden" id="CpositionName">
				
</body>
</html>