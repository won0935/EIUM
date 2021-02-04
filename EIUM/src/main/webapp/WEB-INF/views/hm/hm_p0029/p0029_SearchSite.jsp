<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>  
<script type="text/javascript">

function LoadPage(){
	mySheet1.RemoveAll();
	//아이비 시트 초기화
	var initSheet = {};
	initSheet.Cfg={SearchMode:smLazyLoad,ToolTip:1, MouseHoverMode : 2};
	initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
	initSheet.Cols=[
		{Header:"사업장코드", Type:"Text", Width:300, SaveName:"site_CODE", Align:"Center"},
		{Header:"사업장명",Type:"Text",Width:300,SaveName:"site_NAME",Align:"Center"}
	];
	IBS_InitSheet(mySheet1,initSheet);
	mySheet1.SetEditableColorDiff(1);

	mySheet1.SetColEditable(0,0);
	mySheet1.SetColEditable(1,0);
	
	mySheet1.DoSearch("${contextPath}/hm/p0029/searchList_site.do");
}

function mySheet1_OnDblClick(Row, Col, Value){
	var selectRowJson = mySheet1.GetRowData(Row);
	 var site_CODE=selectRowJson.site_CODE;
	 var site_NAME=selectRowJson.site_NAME;
	 

		 document.getElementById("Csite_code").setAttribute('value', site_CODE);
		 document.getElementById("Csite_name").setAttribute('value', site_NAME);
		 opener.document.getElementById("Poption_code").value=document.getElementById("Csite_code").value;
		 opener.document.getElementById("Poption_name").value=document.getElementById("Csite_name").value;
		 
		 opener.setSite();


	
	    
	self.close(); 
	
	return false; //창을 닫는 경우에는 false를 리턴해 줘야 함. 
}
</script>
</head>
<body onload="LoadPage()">
	<script>
		createIBSheet("mySheet1", "100%", "500px");
		LoadPage();
	</script>
	
	<input type="hidden" id="Csite_code">
	<input type="hidden" id="Csite_name">
</body>
</html>