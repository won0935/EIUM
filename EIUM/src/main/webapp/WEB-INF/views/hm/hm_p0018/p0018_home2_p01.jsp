<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육코드검색팝업</title>
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
		{Header:"NO",Type:"Seq",Width:100,SaveName:"seq",Align:"Center"},
		{Header:"교육코드",Type:"Text",Width:100,SaveName:"employee_TRAINING_CODE",Align:"Center"},
		{Header:"교육명",Type:"Text",Width:120,SaveName:"employee_TRAINING_NAME",Align:"Center"},
		{Header:"시작일",Type:"Date",Width:120,SaveName:"employee_TRAINING_START_DATE",Align:"Center"},
		{Header:"종료일",Type:"Date",Width:120,SaveName:"employee_TRAINING_END_DATE",Align:"Center"},
		];
	IBS_InitSheet(mySheet,initSheet);
	mySheet.SetEditableColorDiff(1);

	mySheet.SetColEditable(2,0);
	var param = FormQueryStringEnc(document.frm);
	mySheet.DoSearch("${contextPath}/hm/p0018/home2Search_p01.do",param)


}

function mySheet_OnDblClick(Row, Col, Value) { 

	 var selectRowJson = mySheet.GetRowData(Row);
	 var educode=selectRowJson.employee_TRAINING_CODE;
	 var eduname=selectRowJson.employee_TRAINING_NAME;

	 
	 console.log(educode);
		$("#CeduCode").attr("value",educode);
		$("#CeduName").attr("value",eduname);
		console.log($("#CeduName").val());
		 opener.document.getElementById("PeduCode").value=document.getElementById("CeduCode").value;
		 opener.document.getElementById("PeduName").value=document.getElementById("CeduName").value;
		 opener.setEdu();


	
	    
	self.close(); 
	
	return false; //창을 닫는 경우에는 false를 리턴해 줘야 함. }
}

</script>
</head>
<body onload="LoadPage()">
				<script>
					createIBSheet("mySheet", "100%", "480px");
				</script>
	<input type="hidden" id="CeduCode">
	<input type="hidden" id="CeduName">
	<form name="frm">
	<input type="hidden" id="eduCode" value = <%=request.getParameter("eduCode")%>>
	</form>
</body>
</html>