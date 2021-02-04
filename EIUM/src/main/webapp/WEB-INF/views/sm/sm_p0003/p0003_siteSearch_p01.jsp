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
	mySheet2.RemoveAll();
	//아이비시트 초기화
	var initSheet = {};
	initSheet.Cfg={SearchMode:smLazyLoad,ToolTip:1};
	initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
	initSheet.Cols=[

		{Header:"사업장코드",Type:"Text",MinWidth:150,SaveName:"site_CODE",Align:"Center"},
		{Header:"사업장이름",Type:"Text",MinWidth:170,SaveName:"site_NAME",Align:"Center"},


		];
	IBS_InitSheet(mySheet2,initSheet);
	mySheet2.SetEditableColorDiff(1);
	
	mySheet2.SetColEditable(0,0);
	mySheet2.DoSearch("${contextPath}/sm/p0003/siteSearch_p01.do")


}

function mySheet2_OnDblClick(Row, Col, Value) { 

 	var rowData=mySheet2.GetRowData(Row);
	
	 window.opener.siteValue(rowData);
	
	    
	self.close(); 
	
	return false; //창을 닫는 경우에는 false를 리턴해 줘야 함. }
}



</script>

</head>
<body >
				<script>
				
					createIBSheet("mySheet2", "100%", "500px");
					LoadPage();
				
				</script>

	<input type="hidden" id="CsiteCode">
	<input type="hidden" id="CsiteName">
				
</body>
</html>