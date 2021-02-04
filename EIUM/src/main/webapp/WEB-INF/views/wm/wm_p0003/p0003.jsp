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
		
		  //달력 API
		$(function() {
		    $( ".Datepicker" ).datepicker({
		    	dateFormat: "yy-mm-dd",
		    	showOn: "both", 
		        buttonImage: "${contextPath}/resources/image/icons/icon_calendar.png", 
		        buttonImageOnly: true , 
		         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		  });
		});
		  
		$("#date2").change(function() {
	    	if($("#date").val()>$("#date2").val()){
	    		alert("종료일이 시작일 보다 커야합니다.");
	    		$(this).val("");
	    		return;
	    	}
	    	});


		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = { SearchMode : smLazyLoad, ToolTip : 1, MouseHoverMode : 2 };
		initSheet.HeaderMode = { Sort : 1, ColMove : 1, ColResize : 10, HeaderCheck : 1 };
		initSheet.Cols = [ 
			               { "Header" : "휴가고유코드", "SaveName" : "vacation_CODE", "Type" : "Text", "Width" : 150, "Align" : "Center", "Hidden" : 1 }, 
			               { "Header" : "사원코드", "SaveName" : "employee_CODE", "Type" : "Text", "Width" : 150, "Align" : "Center" }, 
			               { "Header" : "사원명", "SaveName" : "employee_NAME", "Type" : "Text", "Width" : 150, "Align" : "Center" },
			               { "Header" : "부서명", "SaveName" : "department_NAME", "Type" : "Text", "Width" : 150, "Align" : "Center" },
			               { "Header" : "직급", "SaveName" : "position_NAME", "Type" : "Text", "Width" : 150, "Align" : "Center" },
			               { "Header" : "신청 전 잔여일수", "SaveName" : "before_VACATION_REMAIN_DATE", "Type" : "Text", "Width" : 150, "Align" : "Center", "Hidden" : 1 },
			               { "Header" : "근태종류", "SaveName" : "vacation_TYPE", "Type" : "Text", "Width" : 150, "Align" : "Center" },
			               { "Header" : "시작일", "SaveName" : "vacation_START_DATE", "Type" : "Text", "Width" : 150, "Align" : "Center", "Format":"Ymd" },
			               { "Header" : "종료일", "SaveName" : "vacation_END_DATE", "Type" : "Text", "Width" : 150, "Align" : "Center", "Format":"Ymd" },
			               { "Header" : "신청일수", "SaveName" : "vacation_APPLY_DATE", "Type" : "Text", "Width" : 150, "Align" : "Center" },
			               { "Header" : "신청 후 잔여일수", "SaveName" : "after_VACATION_REMAIN_DATE", "Type" : "Text", "Width" : 150, "Align" : "Center", "CalcLogic":"|7|-|11|", "Hidden" : 1 } 
		                 ];

		IBS_InitSheet(mySheet, initSheet);
		mySheet.SetEditableColorDiff(1);
		mySheet.SetActionMenu("엑셀 파일 저장");
		mySheet.SetSelectionMode(1);
		mySheet.SetColEditable(0, 0);
		mySheet.SetColEditable(1, 0);
		mySheet.SetColEditable(2, 0);
		mySheet.SetColEditable(3, 0);
		mySheet.SetColEditable(4, 0);
		mySheet.SetColEditable(5, 0);
		mySheet.SetColEditable(6, 0);
		mySheet.SetColEditable(7, 0);
		mySheet.SetColEditable(8, 0);
		mySheet.SetColEditable(9, 0);
		mySheet.SetColEditable(10, 0);
	}

	function doAction(sAction) {
		switch (sAction) {
		case "search":
			var param = FormQueryStringEnc(document.frm);
		    mySheet.DoSearch("${contextPath}/wm/p0003/searchList.do", param);
			break;
		case "reset":
			mySheet.RemoveAll();
			$("form").each(function() {  
	            this.reset();
	         });  
			break;
		case "down":
			var param = { Mode : -1 };
	        mySheet.Down2Excel(param);
	        break;
		}
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
.searchBarTitle {
	background: #5E5E5E;
	padding: 4px;
	color: white;
	border-radius: 5px;
	margin: 0 5px 0 70px;
	vertical-align: middle;
	margin-left: 1px;
}
#searchBar {
	background: #EBEBEB;
	padding: 20px 20px;
	margin-bottom: 20px;
	border-radius: 5px;
	font-size: 12px;
	border-radius:5px;
	width: 1165px;
}
#searchBar input, select {
	height: 24px;
	border-radius: 3px;
	border: none;
	padding-left: 5px;
	vertical-align: middle;
	text-align: center;
}
.left {
	position: relative;
	top: 130px;
	left: 60px;
	width: 1000px;
}
#date, #date2{
    width: 100px;
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
		</div>

		<div class="title"> 
        <header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 근태관리 : 휴가내역</header>
        </div>
        
        <div class="left">
        <div id="searchBar">
            <span class="searchBarTitle">사용일자</span> <input type="text" id="date" class="Datepicker">
             ~ <input type="text" id="date2" class="Datepicker">
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
            <span class="searchBarTitle" >조회조건</span><select id="Employee_Select" style="width: 80px;">
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

	</form>
</body>