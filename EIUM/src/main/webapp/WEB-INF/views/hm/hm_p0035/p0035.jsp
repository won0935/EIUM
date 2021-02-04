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
<link rel="stylesheet"href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"	type="text/css" />
<script type="text/javascript" src="${contextPath}/resources/js/jquery.mtz.monthpicker.js"></script>
<script type="text/javascript">
	var pageheightoffset = 200; //시트높이 계산용

	//sheet 기본설정
	function LoadPage() {
		mySheet.SetWaitImageVisible(0);
		
		/* MonthPicker 옵션 */
	    var options = {
	        pattern: 'yyyy/mm',  
	        buttonImage: "${contextPath}/resources/image/icons/icon_calendar.png", 
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	    };
	     
	    /* MonthPicker Set */
	    $('input[class=monthpicker]').monthpicker(options);
	     
	    /* 버튼 클릭시 MonthPicker Show */
	    $('img[name=btn_monthpicker]').on('click', function () {
	        $(this).prev().monthpicker('show');    	
	        	

	    });
	    
	    $("#searchDate2").change(function() {
	    	if($("#searchDate1").val()>$("#searchDate2").val()){
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
		initSheet.Cols = [ { "Header" : "사원코드", "SaveName" : "employee_CODE", "Type" : "Text", "Width" : 100, "Align" : "Center", "UpdateEdit":0 },
			               { "Header" : "사원명", "SaveName" : "employee_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center", "UpdateEdit":0 },
			               { "Header" : "부서", "SaveName" : "department_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center", "UpdateEdit":0 },
			               { "Header" : "직책", "SaveName" : "duty_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center", "UpdateEdit":0 },
			               { "Header" : "입사일", "SaveName" : "employee_JOIN_DATE", "Type" : "Text", "Width" : 100, "Align" : "Center", "UpdateEdit":0 },
			               { "Header" : "직종", "SaveName" : "job_CLASS_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center", "UpdateEdit":0 },
			               { "Header" : "급여형태", "SaveName" : "pay_TYPE_NAME", "Type" : "Text", "Width" : 100, "Align" : "Center", "UpdateEdit":0 },
			               { "Header" : "계약시작월", "SaveName" : "contract_START_MONTH", "Type" : "Date", "Width" : 100, "Align" : "Center", "Format" : "Ym", "UpdateEdit":0 },
			               { "Header" : "연봉", "SaveName" : "contract_YEAR_PAY", "Type" : "Int", "Width" : 100, "Align" : "Center", "UpdateEdit":0, "Format":"Integer" },
			               { "Header" : "월급", "SaveName" : "contract_MONTH_PAY", "Type" : "Int", "Width" : 100, "Align" : "Center", "UpdateEdit":0, "Format":"Integer" },
			               { "Header" : "일급", "SaveName" : "contract_DAY_PAY", "Type" : "Int", "Width" : 100, "Align" : "Center", "UpdateEdit":0, "Format":"Integer" },
			               { "Header" : "시급","SaveName" : "contract_TIME_PAY","Type" : "Int","Width" : 100, "Align" : "Center", "UpdateEdit":0, "Format":"Integer" }
		                 ];

		IBS_InitSheet(mySheet, initSheet);
		mySheet.SetEditableColorDiff(1);
		mySheet.SetActionMenu("엑셀 파일 저장");
		mySheet.SetSelectionMode(1);
	}

	function doAction(sAction) {
		switch (sAction) {
		case "search":
			var param = FormQueryStringEnc(document.frm);
		    mySheet.DoSearch("${contextPath}/hm/p0035/searchList.do", param);
			break;
		case "reset":
			mySheet.RemoveAll();
			$("form").each(function() {  
	            this.reset();
	         });  
			break;
	    case "down":
	        mySheet.Down2Excel();
	        break;

		}

	}

</script>


<script>
	function selectSite() {

		$.ajax({

					url : "${contextPath}/hm/p0035/SiteList.do",//목록을 조회 할 url

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

	function selectDept() {

		var SiteList = $('#SiteList').val();

		$
				.ajax({

					url : "${contextPath}/hm/p0035/DeptList.do",//목록을 조회 할 url

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

	};
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
	margin-left: 85px;
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
	width: 800px;
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
        <header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 인사관리 : 책정임금현황</header>
        </div>
        
        <div class="left">
        <div id="searchBar">
        <span class="searchBarTitle">사업장</span> <select id="SiteList" onchange="selectDept()">
			<option value="" selected>전체</option>
		</select>
		<span class="searchBarTitle">부서</span> <select id="DeptList">
			<option value="" selected>전체</option>
		</select>
		<span class="searchBarTitle">계약시작월</span> <input id="searchDate1" class="monthpicker"
				type="text" style="width: 100px;"> <img name="btn_monthpicker"
				src="${contextPath}/resources/image/icons/icon_calendar.png">
				~ <input id="searchDate2" class="monthpicker"type="text" style="width: 100px;"> 
				<img name="btn_monthpicker" src="${contextPath}/resources/image/icons/icon_calendar.png">
		<span class="searchBarTitle">퇴사자</span> <select id="resigner">
		<option value='0'selected>0.제외</option>
		<option value='1'>1.포함</option>
		</select>
        </div>
		</div>

		<div style="position: absolute; top: 220px; left: 70px;">
			<script type="text/javascript">
				createIBSheet("mySheet", "1500px", "600px");
				selectSite();
			</script>
		</div>

	</form>
</body>