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
	
	
	function setSite(){
		site_code=document.getElementById("Psite_code").value;
		site_name=document.getElementById("Psite_name").value;
	};

	
	function setEmployee(){
		employee_code=document.getElementById("Pemployee_code").value;
		employee_name=document.getElementById("Pemployee_name").value;
	};
	
	function setHrrnp(){
		hr_rnp_code=document.getElementById("Phr_rnp_code").value;
		hr_rnp_name=document.getElementById("Phr_rnp_name").value;
	};



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
		    
		    $("#date2").change(function() {
		    	if($("#date").val()>$("#date2").val()){
		    		alert("종료일이 시작일 보다 커야합니다.");
		    		$(this).val("");
		    		return;
		    	}
		    	});
		});


		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = { SearchMode : smLazyLoad, ToolTip : 1, MouseHoverMode : 2 };
		initSheet.HeaderMode = { Sort : 1, ColMove : 1, ColResize : 10, HeaderCheck : 1 };
		initSheet.Cols = [ 
			 {Header:"NO",Type:"Seq",SaveName:"NUMBER",Width:60, Align:"Center" },
		        {Header:"사원코드",Type:"Text",SaveName:"employee_code", Width:60,  Align:"Center", Edit: 0},	
		        {Header:"사원명",Type:"Text",SaveName:"employee_name", Width:170, Align:"Center", Edit: 0},
				{Header:"구분",Type:"Text",SaveName:"hr_rnp_index", Width:170, Align:"Center", Edit: 0},
				{Header:"포상/징계명",Type:"Text",SaveName:"rnp_name", Width:185, Align:"Center", Edit: 0},
				{Header:"포상/징계일자",Type:"Text",SaveName:"hr_rnp_date", Width:175, Align:"Center", Edit: 0},
				{Header:"포상/징계내역",Type:"Text",SaveName:"hr_rnp_history", Width:175, Align:"Center", Edit: 0},
				{Header:"시행처",Type:"Text",SaveName:"hr_rnp_institute", Width:175, Align:"Center", Edit: 0},
				{Header:"금액",Type:"Int",SaveName:"hr_rnp_cost", Width:175, Align:"Center", Edit: 0},
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
	}

	function doAction(sAction) {
		switch (sAction) {
		case "search":
			var param = FormQueryStringEnc(document.frm);
		    mySheet.DoSearch("${contextPath}/hm/p0033/searchList2.do", param);
			break;
		case "reset":
			mySheet.RemoveAll();
			$('#Phr_rnp_name').attr('value', "");
			$('#Psite_name').attr('value', "");
			$('#Pemployee_name').attr('value', "");
			$('#date').attr('value', "");
			$('#date2').attr('value', "");
			break;
			
		  case "down":
		 	mySheet.Down2Excel();
			break;		
			  
		}
	}
	
	 function showPopup1() {
		 var url = '${contextPath}/hm/p0033/searchHrrnp.do';

		 window.open(url, "a", "width=480, height=650, left=100, top=50");
	  
	  }
	 
	 function showPopup2() {
		 var url = '${contextPath}/hm/p0033/searchSite.do';

		 window.open(url, "a", "width=480, height=650, left=100, top=50");
	  
	  }
	 
	 function showPopup3() {
		 var url = '${contextPath}/hm/p0033/searchEmployeename.do';

		 window.open(url, "a", "width=480, height=650, left=100, top=50");
	  
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

.searchBarTitle {
	background: #5E5E5E;
	padding: 4px;
	color: white;
	border-radius: 5px;
	margin: 0 5px 0 80px;
	vertical-align: middle;
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
#searchBar {
	background: #EBEBEB;
	padding: 10px 30px;
	margin-bottom: 20px;
	border-radius: 5px;
	font-size: 12px;
	border-radius:5px;
}
.left {
	position: relative;
	top: 80px;
	left: 30px;
	width: 1350px;
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
        </div>
        
        <div class="left">
        <div id="searchBar">
            &nbsp;&nbsp; 
            <span class="searchBarTitle">상벌명</span> <input type="text" id="Phr_rnp_name"><a href="javascript:showPopup1();"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <span class="searchBarTitle">사업장</span> <input type="text" id="Psite_name"><a href="javascript:showPopup2();"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
           <br><br>
            &nbsp;&nbsp;          
           <span class="searchBarTitle">사원명</span> <input type="text" id="Pemployee_name"><a href="javascript:showPopup3();"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          
           <span class="searchBarTitle"> 포상/징계일자</span> <input type="text" id="date" class="Datepicker">
             ~ <input type="text" id="date2" class="Datepicker">
           
        </div>
		</div>

		<div style="position: absolute; top: 180px; left: 40px;">
			<script type="text/javascript">
				createIBSheet("mySheet", "1500px", "480px");
			</script>
		</div>
      <input type="hidden" id="Psite_code" >
      <input type="hidden" id="Pemployee_code" >
      <input type="hidden" id="Phr_rnp_code" >
      

	</form>
</body>