<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<style type="text/css">

.IBbutton {
	font-size: 13px;
	margin-left: 5px;
	background-color: #2B69A0;
	color: white;
	padding: 5px 15px;
	border-radius: 7px;
	text-decoration: none;
}
.IBbutton:hover {
	background-color: #2C3E50;
}

.left{
position: absolute;
top: 145px;
left: 50px;
}

.rightbuttons {
	margin-top: 50px;
	margin: 20px;
	position: absolute;
	right: 30px;
}
.right{
position: relative;
top: 150px;
left: 600px;
width: 700px;
background: #EDF0F5;
border-radius: 10px;
}

.right table{
font-size:13px;
font-weight:bold;
position: relative;
left: 40px;
padding: 20px;
}
.right table tr td:nth-child(1){
text-align:right;
}
.right table tr td:nth-child(2){
width: 20px;
height: 25px;
}
.right table tr td:nth-child(3) input{
width: 130px;
height: 20px;
padding-left: 10px;
margin-right:10px;
box-sizing: border-box;
border: 1px solid #CCCCCC;
border-radius: 2px;
} 
.title {
	width: 100%;
	color: #2C3E50;
	font-weight: bold;
	font-size: 20px;
	padding-left: 30px;
	padding-bottom: 10px;
	padding-top: 20px;
	border-top: thin solid #5E5E5E;
	border-bottom: thin dashed #5E5E5E;
	position: absolute;
	top: 50px;
}


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
		{Header:"NO",Type:"Seq",Width:70,SaveName:"seq",Align:"Center"},
		{Header:"부서코드",Type:"Text",Width:70,SaveName:"department_CODE",Align:"Center"},
		{Header:"부서명",Type:"Text",Width:70,SaveName:"department_NAME",Align:"Center"},
		];
	IBS_InitSheet(mySheet,initSheet);
	mySheet.SetEditableColorDiff(1);

	mySheet.SetColEditable(2,0);
	var param=FormQueryStringEnc(document.frm);
	mySheet.DoSearch("${contextPath}/hm/p0022/homeSearch_p05.do",param);
}






function doAction(sAction) {
	switch(sAction){
	
	case "search": //조회
		var param=FormQueryStringEnc(document.frm);
		mySheet.DoSearch("${contextPath}/hm/p0022/homeSearch_p05.do",param);
		break;
	
	case "reload": //초기화
		//조회 데이터 삭제
		mySheet.RemoveAll();
		break;

	}
}


function mySheet_OnDblClick(Row,Col){
 	var rowData=mySheet.GetRowData(Row);
	
	 window.opener.departmentValue(rowData);
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
	
    <div class="rightbuttons">
	  <a href="javascript:doAction('reload')"  class="IBbutton">초기화</a>
	  <a href="javascript:doAction('search')"  class="IBbutton">조회</a>

	</div>


	<div class="clear hidden"></div>
	<div class="left">
	<div class="ib_product">
	<script>
		createIBSheet("mySheet", "100%", "500px");
		selectSite();
	</script>
	</div>
	</div>
	
<form name="frm">
<select id="SiteList">
<option value="">전체</option>
</select>



</form>
	
</body>
</html>