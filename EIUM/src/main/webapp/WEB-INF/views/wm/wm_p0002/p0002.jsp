<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.mtz.monthpicker.js"></script>
<script type="text/javascript">

	var pageheightoffset = 200; //시트높이 계산용

	//sheet 기본설정
	function LoadPage() {
		mySheet.SetWaitImageVisible(0);
		
		/* MonthPicker 옵션 */
	    options = {
	        pattern: 'yy/mm', // Default is 'mm/yyyy' and separator char is not mandatory
	        selectedYear: 2019,
	        startYear: 2000,
	        finalYear: 3000,
	        buttonImage: "${contextPath}/resources/image/icons/icon_calendar.png", 
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	    };
	    /* MonthPicker Set */
	    $('#date').monthpicker(options);
	     
	    /* 버튼 클릭시 MonthPicker Show */
	    $('#btn_monthpicker').bind('click', function () {
	        $('#date').monthpicker('show');
	
	    });
	    


		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = { SearchMode : smLazyLoad, ToolTip : 1, MouseHoverMode : 2 };
		initSheet.HeaderMode = { Sort : 1, ColMove : 1, ColResize : 10, HeaderCheck : 1 };
		initSheet.Cols = [ 
			               { "Header":"상태","SaveName":"sStatus","Type":"Status","Align":"Center","Width":60 },
			               { "Header":"삭제","SaveName":"DEL_CHK","Type":"DelCheck","Width":60 },
			               { "Header" : "휴가고유코드", "SaveName" : "vacation_CODE", "Type" : "Text", "Width" : 100, "Align" : "Center", "Hidden" : 1 }, 
			               { "Header" : "사원코드", "SaveName" : "employee_CODE", "Type" : "Popup", "Width" : 100, "Align" : "Center" }, 
			               { "Header" : "사원명", "SaveName" : "employee_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center","UpdateEdit":0 },
			               { "Header" : "부서명", "SaveName" : "department_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center","UpdateEdit":0 },
			               { "Header" : "직급", "SaveName" : "position_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center","UpdateEdit":0 },
			               { "Header" : "신청 전 잔여일수", "SaveName" : "before_VACATION_REMAIN_DATE", "Type" : "Text", "Width" : 110, "Align" : "Center" },
			               { "Header" : "근태종류", "SaveName" : "vacation_TYPE", "Type" : "Combo", "Width" : 130, "Align" : "Center", "ComboText":"연차|특별휴가|경조휴가", "ComboCode":"연차|특별휴가|경조휴가"},
			               { "Header" : "시작일", "SaveName" : "vacation_START_DATE", "Type" : "Date", "Width" : 150, "Align" : "Center", "Format":"Ymd" },
			               { "Header" : "종료일", "SaveName" : "vacation_END_DATE", "Type" : "Date", "Width" : 150, "Align" : "Center", "Format":"Ymd" },
			               { "Header" : "신청일수", "SaveName" : "vacation_APPLY_DATE", "Type" : "Text", "Width" : 110, "Align" : "Center" },
			               { "Header" : "신청 후 잔여일수", "SaveName" : "after_VACATION_REMAIN_DATE", "Type" : "Text", "Width" : 110, "Align" : "Center" } 
		                 ];

		IBS_InitSheet(mySheet, initSheet);
		mySheet.SetEditableColorDiff(1);
		mySheet.SetActionMenu("엑셀 파일 저장");
		mySheet.SetSelectionMode(1);
		mySheet.SetColEditable(7,0);
		mySheet.SetColEditable(11,0);
		mySheet.SetColEditable(12,0);
		
	}

	function doAction(sAction) {
		switch (sAction) {
		case "search":
			param = FormQueryStringEnc(document.frm);
		    mySheet.DoSearch("${contextPath}/wm/p0002/searchList.do", param);
			break;
		case "reset":
			mySheet.RemoveAll();
			$("form").each(function() {  
	            this.reset();
	         });  
			break;
		case "save":
			mySheet.DoSave("${contextPath}/wm/p0002/saveData.do");
			break;
		case "insert":
		    var row = mySheet.DataInsert(1);
		    break;
		case "down":
			var param2 = { Mode : -1 };
	        mySheet.Down2Excel(param2);
	        break;
		}
	}
	
	function mySheet_OnChange(Row,Col){
		var sd=mySheet.GetCellValue(Row,9);
	    var ed=mySheet.GetCellValue(Row,10);
	
		function x(sd,ed){
		    var stDate = new Date(sd.substring(0,4),sd.substring(4,6)-1,sd.substring(6,8));
		    var endDate = new Date(ed.substring(0,4),ed.substring(4,6)-1,ed.substring(6,8));
		    var btMs = endDate.getTime() - stDate.getTime() ;
		    btDay = btMs / (1000*60*60*24) ;
		 	return btDay;
		}
		x(sd,ed);
		
		if(sd != '' && ed !='' && mySheet.GetCellValue(Row,8) == '연차'){	
		mySheet.SetCellValue(Row,11,btDay+1);
		mySheet.SetCellValue(Row,12,mySheet.GetCellValue(Row,7)-mySheet.GetCellValue(Row,11));
			
		if(mySheet.GetCellValue(Row,12) < 0) {
			mySheet.SetCellBackColor(Row, 12, "#FF0000"); 
		} else {
			mySheet.SetCellBackColor(Row, 12, "yellow"); 
		}
		
		}
		
		if(sd != '' && ed !='' && mySheet.GetCellValue(Row,8) == '특별휴가'){
			mySheet.SetCellValue(Row,11,btDay+1);
			mySheet.SetCellValue(Row,12,mySheet.GetCellValue(Row,7));
				
			if(mySheet.GetCellValue(Row,12) < 0) {
				mySheet.SetCellBackColor(Row, 12, "#FF0000"); 
			} else {
				mySheet.SetCellBackColor(Row, 12, "yellow"); 
			}
			
			}
		
		if(sd != '' && ed !='' && mySheet.GetCellValue(Row,8) == '경조휴가'){	
			mySheet.SetCellValue(Row,11,btDay+1);
			mySheet.SetCellValue(Row,12,mySheet.GetCellValue(Row,7));

			if(mySheet.GetCellValue(Row,12) < 0) {
				mySheet.SetCellBackColor(Row, 12, "#FF0000"); 
			} else {
				mySheet.SetCellBackColor(Row, 12, "yellow"); 
			}			
			}
		
		if(sd != '' && ed !='' && mySheet.GetCellValue(Row,8) == ''){
			mySheet.SetCellValue(Row,11,btDay+1);
			mySheet.SetCellValue(Row,12,'');

			if(mySheet.GetCellValue(Row,12) < 0) {
				mySheet.SetCellBackColor(Row, 12, "#FF0000"); 
			} else {
				mySheet.SetCellBackColor(Row, 12, "yellow"); 
			}			
			}
		
		if(Col == 10){
			if(mySheet.GetCellValue(Row,9) != '' && mySheet.GetCellValue(Row,10) < mySheet.GetCellValue(Row,9)) {
				alert('시작일보다 종료일이 크거나 같아야합니다.');
				mySheet.SetCellValue(Row,10,'');
				mySheet.SetCellValue(Row,11,'');
				mySheet.SetCellValue(Row,12,'');
				mySheet.SetCellBackColor(Row, 12, "white"); 
			}
		}
		if(Col == 9){
			if(mySheet.GetCellValue(Row,10) != '' && mySheet.GetCellValue(Row,10) < mySheet.GetCellValue(Row,9)) {
				alert('시작일보다 종료일이 크거나 같아야합니다.');
				mySheet.SetCellValue(Row,9,'');
				mySheet.SetCellValue(Row,11,'');
				mySheet.SetCellValue(Row,12,'');
				mySheet.SetCellBackColor(Row, 12, "white"); 
			}
		}
		
	}
	
	function mySheet_OnPopupClick(Row,Col) {
		row=Row;
		col=Col;
		
		if(Col=="3"){
		window.open("${contextPath}/wm/p0002/employeeSearch_Init.do", "a", "width=480, height=700, left=100, top=50");
		}
	}
	
	function setEmployee(){
		employeeCode=document.getElementById("PemployeeCode").value;
		employeeName=document.getElementById("PemployeeName").value;
		departmentName=document.getElementById("PdepartmentName").value;
		positionName=document.getElementById("PpositionName").value;
		vacationremainDate=document.getElementById("PvacationremainDATE").value;
		mySheet.SetCellText(row,col,employeeCode);
		mySheet.SetCellText(row,col+1,employeeName);
		mySheet.SetCellText(row,col+2,departmentName);
		mySheet.SetCellText(row,col+3,positionName);	
		mySheet.SetCellText(row,col+4,vacationremainDate);
		
		if(vacationremainDate== ""){
			mySheet.SetCellValue(row,7,"12");
			}
	}
	
	function mySheet_OnSearchEnd(){
		var duprows = mySheet.ColValueDupRows("3",{"IncludeDelRow" : 1, "IncludeFirstRow" : 0});
		
		arrRow = duprows.split(",");
		for(idx=0; idx<arrRow.length; idx++){
			mySheet.SetRowEditable(arrRow[idx],0);
			mySheet.SetRowBackColor(arrRow[idx],"#C0C0C0");
		}	
	}
	
	
	function mySheet_OnSaveEnd(){
		mySheet.DoSearch("${contextPath}/wm/p0002/searchList.do", param);
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

	}

	function selectDept() {

		var SiteList = $('#SiteList').val();

		$
				.ajax({

					url : "${contextPath}/sm/p0006/DeptList.do",//목록을 조회 할 url

					type : "POST",

					data : {
						"SiteList" : SiteList
					},

					dataType : "JSON",

					success : function(data) {
						$(".1").remove();

						for (var i = 0; i < data['Data'].length; i++) {

							var option = "<option class='1' value='" + data['Data'][i].department_NAME + "'>"
									+ data['Data'][i].department_NAME
									+ "</option>";

							//대상 콤보박스에 추가
							$('#DeptList').append(option);

						}

					},

					error : function(jqxhr, status, error) {

						alert("에러");

					}

				});

	}
	
	
</script>

<style type="text/css">
.title {
    width:100%;
   color: #2C3E50;
   font-weight: bold;
   font-size: 20px;
   padding-left : 30px;
   padding-bottom: 10px;
   padding-top:20px;
   border-top: thin solid #5E5E5E;
   border-bottom: thin dashed #5E5E5E;
   position: absolute;
   top: 50px;

}
.leftbuttons{
   margin-top:40px;
   margin:10px;
   position: absolute;
   left: 0px;
}
.rightbuttons{
   margin-top:40px;
   margin:10px;
   position: absolute;
   right: 0px;
}
 .IBbutton {
   font-size: 13px;
   margin-left: 5px;
   border:0;
   background-color: #2B69A0;
   color: white;
   padding: 5px 15px;
   border-radius: 7px;
   text-decoration: none;   
}
.IBbutton:hover {
background-color: #2C3E50;
}
.left {
	position: relative;
	top: 130px;
	left: 60px;
	width: 1000px;
}
.searchBarTitle {
	background: #5E5E5E;
	padding: 4px;
	color: white;
	border-radius: 5px;
	margin: 0 5px 0 70px;
	vertical-align: middle;
	margin-left: 36px;
}
#searchBar {
	background: #EBEBEB;
	padding: 20px 20px;
	margin-bottom: 20px;
	border-radius: 5px;
	font-size: 12px;
	border-radius:5px;
	width: 1243px;
}
#searchBar input, select {
	height: 24px;
	border-radius: 3px;
	border: none;
	padding-left: 5px;
	vertical-align: middle;
	text-align: center;
}
#date{
    width: 130px;
}

.ui-datepicker{ font-size: 12px; width: 160px; }
.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
#searchBar img {vertical-align: middle; padding: 0px 5px 0px 2px; }
	
	</style>

</head>
<body onload="LoadPage()">
	<form name="frm">
        <div class="leftbuttons">  
		<button type="button" onclick="doAction('down')" class="IBbutton">엑셀</button>
        </div> 
        
        <div class="rightbuttons">
		<button type="button" onclick="doAction('reset')" class="IBbutton">초기화</button>
		<button type="button" onclick="doAction('search')" class="IBbutton">조회</button>
		<button type="button" onclick="doAction('insert')" class="IBbutton">추가</button>
		<button type="button" onclick="doAction('save')" class="IBbutton">저장</button>
		</div>

		<div class="title"> 
        <header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 근태관리 : 휴가관리</header>
        </div>
        
        <div class="left">
        <div id="searchBar">
            <span class="searchBarTitle">귀속연월</span> <input type="text" id="date"><img id="btn_monthpicker" src="${contextPath}/resources/image/icons/icon_calendar.png">
		    <span class="searchBarTitle">근태종류</span> <select id="vacaTYPE">
			<option value="" selected>전체</option>
			<option value="연차" >연차</option>
			<option value="특별휴가" >특별휴가</option>
			<option value="경조휴가" >경조휴가</option>
		</select>
		<span class="searchBarTitle">사업장</span> <select id="SiteList"  onchange="selectDept()">
			<option value="" selected>전체</option>
		</select>
		<span class="searchBarTitle">부서</span><select id="DeptList">
			<option value="" selected>전체</option>
		</select>
		<span class="searchBarTitle" >조회조건</span><select id="Employee_Select" style="width: 70px;">
		    <option value="" selected>구분</option>
			<option value="employee_name">사원명</option>
			<option value="employee_code">사원코드</option>
		</select>
		<input type="text" id="p_text" placeholder="내용을 입력해주세요.">
        </div>
		</div>

		<div style="position: absolute; top: 220px; left: 70px;">
			<script type="text/javascript">
				createIBSheet("mySheet", "1500px", "600px");
				selectSite();
				selectDept();
			</script>
		</div>
    <input type="hidden" id="PemployeeCode">
	<input type="hidden" id="PemployeeName">
	<input type="hidden" id="PdepartmentName">
	<input type="hidden" id="PpositionName">
	<input type="hidden" id="PvacationremainDATE">

	</form>
</body>