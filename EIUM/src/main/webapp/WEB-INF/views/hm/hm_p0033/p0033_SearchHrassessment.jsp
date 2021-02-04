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
	initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
	initSheet.Cols=[

		{Header:"고과코드",Type:"Text",Width:230,SaveName:"assessment_code",Align:"Center"},
		{Header:"고과명",Type:"Text",Width:230,SaveName:"assessment_name",Align:"Center"}

		];
	IBS_InitSheet(mySheet2,initSheet);
	mySheet2.SetEditableColorDiff(1);

	mySheet2.SetColEditable(0,0);
	mySheet2.SetColEditable(1,0);
	mySheet2.SetSheetHeight(620);

	mySheet2.DoSearch("${contextPath}/hm/p0033/hr_assessment_List.do")


}

function mySheet2_OnDblClick(Row, Col, Value) { 

	 var selectRowJson = mySheet2.GetRowData(Row);
	 var hr_assessment_code=selectRowJson.assessment_code;
	 var hr_assessment_name=selectRowJson.assessment_name;
	 

		 document.getElementById("Chr_assessment_code").setAttribute('value', hr_assessment_code);
		 document.getElementById("Chr_assessment_name").setAttribute('value', hr_assessment_name);
		 opener.document.getElementById("Phr_assessment_code").value=document.getElementById("Chr_assessment_code").value;
		 opener.document.getElementById("Phr_assessment_name").value=document.getElementById("Chr_assessment_name").value;
		 opener.setHrassessment();


	
	    
	self.close(); 
	
	return false; //창을 닫는 경우에는 false를 리턴해 줘야 함. }
}

</script>
</head>
<body onload="LoadPage()">
				<script>
					createIBSheet("mySheet2", "100%", "500px");
					LoadPage(); 	
			
				</script>
	<input type="hidden" id="Chr_assessment_code">
	<input type="hidden" id="Chr_assessment_name">

</body>
</html>