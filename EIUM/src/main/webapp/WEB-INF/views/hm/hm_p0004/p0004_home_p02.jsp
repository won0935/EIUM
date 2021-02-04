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

	   {Header:"관리코드",Type:"Text",SaveName: document.getElementById("table").value+"_CODE",MinWidth:150,KeyField:1,Align:"Center"},	
		{Header:"관리명",Type:"Text",SaveName:document.getElementById("table").value+"_NAME",MinWidth:170, Align:"Left"}
      ];
   IBS_InitSheet(mySheet2,initSheet);
   mySheet2.SetEditableColorDiff(1);

   mySheet2.SetColEditable(0,0);
   mySheet2.SetColEditable(1,0);

  
   
 
	   mySheet2.DoSearch("${contextPath}/hm/p0004/searchList2.do" , "command="+document.getElementById("table").value);


}
function mySheet2_OnDblClick(Row, Col, Value) { 

	if(Row!=0){
    var m_code=mySheet2.GetCellValue(Row,0);
    var m_name=mySheet2.GetCellValue(Row,1);

       document.getElementById("m_code").setAttribute('value', m_code);
       document.getElementById("m_name").setAttribute('value', m_name);
       
       var index=document.getElementById("index").value;
       if(index != 'undefined'){
    	   opener.document.getElementById(document.getElementById("table").value+"_CODE"+index).value=document.getElementById("m_code").value;
           opener.document.getElementById(document.getElementById("table").value+"_NAME"+index).value=document.getElementById("m_name").value;   
       }else{
    	   opener.document.getElementById(document.getElementById("table").value+"_CODE").value=document.getElementById("m_code").value;
           opener.document.getElementById(document.getElementById("table").value+"_NAME").value=document.getElementById("m_name").value;   
    	   
       } 
    
	window.close();
   
	}
}


</script>
</head>
<body onload="LoadPage()">
            <script>
               createIBSheet("mySheet2", "100%", "500px");
         
            </script>
   <input type="hidden" id="m_code">
   <input type="hidden" id="m_name">
   <input type="hidden" id="table" value="${command}">
   <input type="hidden" id="index" value="${index}">
</body>
</html>
