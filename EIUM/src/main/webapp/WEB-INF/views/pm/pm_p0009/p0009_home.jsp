<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<link href="${contextPath}/resources/tab/css/ibtab-style.css"rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js"type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js"type="text/javascript"></script>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<link rel="stylesheet"href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"	type="text/css" />
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.mtz.monthpicker.js"></script>
<script language="javascript">

var graphColors = (function() {
	var colors = [];
	colors[0]="#1ABC9C";
	colors[1]="#3498DB";
	colors[2]="#2C3E50";
	colors[3]="#2980B9";
	colors[4]="#376092";
	colors[5]="#95B3D7";
	colors[6]="#B9CDE5";
	colors[7]="#DCE6F2";
	colors[8]="#4291E9";
	colors[9]="#C9E1F5";
	colors[10]="#00B050";
	colors[11]="#1ABC9C";
	colors[12]="#3498DB";
	colors[13]="#2C3E50";
	colors[14]="#92D050";
	colors[15]="#90B7CE";

	return colors;
}());
	/*Sheet 기본 설정 */
	function LoadPage() {
		//IbSheet Wiwdth function
		var colWidth = (function(){
			var width = $('#searchBar').width();

			return ((width+100)/8);
		}());
		//컬러 fnction
		
		
		//아이비시트1 
		mySheet.RemoveAll();
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0,SumPosition:1};
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [		
			{Header:"상태",Type:"Status",SaveName:"STATUS" ,Hidden:1},
	        {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",Hidden:1},	
	        {Header:"부서코드",Type:"Text",SaveName:"department_CODE",MinWidth:0.75*colWidth,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"부서명",Type:"Text",SaveName:"department_NAME",MinWidth:colWidth,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"사원코드",Type:"Text",SaveName:"employee_CODE",MinWidth:0.75*colWidth,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"사원명",Type:"Text",SaveName:"employee_NAME",MinWidth:colWidth,KeyField:1,Edit:0,Align:"Center"},	
			{Header:"기본급",Type:"AutoSum",SaveName:"basic_SALARY",MinWidth:colWidth,Edit:0,Align:"Right"},			
			{Header:"직책수당",Type:"AutoSum",SaveName:"position_SALARY",MinWidth:colWidth,Edit:0,Align:"Right"},
			{Header:"상여",Type:"AutoSum",SaveName:"bonus_SALARY",MinWidth:colWidth,Edit:0,AutoSum:1,Align:"Right"},
			{Header:"지급합계",Type:"AutoSum" ,CalcLogic:' (|6| + |7|+ |8|) ', SaveName:"total_SALARY",MinWidth:1.5*colWidth,Edit:0,Align:"Right"},
			{Header:"payment_DATE1",Type:"Text", SaveName:"payment_DATE1",Hidden:1},
			{Header:"payment_DATE2",Type:"Text", SaveName:"payment_DATE2",Hidden:1},
			{Header:"payment_DES_NAME",Type:"Text", SaveName:"payment_DES_NAME",Hidden:1}
			
		];   
		IBS_InitSheet( mySheet , initSheet);
  
		mySheet.SetSheetHeight(350);
		mySheet.ShowSubSum([{
            "StdCol": '3',
            "SumCols": "6|7|8|9",
            "CaptionText" : "소계"
        }]);
		mySheet.SetWaitImageVisible(0);
		
		(function selectSite() {
			
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

						}
					});
		})();
		  
		
	
		/* MonthPicker 옵션 */
	    var options = {
	        pattern: 'yy/mm',  
	        buttonImage: "${contextPath}/resources/image/icons/icon_calendar.png", 
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	    };
	     
	    /* MonthPicker Set */
	    $('#monthpicker').monthpicker(options);
	     
	    /* 버튼 클릭시 MonthPicker Show */
	    $('#btn_monthpicker').bind('click', function () {
	        $('#monthpicker').monthpicker('show');
	    });
		

	    mySheet.DoSearch("${contextPath}/pm/p0009/searchList.do");	    
	}//LoadPage

	
	function selectDept() {
		if($('#Ppayment_code').val()==""){
			alert("지급일을 먼저 설정해주세요.");
			return false;
		}
		
		var SiteList = $('#searchSite').val();
		$.ajax({
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
					
					}
				});
	};
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "excel":
			
			var params = { FileName : "월별지급현황.xls", SheetName : "Sheet1"} ;
			mySheet.Down2Excel(params);
			break;
		case "search": //조회
			var param = FormQueryStringEnc(document.frm);
			console.log(param);
		
			mySheet.DoSearch("${contextPath}/pm/p0009/searchList.do",param);
			break;

		case "reload": //초기화	
			mySheet.RemoveAll();
	 		$('#searchBar').find('input','select').val(''); 
	 		$("#payByDep").empty();
	 		$("#payByType").empty();
			break;

		}
	}


	// 저장완료 후 처리할 작업
	function mySheet_OnSearchEnd(code, msg) {
		
		$("input[name=payment_DATE1]").val(mySheet.GetCellValue(1,10));
		$("#Ppayment_date").val(mySheet.GetCellValue(1,11));
		$("#Ppayment_des_name").val(mySheet.GetCellValue(1,12));
	
		
		var subPieData=[],genPieData=[];
		var barNames=[],barBasic_SALARY=[],barPosition_SALARY=[],barBonus_SALARY=[],barTotal_SALARY=[];
		
		var subrow = mySheet.FindSubSumRow().split("|");
		var colorSelect=0;
		 for(var i = 1; i<=mySheet.GetDataLastRow();i++){
			 if(subrow.includes(i.toString())){		
				subPieData.push({		//파이소계행
					name: mySheet.GetCellValue(i-1,3),
					y: mySheet.GetCellValue(i,9),
					color: graphColors[colorSelect]
				})
					colorSelect++;
			}else{
				//막대그래프
				barNames.push(mySheet.GetCellValue(i,5));
				barBasic_SALARY.push(mySheet.GetCellValue(i,6));
				barPosition_SALARY.push(mySheet.GetCellValue(i,7));
				barBonus_SALARY.push(mySheet.GetCellValue(i,8));
				barTotal_SALARY.push(mySheet.GetCellValue(i,9));
				
				genPieData.push({			//파이일반행
					name: mySheet.GetCellValue(i,5),
					y: mySheet.GetCellValue(i,9),
					color: graphColors[colorSelect]
				});	  				
			}
		} 
				
		// 막대
			Highcharts.chart('payByType', {
			    title: {
			    	text : '지급구분 사원별 지급액',
					verticalAlign : 'bottom',
					align: 'center',
					x: 30,
					style : {
						color : '#111820',
						fontFamily : 'san-serif',
						fontSize : '18px',
						fontWeight: 'bold'

					}
			    },
			    legend: {
				    align: 'left',
				    layout: 'vertical',
				    verticalAlign: 'bottom',
				    x: 0,
				    y: -50
				},
			    xAxis: {
			        categories: barNames
				},
				  
			    yAxis: [{ // Primary yAxis
			        labels: {
			        	format: '{value:,.0f}'
			        },
			        title: {
			            text: '금액',
			        }
			    }],
			    
			
			    series: [{
			        type: 'column',
			        color: graphColors[0],
			        name: '기본급',
			        data: barBasic_SALARY
			    }, {
			        type: 'column', 
			        color: graphColors[1],
			        name: '직책수당',
			        data: barPosition_SALARY
			        
			    }, {
			        type: 'column', color: graphColors[2],
			        name: '상여',
			        data: barBonus_SALARY
			        
			    }, {
			        type: 'spline', color: '#212121',
			        name: '합계',
			        data: barTotal_SALARY,
			        marker: {
			            lineWidth: 2,
			            lineColor: '#212121'
			         
			        }
			    }]
			});
				 
		 Highcharts.chart('payByDep', {
			
			    chart: {
			        type: 'pie'
			    },
			    title: {
			        text: '부서별 지급액',
			        verticalAlign : 'bottom',
					align: 'center',
					style : {
						color : '#111820',
						fontFamily : 'san-serif',
						fontSize : '18px',
						fontWeight: 'bold'
					}
			    },
			    legend: {
				    align: 'left',
				    layout: 'vertical',
				    verticalAlign: 'bottom',
				    x: -20,
				    y: -40,  
				    floating:true
				},
			    plotOptions: {
			    	pie: {
			            allowPointSelect: true,
			            cursor: 'pointer',
			            dataLabels: {
			                enabled: false
			            }    
			        }
			    },
			    tooltip: {
			        valueSuffix: '원'
			    },
			    series: [{
			        name: '금액',
			        data: subPieData,
			        size: '60%',
			        id: 'subPieData',
			        showInLegend: true
			    }, {
			        name: '금액',
			        data: genPieData,
			        size: '80%',
			        innerSize: '60%',
			        showInLegend: false,
			        id: 'genPieData'
			    }],
			  
			});	
		
	}
	
	
	 function payPopup() {
		 var monthpicker = $('#monthpicker').val();
		 if(monthpicker==""){
			 alert("귀속년월을 지정해주세요.");
			 return;
		 }
		 var url = '${contextPath}/pm/p0001/searchPaymentdate.do?monthpicker='+monthpicker;

		 window.open(url, "a", "width=342,height=520,resizable = no, scrollbars = no");
	  
	  }
	 function setPayment(){}
	
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

#searchBar {
	position: relative;
	top: 110px;
	background: #EBEBEB;
	padding: 20px 100px 20px 0px;
	border-radius: 5px;
	font-size: 12px;
	border-radius: 5px;
	vertical-align: middle;
	width: 90%;
}
.searchBarTitle {
	background: #5E5E5E;
	padding: 4px;
	color: white;
	border-radius: 5px;
	margin: 0 5px 0 70px;
	vertical-align: middle;
}

#searchBar input, select {
	height: 24px;
	border-radius: 3px;
	border: none;
	padding-left: 5px;
	vertical-align: middle;
}

#searchBar img {
	margin: 0 10px 0 3px;
	vertical-align: middle;
}
#mySheet{
position: relative;
top:115px;
width: 100%;
z-index:100;
}

.payByDep {
	position:relative;
	top:100px;
	left:70px;
	width: 350px;
	height: 340px;
	z-index:10;
}
.payByType {
position:relative;
	top:-220px;
	left:480px;
	width: 1150px;
	height: 320px;
}

</style>
</head>
<body onload="LoadPage()" style="overflow: hidden;">
	<div class="leftbuttons">
		<a href="javascript:doAction('excel')" class="IBbutton">엑셀</a>
	</div>
	<div class="rightbuttons">
		<a href="javascript:doAction('reload')" class="IBbutton">초기화</a> <a href="javascript:doAction('search')" class="IBbutton">조회</a>
	</div>

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 급여관리 : 월별지급현황
		</header>
	</div>


	<div id="searchBar">
		<form name="frm">
			<span class="searchBarTitle">귀속연월</span> <input id="monthpicker"
				type="text" style="width: 100px;" name="payment_DATE1"> <img id="btn_monthpicker"
				src="${contextPath}/resources/image/icons/icon_calendar.png">
			<span class="searchBarTitle">지급일</span> 
			<input type="hidden" id="Ppayment_code">
			
			<a href="javascript:payPopup();" style="text-decoration: none;"> <input
				type="text" id="Ppayment_date" style="width: 100px;">
				<input type="text" id="Ppayment_des_name" style="width:50px;"> 
				<img src="${contextPath}/resources/image/icons/icon_plus.png">
			</a> <span class="searchBarTitle">사업장구분</span> <select id="searchSite"
				style="width: 150px;" onclick="selectDept()">
				<option selected>전체</option>
			</select> <span class="searchBarTitle">부서</span> <select id="DeptList"
				style="width: 150px;">
				<option selected>전체</option>
			</select>
		</form>

	</div>

	<div id="mySheet"><script>createIBSheet("mySheet", "100%", "100%");</script></div>
    
    <div id='payByDep' class="payByDep"></div>
    <div id='payByType' class='payByType'></div>
</body>

</html>