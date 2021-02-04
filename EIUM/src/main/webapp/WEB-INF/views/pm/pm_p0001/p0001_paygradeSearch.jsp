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

		{Header:"직급명",Type:"Text",Width:100,SaveName:"position_name",Align:"Center"},
		{Header:"호봉구분",Type:"Text",Width:100,SaveName:"pay_grade_name",Align:"Center"},
		{Header:"금액",Type:"Text",Width:100,SaveName:"salary",Align:"Center"}

		];
	IBS_InitSheet(mySheet2,initSheet);
	mySheet2.SetEditableColorDiff(1);

	mySheet2.SetColEditable(0,0);
	mySheet2.SetColEditable(1,0);

	mySheet2.DoSearch("${contextPath}/pm/p0001/paygrade_searchData.do")


}

function mySheet2_OnDblClick(Row, Col, Value) { 

	 var selectRowJson = mySheet2.GetRowData(Row);
	 var position_name=selectRowJson.position_name;
	 var pay_grade_name=selectRowJson.pay_grade_name;
	 var salary=selectRowJson.salary;
	 

		 document.getElementById("Cposition_name").setAttribute('value', position_name);
		 document.getElementById("Cpay_grade_name").setAttribute('value', pay_grade_name);
		 document.getElementById("Csalary").setAttribute('value', salary);
		 opener.document.getElementById("Pposition_name").value=document.getElementById("Cposition_name").value;
		 opener.document.getElementById("Ppay_grade_name").value=document.getElementById("Cpay_grade_name").value;
		 opener.document.getElementById("Psalary").value=document.getElementById("Csalary").value;
		 opener.setPaygrade();


	
	    
	self.close(); 
	
	return false; //창을 닫는 경우에는 false를 리턴해 줘야 함. }
}

</script>
</head>
<body onload="LoadPage()">
				<script>
					createIBSheet("mySheet2", "100%", "500px");
			
				</script>
	<input type="hidden" id="Cposition_name">
	<input type="hidden" id="Cpay_grade_name">
	<input type="hidden" id="Csalary">
</body>
</html>