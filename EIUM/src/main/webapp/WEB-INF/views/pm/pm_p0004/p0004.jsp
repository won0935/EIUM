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
	function setPayment(){
	payment_code=document.getElementById("Ppayment_code").value;
	payment_date=document.getElementById("Ppayment_date").value;
	payment_des_name=document.getElementById("Ppayment_des_name").value;
};


	function LoadPage() {
		mySheet.SetWaitImageVisible(0);

		
		//아이비시트1 
		mySheet.RemoveAll();
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [		
	        {Header:"NO",Type:"Seq",SaveName:"NUMBER",Width:60, Align:"Center" },
	        {Header:"은행",Type:"Text",SaveName:"bank_name", Width:155,  Align:"Center", Edit: 0},	
	        {Header:"사원코드",Type:"Text",SaveName:"employee_code", Width:155,  Align:"Center", Edit: 0},	
	        {Header:"사원명",Type:"Text",SaveName:"employee_name", Width:155, Align:"Center", Edit: 0},
			{Header:"계좌번호",Type:"Text",SaveName:"account_number_1", Width:250, Align:"Center", Edit: 0},
			{Header:"예금주명",Type:"Text",SaveName:"account_name_1", Width:155, Align:"Center", Edit: 0},
			{Header:"지급구분",Type:"Text",SaveName:"payment_receipt_item", Width:155, Align:"Center", Edit: 0},
			{Header:"실지급액",Type:"Int",SaveName:"payment_receipt_price", Width:155, Align:"Center", Edit: 0},
			{Header:"지급일자",Type:"Text",SaveName:"payment_date", Width:155, Align:"Center", Format:"Ymd", Edit: 0 }
		];   
		IBS_InitSheet( mySheet , initSheet);
  
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		
		//아이비시트2------------------------------------------------------
		
		
		
		
		/* MonthPicker 옵션 */
	    options = {
	        pattern: 'yy/mm', // Default is 'mm/yyyy' and separator char is not mandatory
	        selectedYear: 2019,
	        startYear: 2008,
	        finalYear: 2019,
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
			mySheet.DoSearch("${contextPath}/pm/p0004/searchList.do", param);
			//조회조건에 맞도록 조회하기
			break;

		case "reload": //초기화
			mySheet.RemoveAll();
			$('#monthpicker').attr('value', "");
			$('#Ppayment_date').attr('value', "");
			$('#searchBank').find('option:first').attr('selected', 'selected');
			$('#searchSite').find('option:first').attr('selected', 'selected');
			$('#searchTYPE').find('option:first').attr('selected', 'selected');
			

			break;
			
		 case "down":
		     mySheet.Down2Excel();
		    break;
		}
	}
	
	
	

	//로우 클릭시
function mySheet_OnClick(Row, Col) { 
			x = "x=" + mySheet.GetCellValue(Row, 1);
			var param = "x="+mySheet.GetCellValue(Row, 1)+"&y="+mySheet.GetCellValue(Row, 3);
			mySheet2.DoSearch("${contextPath}/pm/p0004/searchReceipt.do", param);

	}
	
	
/* function mySheet2_OnDblClick(Row,Col,Value){
	row=Row;
	col=Col;
	
	if(Col=="4"){
		
	window.open("${contextPath}/pm/p0001/paygrade_Search.do", "a", "width=500, height=700, left=100, top=50"); 
	}
} */

	
	 function showPopup() {
		 var monthpicker = $('#monthpicker').val();
		 var url = '${contextPath}/pm/p0004/searchPaymentdate.do?monthpicker='+monthpicker;

		 window.open(url, "a", "width=480, height=650, left=100, top=50");
	  
	  }
	 

	
	 

	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	
	  
	function selectBank() {

		$.ajax({

					url : "${contextPath}/pm/p0004/BankList.do",//목록을 조회 할 url

					type : "POST",

					dataType : "JSON",

					success : function(data) {

						for (var i = 0; i < data['Data'].length; i++) {
							
							

							var option = "<option name='1' value='" + data['Data'][i].bank_name + "'>"
									+ data['Data'][i].bank_name + "</option>";

							//대상 콤보박스에 추가

							$('#searchBank').append(option);

						}

					},

					error : function(jqxhr, status, error) {

						alert("에러");

					}

				});

	};
	  
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

							$('#searchSite').append(option);

						}

					},

					error : function(jqxhr, status, error) {

						alert("에러");

					}

				});

	};
	  
	function selectType() {

		var searchSite = $('#searchSite').val();
		console.log(searchSite);

		$
				.ajax({

					url : "${contextPath}/pm/p0001/TypeList.do",//목록을 조회 할 url

					type : "POST",

					data : {
						"searchSite" : searchSite
					},

					dataType : "JSON",

					success : function(data) {
						$(".1").remove();				
							for (var i = 0; i < data['Data'].length; i++) {

							var option = "<option class='1' value='" + data['Data'][i].department_name + "'>"
									+ data['Data'][i].department_name
									+ "</option>";

							//대상 콤보박스에 추가
							$('#searchTYPE').append(option);

						
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

.searchBarTitle {
	background: #5E5E5E;
	padding: 4px;
	color: white;
	border-radius: 5px;
	margin: 0 5px 0 80px;
	vertical-align: middle;
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
	top: 110px;
	left: 30px;
	width: 1400px;
}

.right{
	position: relative;
	top: -140px;
 	left: 450px;
	width: 750px;
	
}

.bottom{
	top:-60px;
	position: relative;
	padding: 60px;	
	width: 1053px;
	margin-bottom: 50px;
	
}
#searchBar {
	background: #EBEBEB;
	padding: 15px 225px;
	margin-bottom: 30px;
	border-radius: 5px;
	font-size: 12px;
}

#bottomBar {
	background: #EBEBEB;
	width :100%;
	border-radius: 5px;
	font-size: 12px;
	margin-bottom: 50px;
	
}

.left input{
	height: 22px;
	width: 100px;
	border-radius: 3px;
	border: none;
	padding-left:5px;
	vertical-align: middle;
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
	background: #5E5E5E;
	padding: 5px 5px;
	color: white;
	border-radius: 5px;
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
		<a href="javascript:doAction('down')" class="IBbutton">엑셀</a>
	</div>
	<div class="rightbuttons">
		<a href="javascript:doAction('reload')" class="IBbutton">초기화</a> 
		<a href="javascript:doAction('search')" class="IBbutton">조회</a>
	</div>

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 급여관리 : 급상여이체현황
		</header>
	</div>
	<div class="left">
	     <div id="searchBar">
	     
            <span class="searchBarTitle">귀속연월</span> <input id="monthpicker" type="text">
			<img id="btn_monthpicker"  src="${contextPath}/resources/image/icons/icon_calendar.png">
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		  <span class="searchBarTitle">지급일</span> <a href="javascript:showPopup();"><img src="${contextPath}/resources/image/icons/icon_plus.png"></a><input type="text" id="Ppayment_date"><br><br>
		 <span class="searchBarTitle">은행구분</span> <select id="searchBank">
			<option value="all" selected>전체</option>
			</select>  
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <span class="searchBarTitle">사업장구분</span> <select id="searchSite" onchange="selectType()">
			<option value="all" selected>전체</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <span class="searchBarTitle">부서</span> <select id="searchTYPE">
		  	<option value="all" selected>전체</option>
		</select> 
		</div>
		<input type="hidden" id="Ppayment_code">
		<input type="hidden" id="Ppayment_des_name">
		
		<div style="position: absolute; top: 110px;">
		<script>
		createIBSheet("mySheet", "1500px", "600px");
		selectBank();
		selectSite();
		selectType();
		</script>
		</div>
	</div>

	
</form>



</body>
</html>