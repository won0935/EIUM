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
		{Header:"지급코드",Type:"Text", Align:"Center", Width:120, SaveName:"payment_code", Hidden:"1"}, 
		{Header:"지급일자",Type:"Date", Align:"Center",MinWidth:230, SaveName:"payment_date", Format:"yyyy-MM-dd"}, 
		{Header:"지급분류",Type:"Text", Align:"Center",MinWidth:230, SaveName:"payment_des_name"}
		];
	IBS_InitSheet(mySheet2,initSheet);
	
	mySheet2.SetEditableColorDiff(1);
	mySheet2.SetColEditable(0,0);
	mySheet2.SetColEditable(1,0);
	mySheet2.SetColEditable(2,0);
	mySheet2.SetSheetHeight(620);

	
	var monthpicker =${monthpicker};
	mySheet2.DoSearch("${contextPath}/pm/p0003/searchPaymentdateList.do",monthpicker)


}

function mySheet2_OnDblClick(Row, Col, Value) { 

	 var selectRowJson = mySheet2.GetRowData(Row);
	 var payment_code = selectRowJson.payment_code;
	 var payment_date = selectRowJson.payment_date;
	 var payment_des_name = selectRowJson.payment_des_name;

		 document.getElementById("Cpayment_code").setAttribute('value', payment_code);
		 document.getElementById("Cpayment_date").setAttribute('value', payment_date);
		 document.getElementById("Cpayment_des_name").setAttribute('value', payment_des_name);
		 
		 opener.document.getElementById("Ppayment_code").value=document.getElementById("Cpayment_code").value;
		 opener.document.getElementById("Ppayment_date").value=document.getElementById("Cpayment_date").value;
		 opener.document.getElementById("Ppayment_des_name").value=document.getElementById("Cpayment_des_name").value;
		 opener.setPayment();
	    
	self.close(); 
	
	return false; //창을 닫는 경우에는 false를 리턴해 줘야 함. }
}

</script>
</head>
<body onload="LoadPage()">
				<script>
					createIBSheet("mySheet2", "100%", "500px");
			
				</script>
	<input type="hidden" id="monthpicker" value="${monthpicker}">
	<input type="hidden" id="Cpayment_code">
	<input type="hidden" id="Cpayment_date">
	<input type="hidden" id="Cpayment_des_name">
	
</body>
</html>