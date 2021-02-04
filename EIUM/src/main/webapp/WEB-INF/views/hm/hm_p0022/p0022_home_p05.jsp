<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<style type="text/css">


</style>

<meta charset="UTF-8">
<title>부서검색팝업</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>  
<script>


function LoadPage(){
	mySheet.RemoveAll();
	//아이비시트 초기화
	var initSheet = {};
	initSheet.Cfg={SearchMode:smLazyLoad,ToolTip:1};
	initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
	initSheet.Cols=[
		{Header:"NO",Type:"Seq",MinWidth:60,SaveName:"seq",Align:"Center"},
		{Header:"부서코드",Type:"Text",MinWidth:130,SaveName:"department_CODE",Align:"Center"},
		{Header:"부서명",Type:"Text",MinWidth:140,SaveName:"department_NAME",Align:"Center"},
		];
	IBS_InitSheet(mySheet,initSheet);
	mySheet.SetEditableColorDiff(1);

	mySheet.SetColEditable(2,0);

	mySheet.DoSearch("${contextPath}/hm/p0022/homeSearch_p05.do");
}






function doAction(sAction) {
	switch(sAction){
	
	case "search": //조회

		mySheet.DoSearch("${contextPath}/hm/p0022/homeSearch_p05.do");
		break;
	
	case "reload": //초기화
		//조회 데이터 삭제
		mySheet.RemoveAll();
		break;

	}
}


function mySheet_OnDblClick(Row,Col){
 	var rowData=mySheet.GetRowData(Row);
	
	 window.opener.popupValue5(rowData);
	self.close();
}

function selectSite() {

	$.ajax({

				url : "${contextPath}/sm/p0006/SiteList.do",//목록을 조회 할 url

				type : "POST",

				dataType : "JSON",

				success : function(data) {

					for (var i = 0; i < data['Data'].length; i++) {
						
						

						var option = "<option name='1' value='" + data['Data'][i].site_NAME + "'>"
								+ data['Data'][i].site_NAME + "</option>";

						//대상 콤보박스에 추가

						$('#SiteList').append(option);

					}

				},

				error : function(jqxhr, status, error) {

					alert("에러");

				}

			});

};


</script>

</head>
<body onLoad="LoadPage()">
	<div class="clear hidden"></div>
	<div class="left">
	<div class="ib_product">
	<script>
		createIBSheet("mySheet", "100%", "500px");
		selectSite();
	</script>
	</div>
	</div>
	

	
</body>
</html>