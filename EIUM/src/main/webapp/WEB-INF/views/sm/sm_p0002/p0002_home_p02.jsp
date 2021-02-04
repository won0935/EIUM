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

	   {Header:"회사코드",Type:"Text",SaveName: "COMPANY_CODE",MinWidth:150,KeyField:1,Align:"Center"},	
		{Header:"회사명",Type:"Text",SaveName: "COMPANY_NAME",MinWidth:170, Align:"Left"}
      ];
   IBS_InitSheet(mySheet2,initSheet);
   mySheet2.SetEditableColorDiff(1);

   mySheet2.SetColEditable(0,0);
   mySheet2.SetColEditable(1,0);

  
   
 
	   mySheet2.DoSearch("${contextPath}/sm/p0002/searchList2.do");


}
function mySheet2_OnDblClick(Row, Col, Value) { 

	if(Row!=0){

    opener.document.getElementById("company_CODE").value=mySheet2.GetCellValue(Row,0);
    opener.document.getElementById("company_NAME").value=mySheet2.GetCellValue(Row,1);
    opener.mySheet.DoSearch("${contextPath}/sm/p0002/searchList.do", "param="+mySheet2.GetCellValue(Row,0))
    
	window.close();
   
	}
}


</script>
</head>
<body onload="LoadPage()">
            <script>
               createIBSheet("mySheet2", "100%", "500px");       
            </script>

</body>
</html>
