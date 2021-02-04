<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>

 <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.mtz.monthpicker.js"></script>
<script language="javascript">

	/*Sheet 기본 설정 */
	function LoadPage() {
		   mySheet.SetWaitImageVisible(0);
		
		//아이비시트1 
		mySheet.RemoveAll();
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0, MergeSheet:msHeaderOnly};
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [
		{Header:"상태",Type:"Status",Width:60,SaveName:"Status",Align:"Center"},
		{Header:"삭제",Type:"DelCheck",Width:60,SaveName:"Delete",Align:"Center"},
		{Header:"지급고유번호",Type:"Text",SaveName:"payment_code",Hidden:"1"}, 
		{Header:"지급일자",Type:"Date", Align:"Center", Width:250, SaveName:"payment_date",Align:"Center", Format:"yyyy-MM-dd"}, 
		{Header:"지급분류",Type:"Combo",Width:170, SaveName:"payment_des_name", Align:"Center",ComboText:"동시|급여|상여", ComboCode:"300|100|200",PopupText:"동시|급여|상여"}
		];
		IBS_InitSheet(mySheet, initSheet);
  
		mySheet.SetSheetHeight(610);
		
		mySheet2.RemoveAll();
		var initSheet2 = {};
		initSheet2.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0, MergeSheet:msHeaderOnly};
		initSheet2.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet2.Cols = [
		{Header:"상태|상태",Type:"Status",Width:65,SaveName:"Status",Align:"Center"},
		{Header:"삭제|삭제",Type:"DelCheck",Width:65,SaveName:"Delete",Align:"Center"},
		{Header:"지급선정고유번호",Type:"Text",SaveName:"selection_of_payment_code",Hidden:"1"}, 
		{Header:"직급직종및급여형태|사업장코드",Type:"Text",SaveName:"site_code", Hidden:"1"}, 
		{Header:"직급직종및급여형태|사업장",Type:"Popup",Width:350,SaveName:"site_name", Align:"Center"}, 
		{Header:"직급직종및급여형태|직종코드",Type:"Text",SaveName:"job_class_code",Hidden:"1"}, 
		{Header:"직급직종및급여형태|직종",Type:"Popup",Width:350,SaveName:"job_class_name" , Align:"Center"}
		];
		IBS_InitSheet(mySheet2, initSheet2);
  
		mySheet2.SetSheetHeight(610);
		

		/* MonthPicker 옵션 */
	    options = {
		    pattern: 'yy/mm', // Default is 'mm/yyyy' and separator char is not mandatory
	        selectedYear: 2019,
	        startYear: 2008,
	        finalYear: 2100,
	        buttonImage: "${contextPath}/resources/image/icons/icon_calendar.png", 
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	    };
	     
	    /* MonthPicker Set */
	    $('#monthpicker').monthpicker(options);
	     
	    /* 버튼 클릭시 MonthPicker Show */
	    $('#btn_monthpicker').bind('click', function () {
	        $('#monthpicker').monthpicker('show');
	    });
	}

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
			var param = FormQueryStringEnc(document.frm);
			mySheet.DoSearch("${contextPath}/hm/p0002/searchList.do", param);
			break;

		case "reload": //초기화
			mySheet.RemoveAll();
			mySheet2.RemoveAll();
			$('#monthpicker').attr('value', "");
			break;
		case "save": // 저장
			var tempStr = mySheet.GetSaveString();
			mySheet.DoSave("${contextPath}/hm/p0002/saveData.do");
            doAction("search");
			break;
			
		case "save2": // 저장
			var tempStr2 = mySheet2.GetSaveString();
			mySheet2.DoSave("${contextPath}/hm/p0002/saveSelect.do");

			break;
			
		case "insert":
		      var row = mySheet.DataInsert(-1);
		      break;
		      
				
		case "insert2":
		      var row = mySheet2.DataInsert(-1);
		      break;    
		      
		 case "down":
		 mySheet.Down2ExcelBuffer(true);  
	     mySheet.Down2Excel();
	     mySheet2.Down2Excel();
	     mySheet.Down2ExcelBuffer(false); 
	     break;
	  
		}
	}
	
	function mySheet2_OnSearchEnd() {
		mySheet2.DataInsert(-1);
	}
	
/* 	function mySheet_OnClick(Row, Col) {
			  x = "x=" + mySheet.GetCellValue(Row, 2);			  
			mySheet2.DoSearch("${contextPath}/hm/p0002/searchSelect.do", x);
			
	} */
	
	function mySheet2_OnKeyUp(Row, Col, KeyCode, Shift) {
		//if (Modify == 1) { 인사코드 부분 - 수정 가능일시이니까 / 인사기록카드에서는 상관x
	         //console.log("keycode: "+KeyCode+"&col:"+mySheet2.LastCol()+"&row:"+mySheet2.RowCount());
	         /* console.log("keycode: " + KeyCode);*/
	         console.log("col:" + Col + "lastcol:" + mySheet2.LastCol());
	         console.log("row:" + Row + "row갯수:" + mySheet2.RowCount()); 
	         console.log("mySheet2:" +mySheet2.RowCount());
	         if ( KeyCode == 13 &&  Col == mySheet2.LastCol()
	               && Row-1 == mySheet2.RowCount()) { // 엔터를 누르고 / col이 마지막 col이고 / row가 마지막 열일경우
	            doAction("insert2");
	         }
		}
		
		
	function mySheet_OnDblClick(Row,Col,Value){
		  x = "x=" + mySheet.GetCellValue(Row, 2);			  
			mySheet2.DoSearch("${contextPath}/hm/p0002/searchSelect.do", x);
	}

	
	
/* 	function mySheet2_OnDblClick(Row,Col,Value){
		row=Row;
		col=Col;
		
		if(Col=="4"){
			
		window.open("${contextPath}/hm/p0002/site_Search.do", "a", "width=500, height=700, left=100, top=50"); 
		}
		
		if(Col=="6"){
			
		window.open("${contextPath}/hm/p0002/jobclass_Search.do", "a", "width=500, height=700, left=100, top=50"); 
		}
	} */
	
	function mySheet2_OnPopupClick(Row,Col,Value){
		
		if(Col=="4"){
			
		window.open("${contextPath}/hm/p0002/site_Search.do", "a", "width=480, height=650, left=100, top=50"); 
		}
		
		if(Col=="6"){
			
		window.open("${contextPath}/hm/p0002/jobclass_Search.do", "a", "width=480, height=650, left=100, top=50"); 
		}
	}
	
	
	function siteValue(rowData){
		mySheet2.SetRowData(mySheet2.GetSelectRow(),rowData);
	}
	function job_classValue(rowData){
		mySheet2.SetRowData(mySheet2.GetSelectRow(),rowData);
	}
	
	
	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code, msg) {
		if (msg != "") {
			alert(msg);
			//번호 다시 매기기
			//mySheet.ReNumberSeq();
		}
	}
	
	function mySheet2_OnSaveEnd(code, msg) {
		if (msg != "") {
			alert(msg);
			//번호 다시 매기기
			//mySheet.ReNumberSeq();
		}
	}
	
	
	



	
	
			
			

</script>
<style type="text/css">

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

.leftbuttons {
	margin-top: 40px;
	margin: 10px;
	position: absolute;
	left: 0px;
}

.rightbuttons {
	margin-top: 40px;
	margin: 10px;
	position: absolute;
	right: 0px;
}

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
	position: relative;
	top: 130px;
	left: 60px;
	width: 560px;
}

.right{
	position: relative;
	top: -480px;
	left: 620px;
	width: 830px;
	padding: 0 0 0 30px;
    border-left: 2px solid #C3C3C3;
    margin-left: 15px;
}

#searchBar {
	padding: 25px 0px 25px 0px;
    background: #EBEBEB;
    margin-bottom: 20px;
    border-radius: 5px;
    font-size: 12px;
    border-radius: 5px;
    position: absolute;
    width: 1450px;
   position: relative;
	top: 130px;
	left: 60px;

}

#searchBar input{
	height: 24px;
	border-radius: 3px;
	border: none;
	padding-right: 10px;
	vertical-align: middle;
	text-align: right;
	width: 150px;
}

.left_rightsearch input{
	height: 22px;
	width: 100px;
	border-radius: 3px;
	border: none;
	padding-left:5px;
	vertical-align: middle;
}
.yearMonth {
	margin-left: 110px;
	background: #5E5E5E;
    padding: 5px 5px;
    color: white;
    border-radius: 5px;
    margin-right: 10px;
    vertical-align: middle;
}
.kindofsearch{
	background: #5E5E5E;
	padding: 5px 5px;
	color: white;
	border-radius: 5px;
}
.left_rightsearch{
	display: inline;
	float: right;
}

.ui-datepicker table{ font-size: 12px; }
.ui-widget input, .ui-widget select, .ui-widget textarea, .ui-widget button{ width:40%; font-size: 14px; }
img {vertical-align: middle; padding: 0px 5px 0px 2px; }

</style>
</head>
<body onload="LoadPage()" >
<form name="frm">
	<div class="leftbuttons">
		<a	href="javascript:doAction('down')" class="IBbutton">엑셀</a>
	</div>
	<div class="rightbuttons">
		<a href="javascript:doAction('reload')" class="IBbutton">초기화</a> 
		<a href="javascript:doAction('search')" class="IBbutton">조회</a> 		
		<a href="javascript:doAction('insert')" class="IBbutton">추가</a>
		<a href="javascript:doAction('save')" class="IBbutton">지급 저장</a>
		<a href="javascript:doAction('save2')" class="IBbutton">지급구분 저장</a>
		
	</div>

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 기초환경설정 : 지급일등록
		</header>
	</div>
	
	
	<div id="searchBar">
           <span class="yearMonth">귀속연월</span> 
			<input id="monthpicker" type="text">
			<img id="btn_monthpicker"  src="${contextPath}/resources/image/icons/icon_calendar.png">
		</div>
		

	<div class="left">
		<script>createIBSheet("mySheet", "100%", "100%");</script>
	</div>
	
	<div class="right">
			<script>createIBSheet("mySheet2", "100%", "100%");</script>
	
	</div>
	
	

</form>
</body>
</html>