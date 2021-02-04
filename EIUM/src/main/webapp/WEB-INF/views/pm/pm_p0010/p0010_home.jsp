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
var data;
var standardDate;
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
			var width = $("#mySheet").width();

			return (width/7);
		}());
		//컬러 fnction
		$("#mySheet3").width($("#mySheet").width()-$("#mySheet2").width()-60);
		
		var colWidth3 = (function(){
			var width = $("#mySheet3").width();

			return (width/4);
		}());
		
		
		//아이비시트1 
		mySheet.RemoveAll();
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0,SumPosition:1};
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [		
			{Header:"상태",Type:"Status",SaveName:"STATUS" ,Hidden:1},
	        {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",Hidden:1},	
	        {Header:"비교연월",Type:"Text",SaveName:"payment_DATE",MinWidth:colWidth,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"인원",Type:"Text",SaveName:"employee_COUNT",MinWidth:0.5*colWidth,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"기본급",Type:"AutoSum",EmptyToReplaceChar:'0',SaveName:"basic_SALARY",MinWidth:colWidth,KeyField:1,Edit:0,Align:"Right"},	
	        {Header:"직책수당",Type:"AutoSum",EmptyToReplaceChar:'0',SaveName:"position_SALARY",MinWidth:colWidth,KeyField:1,Edit:0,Align:"Right"},	
			{Header:"상여금",Type:"AutoSum",EmptyToReplaceChar:'0',SaveName:"bonus_SALARY",MinWidth:colWidth,Edit:0,Align:"Right"},			
			{Header:"식대",Type:"AutoSum",EmptyToReplaceChar:'0',SaveName:"food_SALARY",MinWidth:colWidth,Edit:0,Align:"Right"},			
			{Header:"지급합계",Type:"AutoSum" ,EmptyToReplaceChar:'0',CalcLogic:' (|4| + |5|+ |6|) ', SaveName:"total_SALARY",MinWidth:1.5*colWidth,Edit:0,Align:"Right"},
			{Header:"지급코드",Type:"text" , SaveName:"payment_CODE",Edit:0,Hidden:1}
			
		];   
		IBS_InitSheet( mySheet , initSheet);
  
		mySheet.SetSheetHeight(165);
		mySheet.SetWaitImageVisible(0);
		//아이비시트2
		mySheet2.RemoveAll();
		var initSheet2 = {};
		initSheet2.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0,SumPosition:1};
		initSheet2.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet2.Cols = [		
			{Header:"상태",Type:"Status",SaveName:"STATUS" ,Hidden:1},
	        {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",Hidden:1},	
	        {Header:"사원코드",Type:"Text",SaveName:"employee_CODE",MinWidth:100,Edit:0,Align:"Center"},	
	        {Header:"사원명",Type:"Text",SaveName:"employee_NAME",MinWidth:130,Edit:0,Align:"Center"},	
	        {Header:"부서명",Type:"Text",SaveName:"department_NAME",MinWidth:130,Edit:0,Align:"Center"},	
			{Header:"부서코드",Type:"Text",SaveName:"department_CODE",Edit:0,Hidden:1}	,	
			
			{Header:"기본급",Type:"Text",SaveName:"basic_SALARY",Edit:0,Hidden:1}		,	
			{Header:"직책수당",Type:"Text",SaveName:"position_SALARY",Edit:0,Hidden:1}	,		
			{Header:"상여금",Type:"Text",SaveName:"bonus_SALARY",Edit:0,Hidden:1}		,	
			{Header:"식대",Type:"Text",SaveName:"food_SALARY",Edit:0,Hidden:1}		,	
			
			{Header:"기본급연합계",Type:"Text",SaveName:"total_basic_SALARY",Edit:0,Hidden:1}		,	
			{Header:"직책수당연합계",Type:"Text",SaveName:"total_position_SALARY",Edit:0,Hidden:1}	,		
			{Header:"상여금연합계",Type:"Text",SaveName:"total_bonus_SALARY",Edit:0,Hidden:1}	,			
			{Header:"식대연합계",Type:"Text",SaveName:"total_food_SALARY",Edit:0,Hidden:1},				
			{Header:"전체합",Type:"Text",CalcLogic:' (|6| + |7|+ |8|+ |9|) ',SaveName:"total_sum",Edit:0,Hidden:1}

		];   
		IBS_InitSheet( mySheet2 , initSheet2);
  
		
		mySheet2.SetSheetHeight(200);
		mySheet2.SetWaitImageVisible(0);
		
		//아이비시트3
		mySheet3.RemoveAll();
		var initSheet3 = {};
		initSheet3.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0,SumPosition:1};
		initSheet3.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet3.Cols = [		
			{Header:"상태",Type:"Status",SaveName:"STATUS" ,Hidden:1},
	        {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",Hidden:1},	
	        {Header:"지급구분",Type:"Text",SaveName:"payment_RECEIPT_ITEM",MinWidth:colWidth3,KeyField:1,Edit:0,Align:"Center"},	
	        {Header:"해당 월",Type:"AutoSum",EmptyToReplaceChar:'0',SaveName:"this_Month",MinWidth:colWidth3,KeyField:1,Edit:0,Align:"Right"},	
	        {Header:"평균(1년)",Type:"AutoSum",PointCount:0,CalcLogic:' (|5|/12) ',SaveName:"average_Year",MinWidth:colWidth3,KeyField:1,Edit:0,Align:"Right"},	
	        {Header:"합계(1년)",Type:"AutoSum",EmptyToReplaceChar:'0',SaveName:"total_Year",MinWidth:colWidth3,KeyField:1,Edit:0,Align:"Right"},	

		];   
		IBS_InitSheet( mySheet3 , initSheet3);
  
		mySheet3.SetSheetHeight(200);
		mySheet3.SetWaitImageVisible(0);

	
		
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
	    $("#searchDate1").change(function() {
	    	if($("#searchDate2").val()!=""){
	    		if($("#searchDate1").val()>$("#searchDate2").val()){
	    			alert("종료일이 시작일 보다 커야합니다.");
	    			$(this).val("");
	    			return;
	    		}
	    		
	    	}
	    	});
	    
		
	    var date = new Date();
        var year  = date.getFullYear().toString().substr(2,4);
        var lastyear  = (date.getFullYear()-1).toString().substr(2,4);
        var month = date.getMonth() + 1;
        var currentYear = year +"/"+ month;
        var currentlastYear = lastyear +"/"+ month;
        
        
	    $("#searchDate1").val(currentlastYear);
	    $("#searchDate2").val(currentYear);
		mySheet.DoSearch("${contextPath}/pm/p0010/searchList.do",FormQueryStringEnc(document.frm));

        
		        
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
			var param1 = { Mode : -1,FileName : "사원임금통계.xls", SheetName : "Sheet1"} ;
			mySheet.Down2ExcelBuffer(true);  
	          mySheet.Down2Excel(param1); 
	      	var param2 = {Mode : -1,  FileName : "사원임금통계.xls", SheetName : "Sheet2"} ;
	           mySheet2.Down2Excel(param2);
	      	var param3 = {Mode : -1,  FileName : "사원임금통계.xls", SheetName : "Sheet3"} ;
	           mySheet3.Down2Excel(param3);
	           mySheet3.Down2ExcelBuffer(false); 
			break;
		case "search": //조회
			var param = FormQueryStringEnc(document.frm);
			mySheet.DoSearch("${contextPath}/pm/p0010/searchList.do",param);
			break;

		case "reload": //초기화		
			mySheet.RemoveAll();
			mySheet2.RemoveAll();
			mySheet3.RemoveAll();
	 		$('#searchBar').find('input','select').val(''); 
	 		$("#graph1").empty();
	 		$("#graph2").empty();
	 		$("#graph3").empty();
	
			break;

		}
	}

	function mySheet_OnClick(Row, Col) {
		var param = FormQueryStringEnc(document.frm);
		mySheet2.DoSearch("${contextPath}/pm/p0010/searchList2.do",param+"&payment_CODE="+mySheet.GetCellValue(Row,9)+"&payment_DATE="+mySheet.GetCellValue(Row,2));
		standardDate= mySheet.GetCellValue(Row,2);
	}
	
	function mySheet2_OnClick(Row, Col) {
		
		
		data= {Data:[
				{payment_RECEIPT_ITEM:"기본급",this_Month:mySheet2.GetCellValue(Row,6),total_Year:mySheet2.GetCellValue(Row,10)},
				{payment_RECEIPT_ITEM:"직책수당",this_Month:mySheet2.GetCellValue(Row,7),total_Year:mySheet2.GetCellValue(Row,11)},
				{payment_RECEIPT_ITEM:"상여",this_Month:mySheet2.GetCellValue(Row,8),total_Year:mySheet2.GetCellValue(Row,12)},
				{payment_RECEIPT_ITEM:"식대",this_Month:mySheet2.GetCellValue(Row,9),total_Year:mySheet2.GetCellValue(Row,13)}
				]};
 		mySheet3.LoadSearchData(data);
 		
 			
 		$.ajax({
            url : "${contextPath}/pm/p0010/searchList3.do",
            type : "get",
            data : {"employee_CODE":mySheet2.GetCellValue(Row,2), "payment_DATE":standardDate},
            dataType: 'json',
            success : function (graph3result) {
            	var barNames=[],barBasic_SALARY=[],barPosition_SALARY=[],barBonus_SALARY=[],barTotal_SALARY=[];	
            	for(var i=0;i<graph3result['Data'].length;i++){
            		barNames.push(graph3result['Data'][i].payment_DATE);
            		barBasic_SALARY.push(parseInt(graph3result['Data'][i].basic_SALARY));
            		barPosition_SALARY.push(parseInt(graph3result['Data'][i].position_SALARY));
            		barBonus_SALARY.push(parseInt(graph3result['Data'][i].bonus_SALARY));
            		barTotal_SALARY.push(parseInt(graph3result['Data'][i].total_SALARY));	
            	}
            	makeGraph3(barNames,barBasic_SALARY,barPosition_SALARY,barBonus_SALARY,barTotal_SALARY);	
            },
            error : function (graph3result) {
            }      
        });
			
	}
	function makeGraph3(barNames,barBasic_SALARY,barPosition_SALARY,barBonus_SALARY,barTotal_SALARY){
		// 막대		
		Highcharts.chart('graph3', {
		    title: {
		    	text : '사원별 지급액 추이',
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
		        categories: barNames,
		        title: {
		            text: '비교연월'
		        }
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
		        type: 'column', 
		        color: graphColors[2],
		        name: '상여',
		        data: barBonus_SALARY
		        
		    }, {
		        type: 'spline', 
		        color: '#212121',
		        name: '합계',
		        data: barTotal_SALARY,
		        marker: {
		            lineWidth: 2,
		            lineColor: '#212121'
		        }
		    }]
		});
		}

	// 저장완료 후 처리할 작업

	function mySheet_OnSearchEnd(code, msg) {
		if(mySheet.GetCellValue(1,4)==null||mySheet.GetCellValue(1,4)==""){
			return false;
		}
		var graph1_categories = [], data1 = [], data2 = [], data3 = [], data4 = [];
		for (var i = 1; i <= mySheet.GetDataLastRow(); i++) {
			graph1_categories.push(mySheet.GetCellValue(i, 2));

			for (var j = mySheet.SaveNameCol("basic_SALARY"); j <= mySheet.SaveNameCol("food_SALARY"); j++) {
				if (j == mySheet.SaveNameCol("basic_SALARY")) {
					data1.push(mySheet.GetCellValue(i, j));
				} else if (j == mySheet.SaveNameCol("position_SALARY")) {
					data2.push(mySheet.GetCellValue(i, j));
				} else if (j == mySheet.SaveNameCol("bonus_SALARY")) {
					data3.push(mySheet.GetCellValue(i, j));
				} else {
					data4.push(mySheet.GetCellValue(i, j));
				}
			}
		}

		Highcharts.chart('graph1', {
			chart : {
				type : 'bar'
			},
			title : {
				text : '비교연원별 지급액 추이',
				verticalAlign : 'bottom',
				align : 'center',
				style : {
					color : '#111820',
					fontFamily : 'san-serif',
					fontSize : '18px',
					fontWeight : 'bold'
				}
			},
			xAxis : {
				categories : graph1_categories
			},
			legend : {
				align : 'right',
				layout : 'vertical',
				verticalAlign : 'top'
			},
			yAxis : {
				visible : false
			},
			plotOptions : {
				series : {
					stacking : 'normal'
				}
			},
			series : [ {
				name : "기본급",
				data : data1,
				color : graphColors[3]
			}, {
				name : "직책수당",
				data : data2,
				color : graphColors[0]

			}, {
				name : "상여",
				data : data3,
				color : graphColors[2]
			}, {
				name : "식대",
				data : data4,
				color : graphColors[1]
			} ]
		});

	}
	
	
	// 저장완료 후 처리할 작업
	function mySheet2_OnSearchEnd(code, msg) {
	
		var arr=[];var colorSelect=0;
		for (var i = 1; i <= mySheet2.GetDataLastRow(); i++) {
			arr.push({
				name: mySheet2.GetCellValue(i,4),
				y: parseInt(mySheet2.GetCellValue(i,14)),
				color: graphColors[colorSelect]
			});
			colorSelect++;
		}  

			var resultArr = [];

			for(var i = 0; i < arr.length; i++){
			  var idx = getKeyIndex(resultArr, arr[i]);
			  
			  if(idx > -1){
				resultArr[idx].y += arr[i].y;
			  }else{
			    resultArr.push(arr[i]);
			  }
			}

			function getKeyIndex(arr, obj){
			  for(var i = 0; i < arr.length; i++){
				if(arr[i].name === obj.name){
					return i;
				}
			  }
			  
			  return -1;
			}
			
		Highcharts.chart('graph2', {

			chart : {
				type : 'pie'
			},
			title : {
				text : '부서별 지급액',
				verticalAlign : 'bottom',
				align : 'center',
				style : {
					color : '#111820',
					fontFamily : 'san-serif',
					fontSize : '18px',
					fontWeight : 'bold'
				}
			},
			legend : {
				align : 'right',
				layout : 'vertical',
				verticalAlign : 'bottom',
				x : -20,
				y : -40,
				floating : true
			},
			plotOptions : {
				pie : {
					allowPointSelect : true,
					cursor : 'pointer',
					dataLabels : {
						enabled : false
					}
				}
			},
			tooltip : {
				valueSuffix : '원'
			},
			 series: [{
				 	name: '금액',
				 	innerSize: '40%',
				 	 size: '100%',    
				 	 showInLegend: true,
			        data: resultArr
			    }]
		}); 

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
width: 1640px;

padding-bottom: 15px;
border-bottom: 2px solid #C3C3C3;
}
#mySheet2{
position: relative;
top:115px;
width: 360px;
padding: 15px 30px 0 0;
border-right: 2px solid #C3C3C3;
}
#mySheet3{
position: relative;
top:-115px;
left:390px;
z-index:100;
padding: 30px 0 0 30px;
}
.graph1 {
	position:relative;
	top:-110px;
	left:50px;
	width: 400px;
	height: 260px;
	z-index:10;
}
.graph2 {
	position:relative;
	top:-370px;
	left:450px;
	width: 400px;
	height: 260px;
	z-index:10;
}
.graph3 {
position:relative;
	top:-630px;
	left:900px;
	width: 750px;
	height: 260px;
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
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 급여관리 : 사원임금통계
		</header>
	</div>


	<div id="searchBar">
		<form name="frm">
			<span class="searchBarTitle">조회기간</span> <input id="searchDate1" class="monthpicker"
				type="text" style="width: 100px;"> <img name="btn_monthpicker"
				src="${contextPath}/resources/image/icons/icon_calendar.png">
				~ <input id="searchDate2" class="monthpicker"type="text" style="width: 100px;"> 
				<img name="btn_monthpicker" src="${contextPath}/resources/image/icons/icon_calendar.png">
			
			 <span class="searchBarTitle">사업장구분</span> <select id="searchSite"
				style="width: 150px;" onclick="selectDept()">
				<option selected>전체</option>
			</select> <span class="searchBarTitle">부서</span> <select id="DeptList"
				style="width: 150px;">
				<option selected>전체</option>
			</select>
		</form>

	</div>

	<div id="mySheet"><script>createIBSheet("mySheet", "100%", "100%");</script></div>
	<div id="mySheet2"><script>createIBSheet("mySheet2", "100%", "100%");</script></div>
	<div id="mySheet3"><script>createIBSheet("mySheet3", "100%", "100%");</script></div>
    
    <div id='graph1' class="graph1"></div>
    <div id='graph2' class="graph2"></div>
    <div id='graph3' class='graph3'></div>
</body>

</html>