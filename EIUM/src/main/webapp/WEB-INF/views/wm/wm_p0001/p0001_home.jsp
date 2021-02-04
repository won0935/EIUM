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
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>


 <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.mtz.monthpicker.js"></script>
<script language="javascript">

	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.SetWaitImageVisible(0); 
		mySheet2.SetWaitImageVisible(0); 
		mySheet3.SetWaitImageVisible(0); 
		
		/* MonthPicker 옵션 */
	    options = {
	        pattern: 'yyyy-mm', // Default is 'mm/yyyy' and separator char is not mandatory
	        selectedYear: 2019,
	        startYear: 2000,
	        finalYear: 3000,
	        buttonImage: "${contextPath}/resources/image/icons/icon_calendar.png", 
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	    };
	     
	    /* MonthPicker Set */
	    $('#monthpicker').monthpicker(options);
	     
	    /* 버튼 클릭시 MonthPicker Show */
	    $('#btn_monthpicker').bind('click', function () {
	        $('#monthpicker').monthpicker('show');
	    });
	    
		//아이비시트1 
		mySheet.RemoveAll();
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
		initSheet.Cols = [		
		
	        {Header:"사원코드",Type:"Text",SaveName:"employee_CODE", Width:100, KeyField:1, Align:"Center", Edit: 0},	
			{Header:"사원명",Type:"Text",SaveName:"employee_NAME",MinWidth:150, Align:"Center", Edit: 0},			
			{Header:"부서명",Type:"Text",SaveName:"department_NAME",MinWidth:150, Align:"Center", Edit: 0},
			{Header:"부서코드", Type:"Text", SaveName:"department_CODE", Align:"Center", Edit: 0, Hidden: 1}
		];   
		IBS_InitSheet( mySheet , initSheet);
  
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet.SetSheetHeight(500);
		//아이비시트2------------------------------------------------------
		mySheet2.RemoveAll();
		var initSheet2 = {};
		initSheet2.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:0, ComboEditValidation:1};
		initSheet2.HeaderMode = {Sort:1, ColMove:0, ColResize:0, HeaderCheck:1};
		initSheet2.Cols = [
			{Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:50, Align:"Center",Hidden:1},
	        {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:50},	
	        {Header:"NO",Type:"Seq",SaveName:"NUMBER",MinWidth:50, Align:"Center"},
	        {Header:"근태입력고유번호", Type:"Text",SaveName:"working_STATUS_CODE", Width:50, Height:50, Align:"Center", Hidden:1},
	        {Header:"귀속연월", Type:"Text",SaveName:"working_STATUS_MONTH", Width:50, Align:"Center", Format: "Ym", CalcLogic:"|5|", Hidden:1},
	        {Header:"출근일자",Type:"Date",SaveName:"working_STATUS_DATE",MinWidth:120,KeyField:1, Align:"Center", Format: "Ymd"},			
			{Header:"출근시간",Type:"Date",SaveName:"working_STATUS_START_TIME",MinWidth:100, Align:"Center", Format: "HH:mm"},
			{Header:"퇴근시간",Type:"Date",SaveName:"working_STATUS_END_TIME",MinWidth:100, Align:"Center", Format: "HH:mm"},
			{Header:"temp_시간",Type:"Date",SaveName:"temp_TIME",MinWidth:100, Align:"Center", Format: "00:00", DefaultValue :"0000", Hidden:1},
			{Header:"근무총시간",Type:"Date",SaveName:"working_STATUS_TOTAL_TIME",MinWidth:50, Align:"Center", Format: "HH:mm", CalcLogic:"|7|+|8|-|6|", Hidden:1},
			{Header:"퇴근-출근시간",Type:"Date",SaveName:"working_STATUS_TOTAL_TIME_CALC",MinWidth:50, Align:"Center",Format:"HH:mm", CalcLogic:"|7|+|8|-|6|"},
			{Header:"비고",Type:"Combo",SaveName:"working_STATUS_DESC",MinWidth:80, Align:"Center", "ComboText":"출근|지각|조퇴|외출", "ComboCode":"00|01|02|03"},
			{Header:"그 달의 해당YN:",Type:"Text",SaveName:"working_STATUS_YN", MinWidth:50,Align:"Center",Hidden:1},
			//평일(table)
			{Header:"평일정상근무시간",Type:"Text",SaveName:"weekday_NORMAL_WORK_TIME", Width:80, Align:"Center",ZeroToReplaceChar:"", Hidden:1},	
			{Header:"평일연장근무시간",Type:"Text",SaveName:"weekday_EXTENSION_WORK_TIME", Width:80, Align:"Center",Format:"0000",ZeroToReplaceChar:"", Hidden:1},			
			{Header:"평일야간근무시간",Type:"Text",SaveName:"weekday_NIGHT_WORK_TIME", Width:80, Align:"Center",Format:"0000",ZeroToReplaceChar:"", Hidden:1},
			
			//휴일(table)
			{Header:"휴일정상근무시간",Type:"Text",SaveName:"holiday_NORMAL_WORK_TIME", Width:80, Align:"Center",Format:"0000",ZeroToReplaceChar:"", Hidden:1},	
			{Header:"휴일연장근무시간",Type:"Text",SaveName:"holiday_EXTENSION_WORK_TIME", Width:80, Align:"Center",Format:"0000",ZeroToReplaceChar:"", Hidden:1},			
			{Header:"휴일야간근무시간",Type:"Text",SaveName:"holiday_NIGHT_WORK_TIME", Width:80, Align:"Center",Format:"0000",ZeroToReplaceChar:"", Hidden:1}
		];
		
		IBS_InitSheet( mySheet2 , initSheet2);
		
		mySheet2.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet2.SetSheetHeight(500);
		/* GetDataLastRow() == mySheet3.GetSelectRow() */
		/* var info = [{StdCol:1 , SumCols:"0|1"}]; 
		mySheet.ShowSubSum (info);  */
		
		//아이비시트 3(총 근태결과)----------------------------------------------------
		mySheet3.RemoveAll();
		var initSheet3 = {};
		initSheet3.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:0,SumZeroValue:"0"};
		initSheet3.HeaderMode = {Sort:1, ColMove:0, ColResize:0, HeaderCheck:1};
		initSheet3.Cols = [
			{Header:"상태", Type:"Status", SaveName:"STATUS", Hidden:1},
			{Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK", Hidden:1},
			
			//평일
			{Header:"평일정상근무시간(분)",Type:"Text",SaveName:"weekday_NORMAL_WORK_TIME", Width:160,Edit:1,Align:"Center"},	
			{Header:"평일연장근무시간(분)",Type:"Text",SaveName:"weekday_EXTENSION_WORK_TIME", Width:160,Edit:1,Align:"Center"},			
			{Header:"평일야간근무시간(분)",Type:"Text",SaveName:"weekday_NIGHT_WORK_TIME", Width:160,Edit:1,Align:"Center"},
			
			//휴일
			{Header:"휴일정상근무시간(분)",Type:"Text",SaveName:"holiday_NORMAL_WORK_TIME", Width:160,Edit:1,Align:"Center"},	
			{Header:"휴일연장근무시간(분)",Type:"Text",SaveName:"holiday_EXTENSION_WORK_TIME", Width:160,Edit:1,Align:"Center"},			
			{Header:"휴일야간근무시간(분)",Type:"Text",SaveName:"holiday_NIGHT_WORK_TIME", Width:160,Edit:1,Align:"Center"},
			//etc
			{Header:"평일(일)",Type:"Text",SaveName:"weekday",Edit:0, Width:105,Align:"Center"},	
			{Header:"휴일(일)",Type:"Text",SaveName:"holiday",Edit:0, Width:105,Align:"Center"},			
			{Header:"총정상근무일(일)",Type:"Text",SaveName:"normal_WORK_DAY", Width:140,Edit:1,Align:"Center"},
			{Header:"총연장근무일(일)",Type:"Text",SaveName:"extension_WORK_DAY", Width:140,Edit:1,Align:"Center"}
		];
		
		IBS_InitSheet(mySheet3, initSheet3);
		mySheet3.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet3.SetAutoRowHeight(0);
		mySheet3.SetSheetHeight(75);
		mySheet3.SetDataRowHeight(40); //데이터 row의 높이 조절
		mySheet3.SetHeaderRowHeight(30);  //헤더 행의 높이 조절 
		/* mySheet3.SetSelectionMode(1); */
		

		mySheet3.SetRowHeight(1, 80); 
		mySheet3.SetColEditable(2,0);
		mySheet3.SetColEditable(3,0);
		mySheet3.SetColEditable(4,0);
		
		mySheet3.SetColEditable(5,0);
		mySheet3.SetColEditable(6,0);
		mySheet3.SetColEditable(7,0);
		
		mySheet3.SetColEditable(8,0);
		mySheet3.SetColEditable(9,0);
		mySheet3.SetColEditable(10,0);
		mySheet3.SetColEditable(11,0);
		
		
		/* mySheet.DoSearch("${contextPath}/wm/p0001/EMP_searchList.do"); */
		
		mySheet3.DataInsert(-1);
		$("#sum").hide();
		$("#add").hide();
		$("#dead_buttons").hide(); //마감버튼은 보여주고
		$("#dead_cancel_buttons").hide(); //계산버튼은 보여주고
	}

	//평일인지 주말인지 구할 메소드 //토일 0, 6 평일(월,화,수,목,금)1,2,3,4,5
	function getTodayLabel(day) {
	    
		var week = ['일', '월', '화', '수', '목', '금', '토'];
		var d_year = day.substring(0,4); //2013
		var d_month = day.substring(4,6); //11
		var d_day = day.substring(6,8); //04
		day = d_year + "-" + d_month + "-" + d_day;
		var dayOfWeek = new Date(day).getDay();
		return dayOfWeek;

	}
	
		//Formating
	  $(document).ready(function () {
		 //근무시간 
		   $(function () { 
		         $('.WORK_TIME').keydown(function (event) {
		        var key = event.charCode || event.keyCode || 0;
		        $text = $(this).attr("readonly",true); ;
		        
		        if (key !== 8 && key !== 9) {
		        	if ($text.val().length === 2) {
                        $text.val($text.val() + '');
                    }
		        }
		        return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
		    })
		   }); 
		 
		      
		}); //document.ready
		
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
			
			var param = FormQueryStringEnc(document.searchBar);
			
				mySheet.DoSearch("${contextPath}/wm/p0001/EMP_searchList.do", param);
				//조회조건에 맞도록 조회하기
				$("#sum").show();
				$("#add").show();
				$("#dead_buttons").show(); //마감버튼은 보여주고
				$("#dead_cancel_buttons").show(); //계산버튼은 보여주고
			
			break;

		case "reload": //초기화
			mySheet.RemoveAll();
			mySheet2.RemoveAll();
			mySheet3.RemoveAll();
			$("#sum").hide(); //전체버튼은 숨겨주고
			$("#sum").hide(); //계산버튼은 보여주고
			$("#dead_buttons").hide(); //마감버튼은 보여주고
			$("#dead_cancel_buttons").hide(); //계산버튼은 보여주고
			$("#monthpicker").attr('value', "");
			
			
			$("select#SiteList option[name='1']").remove();
			$("select#DeptList option[class='1']").remove();
			$('#SiteList').val(selectSite());
			$('#Employee_Select').val('');
			$('#p_text').val('');
			$('#p_text').attr('placeholder', "사원명or사원코드");
			
			$("#WORK_TIME").each(function() {  
				this.reset();  
	         });  
			break;
		case "save": // 저장
			mySheet2.DoSave("${contextPath}/wm/p0001/saveData.do", "p_emp_code=" + mySheet.GetCellValue(mySheet.GetSelectRow(),0));
			
			break;
		case "insert": //추가

			var row = mySheet2.DataInsert(-1);
		
			break;
		
		case "calculate": //정산
			mySheet3.DataInsert(0);
			
			//평일정상근무시간 : week_NO_TIME
			//평일연장근무시간 : week_EX_TIME
			//평일야간근무시간 : week_NI_TIME
			//휴일정상근무시간 : holi_NO_TIME
			//휴일연장근무시간 : holi_EX_TIME
			//휴일야간근무시간 : holi_NI_TIME
			
			//총 평일 정상 근무시간 : T_week_NO_TIME
			//총 평일 연장 근무시간 : T_week_EX_TIME
			//총 평일 야간 근무시간 : T_week_NI_TIME
			//총 휴일 정상 근무시간 : T_holi_NO_TIME
			//총 휴일 연장 근무시간 : T_holi_EX_TIME
			//총 휴일 야간 근무시간 : T_holi_NI_TIME
			
			//총 평일 일 수 : T_week_count
			//총 휴일 일 수 : T_holi_count
			
			//총 평일 정상 근무일 : T_week_NO_DAY
			//총 평일 연장 근무일 : T_week_EX_DAY
			
			//총 휴일 정상 근무일 : T_holi_NO_DAY
			//총 휴일 연장 근무일 : T_holi_EX_DAY
			
			//총 정상 근무일 : T_NO_COUNT
			//총 연장 근무일 : T_EX_COUNT
			/* alert(mySheet2.GetCellValue(1, 13));
			alert(Math.floor((mySheet2.GetCellValue(1, 13)/100))); */
			/* alert(mySheet2.GetCellValue(1, 13)%100); */
			
			var T_week_NO_TIME = mySheet2.ComputeSum("|13|"); //총 평일 정상 근무시간
			var T_week_EX_TIME = mySheet2.ComputeSum("|14|"); //총 평일 연장 근무시간
			var T_week_NI_TIME = mySheet2.ComputeSum("|15|"); //총 평일 야간 근무시간
			
			var T_holi_NO_TIME = mySheet2.ComputeSum("|16|"); //총 휴일 정상 근무시간
			var T_holi_EX_TIME = mySheet2.ComputeSum("|17|"); //총 휴일 연장 근무시간
			var T_holi_NI_TIME = mySheet2.ComputeSum("|18|"); //총 휴일 야간 근무시간
			
			var T_week_count = 0, T_holi_count = 0, T_week_NO_DAY = 0, T_week_EX_DAY = 0, T_holi_NO_DAY = 0, T_holi_EX_DAY = 0, T_NO_COUNT = 0, T_EX_COUNT = 0;
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("weekday_NORMAL_WORK_TIME"), T_week_NO_TIME);
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("weekday_EXTENSION_WORK_TIME"), T_week_EX_TIME);
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("weekday_NIGHT_WORK_TIME"), T_week_NI_TIME);
			 
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("holiday_NORMAL_WORK_TIME"), T_holi_NO_TIME);
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("holiday_EXTENSION_WORK_TIME"), T_holi_EX_TIME);
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("holiday_NIGHT_WORK_TIME"), T_holi_NI_TIME);
			
			//평일//휴일 분류
			var T_Maskingcell = mySheet2.GetDataLastRow();
			for(let i = 1; i <= T_Maskingcell; i++){
				
				if(getTodayLabel(mySheet2.GetCellValue(i, 5)) >=1 & getTodayLabel(mySheet2.GetCellValue(i, 5)) <= 5){ //평일 일 때
					T_week_count = T_week_count + 1;
					if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME")) == "900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME")) >= 0){
						//총 연장 근무 = 연장 + 정상	
						T_week_EX_DAY = T_week_EX_DAY + 1;
					} 
					if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")) == "0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) == "1800"){
						T_week_NO_DAY = T_week_NO_DAY + 1;
					}
				}else if(getTodayLabel(mySheet2.GetCellValue(i, 5)) == 0 || getTodayLabel(mySheet2.GetCellValue(i, 5)) == 6){ // 주말일 때
					
					T_holi_count = T_holi_count + 1;
					if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME")) == "900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME")) >= 0){
						//총 연장 근무 = 연장 + 정상	
						T_holi_EX_DAY = T_holi_EX_DAY + 1;
					}
					if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")) == "0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) == "1800"){
						T_holi_NO_DAY = T_holi_NO_DAY + 1;
					}
				}
				//평일 총 정상근무일 + 휴일 총 정상 근무일
				T_NO_COUNT = T_holi_NO_DAY + T_week_NO_DAY;
				//평일 총 연장 근무일 + 휴일 총 연장 근무일  = (평일 연장 근무일 - 평일 정상 근무일) + (휴일 연장 근무일 - 평일 정상 근무일) 
				T_EX_COUNT = (T_week_EX_DAY) + (T_holi_EX_DAY);
			}
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("weekday"), T_week_count);
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("holiday"), T_holi_count);
			
			//총 정상 근무일
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("normal_WORK_DAY"), T_NO_COUNT);
			// 총연장 근무일
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("extension_WORK_DAY"), T_EX_COUNT);
			/* $("#sum").hide; */
			/* if($("#sum").css("display") != "none"){
				mySheet3.RemoveAll();
			} */
			alert("정산 완료");
			mySheet3.DoSave("${contextPath}/wm/p0001/SUM_saveData.do", "PP_EMP_CODE=" + mySheet.GetCellValue(mySheet.GetSelectRow(),0) + "&monthpicker=" +$('#monthpicker').val());
		
			//계산 후 계산 된 것을 바로 서버로 넘겨주어서 sheet3에 있는 총 근태 결과 정보 저장
			break;
		case "deadline": //마감
				
		
		//마감은 정산해서 서버로 저장도 하면서 마감
			//평일정상근무시간 : week_NO_TIME
			//평일연장근무시간 : week_EX_TIME
			//평일야간근무시간 : week_NI_TIME
			//휴일정상근무시간 : holi_NO_TIME
			//휴일연장근무시간 : holi_EX_TIME
			//휴일야간근무시간 : holi_NI_TIME
			
			//총 평일 정상 근무시간 : T_week_NO_TIME
			//총 평일 연장 근무시간 : T_week_EX_TIME
			//총 평일 야간 근무시간 : T_week_NI_TIME
			//총 휴일 정상 근무시간 : T_holi_NO_TIME
			//총 휴일 연장 근무시간 : T_holi_EX_TIME
			//총 휴일 야간 근무시간 : T_holi_NI_TIME
			
			//총 평일 일 수 : T_week_count
			//총 휴일 일 수 : T_holi_count
			
			//총 평일 정상 근무일 : T_week_NO_DAY
			//총 평일 연장 근무일 : T_week_EX_DAY
			
			//총 휴일 정상 근무일 : T_holi_NO_DAY
			//총 휴일 연장 근무일 : T_holi_EX_DAY
			
			//총 정상 근무일 : T_NO_COUNT
			//총 연장 근무일 : T_EX_COUNT
			var T_week_NO_TIME = mySheet2.ComputeSum("|13|"); //총 평일 정상 근무시간
			var T_week_EX_TIME = mySheet2.ComputeSum("|14|"); //총 평일 연장 근무시간
			var T_week_NI_TIME = mySheet2.ComputeSum("|15|"); //총 평일 야간 근무시간
			
			var T_holi_NO_TIME = mySheet2.ComputeSum("|16|"); //총 휴일 정상 근무시간
			var T_holi_EX_TIME = mySheet2.ComputeSum("|17|"); //총 휴일 연장 근무시간
			var T_holi_NI_TIME = mySheet2.ComputeSum("|18|"); //총 휴일 야간 근무시간
			
			var T_week_count = 0, T_holi_count = 0, T_week_NO_DAY = 0, T_week_EX_DAY = 0, T_holi_NO_DAY = 0, T_holi_EX_DAY = 0, T_NO_COUNT = 0, T_EX_COUNT = 0;
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("weekday_NORMAL_WORK_TIME"), T_week_NO_TIME);
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("weekday_EXTENSION_WORK_TIME"), T_week_EX_TIME);
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("weekday_NIGHT_WORK_TIME"), T_week_NI_TIME);
			 
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("holiday_NORMAL_WORK_TIME"), T_holi_NO_TIME);
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("holiday_EXTENSION_WORK_TIME"), T_holi_EX_TIME);
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("holiday_NIGHT_WORK_TIME"), T_holi_NI_TIME);
			
			//평일//휴일 분류
			var T_Maskingcell = mySheet2.GetDataLastRow();
			for(let i = 1; i <= T_Maskingcell; i++){
				
				if(getTodayLabel(mySheet2.GetCellValue(i, 5)) >=1 & getTodayLabel(mySheet2.GetCellValue(i, 5)) <= 5){ //평일 일 때
					T_week_count = T_week_count + 1;
					if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME")) == "900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME")) >= 0){
						//총 연장 근무 = 연장 + 정상	
						T_week_EX_DAY = T_week_EX_DAY + 1;
					} 
					if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")) == "0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) == "1800"){
						T_week_NO_DAY = T_week_NO_DAY + 1;
					}
				}else if(getTodayLabel(mySheet2.GetCellValue(i, 5)) == 0 || getTodayLabel(mySheet2.GetCellValue(i, 5)) == 6){ // 주말일 때
					
					T_holi_count = T_holi_count + 1;
					if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME")) == "900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME")) >= 0){
						//총 연장 근무 = 연장 + 정상	
						T_holi_EX_DAY = T_holi_EX_DAY + 1;
					}
					if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")) == "0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) == "1800"){
						T_holi_NO_DAY = T_holi_NO_DAY + 1;
					}
				}
				//평일 총 정상근무일 + 휴일 총 정상 근무일
				T_NO_COUNT = T_holi_NO_DAY + T_week_NO_DAY;
				//평일 총 연장 근무일 + 휴일 총 연장 근무일  = (평일 연장 근무일 - 평일 정상 근무일) + (휴일 연장 근무일 - 평일 정상 근무일) 
				T_EX_COUNT = (T_week_EX_DAY) + (T_holi_EX_DAY);
			}
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("weekday"), T_week_count);
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("holiday"), T_holi_count);
			
			//총 정상 근무일
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("normal_WORK_DAY"), T_NO_COUNT);
			// 총연장 근무일
			mySheet3.SetCellValue(1, mySheet3.SaveNameCol("extension_WORK_DAY"), T_EX_COUNT);
			
			
			/* $("#dead_buttons").hide(); //마감버튼은 숨겨주고
			$("#dead_cancel_buttons").show(); //마감취소버튼은 보여주고 */
			//마감저장이 성공하면 그후엔 그 저장한 사원의 그 달 SHEET와 전체 작동 불가
			//마감 버튼은 마감취소 버튼으로 변경
			
			alert("정산/마감 완료");
			mySheet3.SetCellValue(1, 0, "I");   //상태 셀을 "입력" 상태로 설정
			//정산 클릭 후 
			/* var tempStr = mySheet3.GetSaveString();
			alert("서버로 전달되는 문자열 확인 :" + tempStr);	 */
			mySheet3.DoSave("${contextPath}/wm/p0001/TWS_saveData.do", "PP_EMP_CODE=" + mySheet.GetCellValue(mySheet.GetSelectRow(),0) + "&monthpicker=" +$('#monthpicker').val());
		break;
		
		case "deadline_cancel": //마감취소
			/* $("#dead_buttons").show();
			$("#dead_cancel_buttons").hide(); */
			//마감저장이 성공하면 그후엔 그 저장한 사원의 그 달 SHEET와 전체 작동 불가
			//마감 버튼은 마감취소 버튼으로 변경
			
			mySheet2.DoSave("${contextPath}/wm/p0001/WS_YN_rollbackData.do", "PP_EMP_CODE=" + mySheet.GetCellValue(mySheet.GetSelectRow(),0) + "&monthpicker=" +$('#monthpicker').val());
			
			//다시 마감취소를 누르면 그 해당하는 달의 해당 사원의 근무를 다시 N으로 바꾸어 준다.
		break;
		
			//mySheet2의 비고에 따라서 퇴근-출근 시간을 계산하여 총 근태 결과에 출력
			/* mySheet3.SetSheetHeight(50);
			alert(mySheet3.GetSheetHeight()); */
			/* mySheet3.SetDataRowHeight(39); */
			/* if(mySheet2.) */
			/* var Sum3 = mySheet2.ComputeSum("|11|"); // 비고 입력창의 총 합계
			alert(Sum3); 
			var temp_count = "근태코드";
			var count_array = new Array();
			for(var j=0;j<6;j++){ //배열 초기화
			    count_array[j]=0;
			}
			for(let i =1; i <= mySheet2.GetDataLastRow(); i++){
				temp_count = mySheet2.GetCellValue(i,mySheet2.SaveNameCol("working_STATUS_DESC"));
				alert(temp_count);
				switch(temp_count){
					case '00':
						count_array[0]++;
					break;
					
					case '01':
						count_array[1]++;
					break;
					
					case '02':
						count_array[2]++;
					break;
					
					case '03':
						count_array[3]++;
					break;
					
					case '04':
						count_array[4]++;
					break;
					
					case '05':
						count_array[5]++;
					break;
				}
			} 
			for(j=0; j<6; j++){
				alert("@@@@@"+count_array[j]);
			} 
			break; */
			
			case "excel": //엑셀
				var param = { Mode : -1 };
				mySheet.Down2ExcelBuffer(true);  
			    mySheet.Down2Excel(param);
			    mySheet2.Down2Excel(param);
			    mySheet3.Down2Excel(param);
			    mySheet.Down2ExcelBuffer(false); 
	        break;
		}
	}
	
	 
	


	//출근일자나 비고 로 combobox 클릭시
	/* function mySheet2_OnChange(Row, Col){
		if(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME"))=="0900" && mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_END_TIME"))>="1800"){ //정상출근
			//alert(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC")));
			mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"), "00");
			//alert(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC")));
		}else if(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME"))=="0900" & mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_END_TIME"))<"1800"){ //조퇴
			mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"), "02");
		}else if(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME"))>"0900"){ //지각
			mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"), "01");
		}
		/* alert(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME")));
		alert(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_END_TIME")));
		alert(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"))); */
		
	//} */
	//mySheet(사원)로우 클릭시
	function mySheet_OnClick(Row, Col) {
		//defualt로 숨겨진 0000을 입력
		if (Row != 0) {
			//정산 버튼이 보일 때는 sheet3를 mySheet3.RemoveAll();
			
			mySheet2.DoSearch("${contextPath}/wm/p0001/WS_searchList.do", "P_EMP_CODE=" + mySheet.GetCellValue(mySheet.GetSelectRow(), 0) + "&monthpicker=" +$('#monthpicker').val());
			/* if(mySheet2.GetCellValue(Row, 6) == "" || mySheet2.GetCellValue(Row, 6) == null){
				mySheet2.SetCellValue(Row, 6, "0000");
			} */
		}
		
		
	}
	//mySheet2(출근시간, 퇴근시간 클릭시)로우 클릭시
	function mySheet2_OnAfterEdit(Row, Col){
		var Maskingcell = mySheet2.GetDataLastRow();
		/* for(let i = Maskingcell; i >= 1; i--){ // savename: temp_시간의 col에 00:00 masking 값 입력
			mySheet2.SetCellValue(i, 8, "0000");
			/* alert(mySheet2.GetCellValue(i, 8)); */ //값 확인 완료
		//} 
		
		
		for(let i = 1; i <= Maskingcell; i++){
			var week_NO_TIME = 0, week_EX_TIME = 0, week_NI_TIME = 0, holi_NO_TIME = 0, holi_EX_TIME = 0, holi_NI_TIME = 0;
			if(i == mySheet2.GetSelectRow()){
				/* alert(mySheet2.SelectRow()); */
				mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), "");
				mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), "");
				mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), "");
				mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), "");
				mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), "");
				mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), "");
				
			}
			if(getTodayLabel(mySheet2.GetCellValue(i, 5)) >=1 & getTodayLabel(mySheet2.GetCellValue(i, 5)) <= 5){ //평일 일 때
				if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"){ //0100 0500 //////////////시작시간이 06시 이전일때

					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC")))); //평일야간근무 ex) 0100, 0600
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0900"){// 0300 0800
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //0500출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0600");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NI_TIME = week_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NI_TIME = week_NI_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					}
					if(next_temp_time >= "100"){ //연장근무 시간이 1시간 이상일때 평일 연장 근무시간에 +
						
						week_EX_TIME = week_EX_TIME + next_temp_time;
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
					}
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="1800"){
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0900");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NI_TIME = week_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NI_TIME = week_NI_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					}
					if(next_temp_time >= "100"){ // normal 근무 시간이 1시간 이상일때 평일 정상 근무 시간에 +
						
							week_NO_TIME = week_NO_TIME + next_temp_time;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), "300");
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"){
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"1800");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NI_TIME = week_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NI_TIME = week_NI_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					}
					if(next_temp_time >= "100"){ // normal 근무 시간이 1시간 이상일때 평일 정상 근무 시간에 +
						
							week_EX_TIME = week_EX_TIME + next_temp_time + 300;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
							
					}else if(next_temp_time < "100"){
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), "300");
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), "900");
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){ //0100 2300
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NI_TIME = week_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NI_TIME = week_NI_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 야간시간이 1시간 이상일때 평일 야간 근무 시간에 +
						
						week_NI_TIME = week_NI_TIME + next_temp_time;
							
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), "900");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), "700");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) > mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){ //0600 0700 ///////////여기서 부터 START 06시작
					//0600~0900시작
					///////////////////////////////
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC"))));
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="1800"){// 0630 0900
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //0800출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0900");
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 1000 - 0630 = 370 - 40 = 330
					//2
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
					}
					if(next_temp_time >= "100"){ //정상근무 시간이 1시간 이상일때 평일 정상 근무시간에 +
						
						week_NO_TIME = week_NO_TIME + next_temp_time;
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					}
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"){
					//3
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"1800");
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 정근무시간에 + ex) 1800 - 0930 = 870 - 40 = 830

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 연장 근무 시간이 1시간 이상일때 평일 연장 근무 시간에 +
						
							week_EX_TIME = week_EX_TIME + next_temp_time;
							
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), "900");
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
					
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 야간 근무 시간이 1시간 이상일때 평일 야간 근무 시간에 +
							week_NI_TIME = week_NI_TIME + next_temp_time;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
							
					}else if(next_temp_time < "100"){
					}
					week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), "900");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
						
					}
					
					week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), "900");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="1800"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) > mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){ //0900 1800 ///////////여기서 부터 START 09시작
					//0900~1800시작
					///////////////////////////////
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC"))));
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"){// 0930 1830
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //1700출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"1800");
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 정상 근무 시간에 + ex) 1800 - 0901 = 899 - 40 = 859
						//2
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NO_TIME = week_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NO_TIME = week_NO_TIME + pre_temp_time - 40;
						}
					}
					if(next_temp_time >= "100"){
						week_EX_TIME = week_EX_TIME + next_temp_time;
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){
					//3
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					if(pre_temp_time >= "100"){ //정상근무 시간이 1시간 이상 일때 평일 정상근무시간에 + ex) 1800 - 1030 = 770 - 40 = 730
					
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NO_TIME = week_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NO_TIME = week_NO_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 야간 근무 시간이 1시간 이상일때 평일 야간 근무 시간에 +
							week_NI_TIME = week_NI_TIME + next_temp_time;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
							
					}
					week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME );
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NO_TIME = week_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NO_TIME = week_NO_TIME + pre_temp_time - 40;
						}
						
					}
					
					week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NO_TIME = week_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NO_TIME = week_NO_TIME + pre_temp_time - 40;
						}
						
					}
					
					week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) > mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){ //1800 2300 ///////////여기서 부터 START 18시작
					//1800~2200시작
					///////////////////////////////
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC"))));
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){// 1830 2230
					
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //2100출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 정상 근무 시간에 + ex) 1800 - 0901 = 899 - 40 = 859
						//2
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
					}
					if(next_temp_time >= "100"){
						week_NI_TIME = week_NI_TIME + next_temp_time;
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
						
					}
					
					/* week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00 */
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0900"){
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0600");
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
					} 
					if(next_temp_time >= "100"){
						week_EX_TIME = week_EX_TIME + next_temp_time;
					}
					week_NI_TIME = week_NI_TIME + 800;
					var temp_EX	= week_EX_TIME % 100;
					if(temp_EX/10 == 6){
						week_EX_TIME = week_EX_TIME + 40;
						
					}
					/* week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00 */
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0900"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0900");
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
					} 
					if(next_temp_time >= "100"){
						week_NO_TIME = week_NO_TIME + next_temp_time;
					}
					week_NI_TIME = week_NI_TIME + 800;
					week_EX_TIME = week_EX_TIME + 300;
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
				}
				
			}else if(getTodayLabel(mySheet2.GetCellValue(i, 5)) == 0 || getTodayLabel(mySheet2.GetCellValue(i, 5)) == 6){ // 주말일 때
				//주말 시작!!! 
				if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"){ //0100 0500 //////////////시작시간이 06시 이전일때

					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC")))); //평일야간근무 ex) 0100, 0600
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0900"){// 0300 0800
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //0500출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0600");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_NI_TIME = holi_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_NI_TIME = holi_NI_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
					}
					if(next_temp_time >= "100"){ //연장근무 시간이 1시간 이상일때 평일 연장 근무시간에 +
						
						holi_EX_TIME = holi_EX_TIME + next_temp_time;
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME);
					}
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="1800"){
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0900");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_NI_TIME = holi_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_NI_TIME = holi_NI_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
					}
					if(next_temp_time >= "100"){ // normal 근무 시간이 1시간 이상일때 평일 정상 근무 시간에 +
						
							holi_NO_TIME = holi_NO_TIME + next_temp_time;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), holi_NO_TIME);
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), "300");
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"){
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"1800");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_NI_TIME = holi_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_NI_TIME = holi_NI_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
					}
					if(next_temp_time >= "100"){ // normal 근무 시간이 1시간 이상일때 평일 정상 근무 시간에 +
						
							holi_EX_TIME = holi_EX_TIME + next_temp_time + 300;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME);
							
					}else if(next_temp_time < "100"){
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), "300");
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), "900");
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){ //0100 2300
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_NI_TIME = holi_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_NI_TIME = holi_NI_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 야간시간이 1시간 이상일때 평일 야간 근무 시간에 +
						
						holi_NI_TIME = holi_NI_TIME + next_temp_time;
							
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), "900");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), "700");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) > mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){ //0600 0700 ///////////여기서 부터 START 06시작
					//0600~0900시작
					///////////////////////////////
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC"))));
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="1800"){// 0630 0900
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //0800출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0900");
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 1000 - 0630 = 370 - 40 = 330
					//2
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_EX_TIME = holi_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_EX_TIME = holi_EX_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME);
					}
					if(next_temp_time >= "100"){ //정상근무 시간이 1시간 이상일때 평일 정상 근무시간에 +
						
						holi_NO_TIME = holi_NO_TIME + next_temp_time;
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), holi_NO_TIME);
					}
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"){
					//3
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"1800");
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 정근무시간에 + ex) 1800 - 0930 = 870 - 40 = 830

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_EX_TIME = holi_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_EX_TIME = holi_EX_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 연장 근무 시간이 1시간 이상일때 평일 연장 근무 시간에 +
						
							holi_EX_TIME = holi_EX_TIME + next_temp_time;
							
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), "900");
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){
					//4
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
					
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_EX_TIME = holi_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_EX_TIME = holi_EX_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 야간 근무 시간이 1시간 이상일때 평일 야간 근무 시간에 +
							holi_NI_TIME = holi_NI_TIME + next_temp_time;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
							
					}else if(next_temp_time < "100"){
					}
					holi_EX_TIME = holi_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), "900");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_EX_TIME = holi_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_EX_TIME = holi_EX_TIME + pre_temp_time - 40;
						}
						
					}
					
					holi_EX_TIME = holi_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), "900");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="1800"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) > mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){ //0900 1800 ///////////여기서 부터 START 09시작
					//0900~1800시작
					///////////////////////////////
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC"))));
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"){// 0930 1830
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //1700출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"1800");
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 정상 근무 시간에 + ex) 1800 - 0901 = 899 - 40 = 859
						//2
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_NO_TIME = holi_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_NO_TIME = holi_NO_TIME + pre_temp_time - 40;
						}
					}
					if(next_temp_time >= "100"){
						holi_EX_TIME = holi_EX_TIME + next_temp_time;
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), holi_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){
					//3
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					if(pre_temp_time >= "100"){ //정상근무 시간이 1시간 이상 일때 평일 정상근무시간에 + ex) 1800 - 1030 = 770 - 40 = 730
					
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_NO_TIME = holi_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_NO_TIME = holi_NO_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 야간 근무 시간이 1시간 이상일때 평일 야간 근무 시간에 +
							holi_NI_TIME = holi_NI_TIME + next_temp_time;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
							
					}else if(next_temp_time < "100"){
					}
					holi_EX_TIME = holi_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), holi_NO_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME );
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_NO_TIME = holi_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_NO_TIME = holi_NO_TIME + pre_temp_time - 40;
						}
						
					}
					
					holi_EX_TIME = holi_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), holi_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_NO_TIME = holi_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_NO_TIME = holi_NO_TIME + pre_temp_time - 40;
						}
						
					}
					
					holi_EX_TIME = holi_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), holi_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) > mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){ //1800 2300 ///////////여기서 부터 START 18시작
					//1800~2200시작
					///////////////////////////////
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC"))));
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){// 1830 2230
					
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //2100출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 정상 근무 시간에 + ex) 1800 - 0901 = 899 - 40 = 859
						//2
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_EX_TIME = holi_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_EX_TIME = holi_EX_TIME + pre_temp_time - 40;
						}
					}
					if(next_temp_time >= "100"){
						holi_NI_TIME = holi_NI_TIME + next_temp_time;
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_EX_TIME = holi_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_EX_TIME = holi_EX_TIME + pre_temp_time - 40;
						}
						
					}
					
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), holi_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0900"){
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0600");
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_EX_TIME = holi_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_EX_TIME = holi_EX_TIME + pre_temp_time - 40;
						}
					} 
					if(next_temp_time >= "100"){
						holi_EX_TIME = holi_EX_TIME + next_temp_time;
					}
					holi_NI_TIME = holi_NI_TIME + 800;
					var temp_EX	= holi_EX_TIME % 100;
					if(temp_EX/10 == 6){
						holi_EX_TIME = holi_EX_TIME + 40;
						
					}
					/* holi_EX_TIME = holi_EX_TIME + 400; //기본 18:00 ~ 22:00 */
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0900"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0900");
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_EX_TIME = holi_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_EX_TIME = holi_EX_TIME + pre_temp_time - 40;
						}
					} 
					if(next_temp_time >= "100"){
						holi_NO_TIME = holi_NO_TIME + next_temp_time;
					}
					holi_NI_TIME = holi_NI_TIME + 800;
					holi_EX_TIME = holi_EX_TIME + 300;
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), holi_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME);
				}
			}
			//시간을 분으로
			mySheet2.SetCellValue(i,13,(mySheet2.GetCellValue(i, 13)/100)*60 + mySheet2.GetCellValue(i, 13)%100);
			mySheet2.SetCellValue(i,14,mySheet2.GetCellValue(i, 14)/100*60 + mySheet2.GetCellValue(i, 14)%100);
			mySheet2.SetCellValue(i,15,mySheet2.GetCellValue(i, 15)/100*60 + mySheet2.GetCellValue(i, 15)%100);
			mySheet2.SetCellValue(i,16,mySheet2.GetCellValue(i, 16)/100*60 + mySheet2.GetCellValue(i, 16)%100);
			mySheet2.SetCellValue(i,17,mySheet2.GetCellValue(i, 17)/100*60 + mySheet2.GetCellValue(i, 17)%100);
			mySheet2.SetCellValue(i,18,mySheet2.GetCellValue(i, 18)/100*60 + mySheet2.GetCellValue(i, 18)%100);
		}
	}
	function mySheet2_OnClick(Row, Col){
		//오른쪽 근무시간에 아이비시트에서 계산된 것을 뿌려줌
		
		if(Row!=0){
			$('input[name=myRow]').val(Row);
			var abcde = $('input[name=weekday_NORMAL_WORK_TIME]').val(textWithtimeFormat(mySheet2.GetCellValue(Row, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"))));
			$('input[name=weekday_EXTENSION_WORK_TIME]').val(textWithtimeFormat(mySheet2.GetCellValue(Row, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"))));
			$('input[name=weekday_NIGHT_WORK_TIME]').val(textWithtimeFormat(mySheet2.GetCellValue(Row, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"))));
			
			$('input[name=holiday_NORMAL_WORK_TIME]').val(textWithtimeFormat(mySheet2.GetCellValue(Row, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"))));
			$('input[name=holiday_EXTENSION_WORK_TIME]').val(textWithtimeFormat(mySheet2.GetCellValue(Row, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"))));
			$('input[name=holiday_NIGHT_WORK_TIME]').val(textWithtimeFormat(mySheet2.GetCellValue(Row, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"))));
		}
	}
	function textWithtimeFormat(x) {
		if(x > 10000){
			var temp_x = x.toString().replace(/\B(?=(\d{2})+(?!\d))/g, ":");
			return temp_x.replace('','');
		}else if(x < 10000&& x >= 1000){
			return x.toString().replace(/\B(?=(\d{2})+(?!\d))/g, "");
		}else if(x < 1000 && x >= 100){
			return  " "+ x.toString().replace(/\B(?=(\d{2})+(?!\d))/g, "");
		}else if(x == 0){
			return "";
		}else if(x < 100){
			return "" +  x.toString().replace(/\B(?=(\d{2})+(?!\d))/g, ":");
		}
	    
	}
	function HourWithminFormat(x){
		alert((x/100)*60 + (x%100));
		return (x/100)*60 + (x%100);
	}


	//평일정상근무시간 : week_NO_TIME
	//평일연장근무시간 : week_EX_TIME
	//평일야간근무시간 : week_NI_TIME
	//휴일정상근무시간 : holi_NO_TIME
	//휴일연장근무시간 : holi_EX_TIME
	//휴일야간근무시간 : holi_NI_TIME
	function mySheet2_OnSearchEnd(Code, Msg){ //mySheet2 근태 정보 검색한 후
		mySheet2.SetWaitImageVisible(0);
		mySheet3.SetWaitImageVisible(0);
		//,BUTTON HIDDEN과 EDIT 0이 여기서 시작
		
		var Maskingcell = mySheet2.GetDataLastRow();
		
		for(let i = 1; i <= Maskingcell; i++){
			var week_NO_TIME = 0, week_EX_TIME = 0, week_NI_TIME = 0, holi_NO_TIME = 0, holi_EX_TIME = 0, holi_NI_TIME = 0;
			if(getTodayLabel(mySheet2.GetCellValue(i, 5)) >=1 & getTodayLabel(mySheet2.GetCellValue(i, 5)) <= 5){ //평일 일 때
				if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"){ //0100 0500 //////////////시작시간이 06시 이전일때

					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC")))); //평일야간근무 ex) 0100, 0600
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0900"){// 0300 0800
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //0500출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0600");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NI_TIME = week_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NI_TIME = week_NI_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					}
					if(next_temp_time >= "100"){ //연장근무 시간이 1시간 이상일때 평일 연장 근무시간에 +
						
						week_EX_TIME = week_EX_TIME + next_temp_time;
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
					}
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="1800"){
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0900");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NI_TIME = week_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NI_TIME = week_NI_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					}
					if(next_temp_time >= "100"){ // normal 근무 시간이 1시간 이상일때 평일 정상 근무 시간에 +
						
							week_NO_TIME = week_NO_TIME + next_temp_time;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), "300");
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"){
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"1800");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NI_TIME = week_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NI_TIME = week_NI_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					}
					if(next_temp_time >= "100"){ // normal 근무 시간이 1시간 이상일때 평일 정상 근무 시간에 +
						
							week_EX_TIME = week_EX_TIME + next_temp_time + 300;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
							
					}else if(next_temp_time < "100"){
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), "300");
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), "900");
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){ //0100 2300
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NI_TIME = week_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NI_TIME = week_NI_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 야간시간이 1시간 이상일때 평일 야간 근무 시간에 +
						
						week_NI_TIME = week_NI_TIME + next_temp_time;
							
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), "900");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), "700");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) > mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){ //0600 0700 ///////////여기서 부터 START 06시작
					//0600~0900시작
					///////////////////////////////
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC"))));
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="1800"){// 0630 0900
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //0800출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0900");
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 1000 - 0630 = 370 - 40 = 330
					//2
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
					}
					if(next_temp_time >= "100"){ //정상근무 시간이 1시간 이상일때 평일 정상 근무시간에 +
						
						week_NO_TIME = week_NO_TIME + next_temp_time;
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					}
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"){
					//3
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"1800");
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 정근무시간에 + ex) 1800 - 0930 = 870 - 40 = 830

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 연장 근무 시간이 1시간 이상일때 평일 연장 근무 시간에 +
						
							week_EX_TIME = week_EX_TIME + next_temp_time;
							
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), "900");
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
					
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 야간 근무 시간이 1시간 이상일때 평일 야간 근무 시간에 +
							week_NI_TIME = week_NI_TIME + next_temp_time;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
							
					}else if(next_temp_time < "100"){
					}
					week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), "900");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
						
					}
					
					week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), "900");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="1800"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) > mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){ //0900 1800 ///////////여기서 부터 START 09시작
					//0900~1800시작
					///////////////////////////////
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC"))));
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"){// 0930 1830
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //1700출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"1800");
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 정상 근무 시간에 + ex) 1800 - 0901 = 899 - 40 = 859
						//2
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NO_TIME = week_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NO_TIME = week_NO_TIME + pre_temp_time - 40;
						}
					}
					if(next_temp_time >= "100"){
						week_EX_TIME = week_EX_TIME + next_temp_time;
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){
					//3
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					if(pre_temp_time >= "100"){ //정상근무 시간이 1시간 이상 일때 평일 정상근무시간에 + ex) 1800 - 1030 = 770 - 40 = 730
					
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NO_TIME = week_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NO_TIME = week_NO_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 야간 근무 시간이 1시간 이상일때 평일 야간 근무 시간에 +
							week_NI_TIME = week_NI_TIME + next_temp_time;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
							
					}
					week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME );
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NO_TIME = week_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NO_TIME = week_NO_TIME + pre_temp_time - 40;
						}
						
					}
					
					week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_NO_TIME = week_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_NO_TIME = week_NO_TIME + pre_temp_time - 40;
						}
						
					}
					
					week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) > mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){ //1800 2300 ///////////여기서 부터 START 18시작
					//1800~2200시작
					///////////////////////////////
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC"))));
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){// 1830 2230
					
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //2100출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 정상 근무 시간에 + ex) 1800 - 0901 = 899 - 40 = 859
						//2
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
					}
					if(next_temp_time >= "100"){
						week_NI_TIME = week_NI_TIME + next_temp_time;
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
						
					}
					
					/* week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00 */
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0900"){
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0600");
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
					} 
					if(next_temp_time >= "100"){
						week_EX_TIME = week_EX_TIME + next_temp_time;
					}
					week_NI_TIME = week_NI_TIME + 800;
					var temp_EX	= week_EX_TIME % 100;
					if(temp_EX/10 == 6){
						week_EX_TIME = week_EX_TIME + 40;
						
					}
					/* week_EX_TIME = week_EX_TIME + 400; //기본 18:00 ~ 22:00 */
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0900"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0900");
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							week_EX_TIME = week_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							week_EX_TIME = week_EX_TIME + pre_temp_time - 40;
						}
					} 
					if(next_temp_time >= "100"){
						week_NO_TIME = week_NO_TIME + next_temp_time;
					}
					week_NI_TIME = week_NI_TIME + 800;
					week_EX_TIME = week_EX_TIME + 300;
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NIGHT_WORK_TIME"), week_NI_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_NORMAL_WORK_TIME"), week_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("weekday_EXTENSION_WORK_TIME"), week_EX_TIME);
				}
				
			}else if(getTodayLabel(mySheet2.GetCellValue(i, 5)) == 0 || getTodayLabel(mySheet2.GetCellValue(i, 5)) == 6){ // 주말일 때
				//주말 시작!!! 
				if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"){ //0100 0500 //////////////시작시간이 06시 이전일때

					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC")))); //평일야간근무 ex) 0100, 0600
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0900"){// 0300 0800
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //0500출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0600");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_NI_TIME = holi_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_NI_TIME = holi_NI_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
					}
					if(next_temp_time >= "100"){ //연장근무 시간이 1시간 이상일때 평일 연장 근무시간에 +
						
						holi_EX_TIME = holi_EX_TIME + next_temp_time;
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME);
					}
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="1800"){
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0900");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_NI_TIME = holi_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_NI_TIME = holi_NI_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
					}
					if(next_temp_time >= "100"){ // normal 근무 시간이 1시간 이상일때 평일 정상 근무 시간에 +
						
							holi_NO_TIME = holi_NO_TIME + next_temp_time;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), holi_NO_TIME);
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), "300");
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"){
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"1800");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_NI_TIME = holi_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_NI_TIME = holi_NI_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
					}
					if(next_temp_time >= "100"){ // normal 근무 시간이 1시간 이상일때 평일 정상 근무 시간에 +
						
							holi_EX_TIME = holi_EX_TIME + next_temp_time + 300;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME);
							
					}else if(next_temp_time < "100"){
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), "300");
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), "900");
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){ //0100 2300
					
					var pre_temp_time = ("0600"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					if(pre_temp_time >= "100"){ //야간 근무 시간이 1시간 이상 일때 평일 야간근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_NI_TIME = holi_NI_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_NI_TIME = holi_NI_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 야간시간이 1시간 이상일때 평일 야간 근무 시간에 +
						
						holi_NI_TIME = holi_NI_TIME + next_temp_time;
							
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), "900");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), "700");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) > mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){ //0600 0700 ///////////여기서 부터 START 06시작
					//0600~0900시작
					///////////////////////////////
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC"))));
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="1800"){// 0630 0900
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //0800출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0900");
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 1000 - 0630 = 370 - 40 = 330
					//2
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_EX_TIME = holi_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_EX_TIME = holi_EX_TIME + pre_temp_time - 40;
						}
						
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME);
					}
					if(next_temp_time >= "100"){ //정상근무 시간이 1시간 이상일때 평일 정상 근무시간에 +
						
						holi_NO_TIME = holi_NO_TIME + next_temp_time;
						mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), holi_NO_TIME);
					}
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"){
					//3
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"1800");
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 정근무시간에 + ex) 1800 - 0930 = 870 - 40 = 830

						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_EX_TIME = holi_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_EX_TIME = holi_EX_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 연장 근무 시간이 1시간 이상일때 평일 연장 근무 시간에 +
						
							holi_EX_TIME = holi_EX_TIME + next_temp_time;
							
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), "900");
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){
					//4
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
					
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_EX_TIME = holi_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_EX_TIME = holi_EX_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 야간 근무 시간이 1시간 이상일때 평일 야간 근무 시간에 +
							holi_NI_TIME = holi_NI_TIME + next_temp_time;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
							
					}else if(next_temp_time < "100"){
					}
					holi_EX_TIME = holi_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), "900");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0600" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("0900"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //연장 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_EX_TIME = holi_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_EX_TIME = holi_EX_TIME + pre_temp_time - 40;
						}
						
					}
					
					holi_EX_TIME = holi_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), "900");
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="1800"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) > mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){ //0900 1800 ///////////여기서 부터 START 09시작
					//0900~1800시작
					///////////////////////////////
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC"))));
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"){// 0930 1830
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //1700출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"1800");
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 정상 근무 시간에 + ex) 1800 - 0901 = 899 - 40 = 859
						//2
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_NO_TIME = holi_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_NO_TIME = holi_NO_TIME + pre_temp_time - 40;
						}
					}
					if(next_temp_time >= "100"){
						holi_EX_TIME = holi_EX_TIME + next_temp_time;
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), holi_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){
					//3
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					if(pre_temp_time >= "100"){ //정상근무 시간이 1시간 이상 일때 평일 정상근무시간에 + ex) 1800 - 1030 = 770 - 40 = 730
					
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_NO_TIME = holi_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_NO_TIME = holi_NO_TIME + pre_temp_time - 40;
						}
						
					}
					if(next_temp_time >= "100"){ // 야간 근무 시간이 1시간 이상일때 평일 야간 근무 시간에 +
							holi_NI_TIME = holi_NI_TIME + next_temp_time;
							mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
							
					}else if(next_temp_time < "100"){
					}
					holi_EX_TIME = holi_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), holi_NO_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME );
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_NO_TIME = holi_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_NO_TIME = holi_NO_TIME + pre_temp_time - 40;
						}
						
					}
					
					holi_EX_TIME = holi_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), holi_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="0900" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("1800"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_NO_TIME = holi_NO_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_NO_TIME = holi_NO_TIME + pre_temp_time - 40;
						}
						
					}
					
					holi_EX_TIME = holi_EX_TIME + 400; //기본 18:00 ~ 22:00
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), holi_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="2200"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) > mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){ //1800 2300 ///////////여기서 부터 START 18시작
					//1800~2200시작
					///////////////////////////////
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_TOTAL_TIME_CALC"))));
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"2200"){// 1830 2230
					
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))); //2100출근시간이면 100이 출력
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"2200");
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 정상 근무 시간에 + ex) 1800 - 0901 = 899 - 40 = 859
						//2
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_EX_TIME = holi_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_EX_TIME = holi_EX_TIME + pre_temp_time - 40;
						}
					}
					if(next_temp_time >= "100"){
						holi_NI_TIME = holi_NI_TIME + next_temp_time;
						
					}
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var NI_num = Number("200");
					var end_num = Number(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")));
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (NI_num + end_num);
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_EX_TIME = holi_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_EX_TIME = holi_EX_TIME + pre_temp_time - 40;
						}
						
					}
					
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), holi_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), next_temp_time);
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0600"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))<="0900"){
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0600");
					
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_EX_TIME = holi_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_EX_TIME = holi_EX_TIME + pre_temp_time - 40;
						}
					} 
					if(next_temp_time >= "100"){
						holi_EX_TIME = holi_EX_TIME + next_temp_time;
					}
					holi_NI_TIME = holi_NI_TIME + 800;
					var temp_EX	= holi_EX_TIME % 100;
					if(temp_EX/10 == 6){
						holi_EX_TIME = holi_EX_TIME + 40;
						
					}
					/* holi_EX_TIME = holi_EX_TIME + 400; //기본 18:00 ~ 22:00 */
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME); //지우고 100EX에 400을 넣어주어야한다.
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
					
				}else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))>="1800" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))<"2200" && mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0900"&& mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME")) < mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME"))){
					var pre_temp_time = ("2200"-mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_START_TIME")));
					var next_temp_time = (mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_END_TIME"))-"0900");
					if(pre_temp_time >= "100"){ //정상 근무 시간이 1시간 이상 일때 평일 연장근무시간에 + ex) 0600 - 0430 = 170 - 40 = 130
						
						if((pre_temp_time) % 100 == 0){ //100, 200, 300
							holi_EX_TIME = holi_EX_TIME + pre_temp_time;
						}else if((pre_temp_time) % 100 != 0){
							holi_EX_TIME = holi_EX_TIME + pre_temp_time - 40;
						}
					} 
					if(next_temp_time >= "100"){
						holi_NO_TIME = holi_NO_TIME + next_temp_time;
					}
					holi_NI_TIME = holi_NI_TIME + 800;
					holi_EX_TIME = holi_EX_TIME + 300;
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NIGHT_WORK_TIME"), holi_NI_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_NORMAL_WORK_TIME"), holi_NO_TIME);
					mySheet2.SetCellValue(i, mySheet2.SaveNameCol("holiday_EXTENSION_WORK_TIME"), holi_EX_TIME);
				}
			}//주말 끝
			//시간을 분으로
			mySheet2.SetCellValue(i,13,(mySheet2.GetCellValue(i, 13)/100)*60 + mySheet2.GetCellValue(i, 13)%100);
			mySheet2.SetCellValue(i,14,mySheet2.GetCellValue(i, 14)/100*60 + mySheet2.GetCellValue(i, 14)%100);
			mySheet2.SetCellValue(i,15,mySheet2.GetCellValue(i, 15)/100*60 + mySheet2.GetCellValue(i, 15)%100);
			mySheet2.SetCellValue(i,16,mySheet2.GetCellValue(i, 16)/100*60 + mySheet2.GetCellValue(i, 16)%100);
			mySheet2.SetCellValue(i,17,mySheet2.GetCellValue(i, 17)/100*60 + mySheet2.GetCellValue(i, 17)%100);
			mySheet2.SetCellValue(i,18,mySheet2.GetCellValue(i, 18)/100*60 + mySheet2.GetCellValue(i, 18)%100);
		}
		
		mySheet3.DoSearch("${contextPath}/wm/p0001/TWS_searchList.do", "P_EMP_CODE=" + mySheet.GetCellValue(mySheet.GetSelectRow(), 0) + "&monthpicker=" +$('#monthpicker').val());
	}
	function mySheet2_OnBeforeEdit(Row, Col) {
		//출근, 조퇴, 외출 프로세스
		if(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME"))<="0900" && mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_END_TIME"))>="1800"){ //정상출근
			mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"), "00");
		}else if(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME"))=="0900" && mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_END_TIME"))>"0900" && mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_END_TIME"))<"1800"){ //조퇴
			mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"), "02"); 
		}else if(mySheet2.GetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_START_TIME"))>"0900"){ //지각
			mySheet2.SetCellValue(mySheet2.GetSelectRow(), mySheet2.SaveNameCol("working_STATUS_DESC"), "01");
		}
		
		
		///////////////////////////////////////////////////////////////////평일 휴일 정상근무 휴일정상근무 프로세스
		
	}
	function mySheet2_OnChange(Row, Col){
		//출근, 조퇴, 외출 프로세스
		
		///////////////////////////////////////////////////////////////////평일 휴일 정상근무 휴일정상근무 프로세스
	
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
	
	//MYSHEET3 저장 후
	function mySheet3_OnSaveEnd(code, msg) {
		if (msg != "") {
			alert(msg);
			/* alert("mysheet3 저장"); */
			//번호 다시 매기기
			/* mySheet3.SetHeaderBackColor("#c9e1f5"); 
			mySheet3.SetHeaderFontColor("#000000");  */
		}
		mySheet2.DoSearch("${contextPath}/wm/p0001/WS_searchList.do", "P_EMP_CODE=" + mySheet.GetCellValue(mySheet.GetSelectRow(), 0) + "&monthpicker=" +$('#monthpicker').val());
	}

	//정산하여 sheet3을 저장한 후 
	/* function mySheet3_OnSaveEnd(Row, Col){
		
		mySheet3.SetRowBackColor(1,"#ffff80"); 
	} */
	function mySheet3_OnBeforeSave() {
	}

	function mySheet3_OnSearchEnd(Code, message){
		/* mySheet3.SetDataFontColor("#ffffff"); */
		var T_Maskingcell = mySheet2.GetDataLastRow();
		
		if(mySheet3.GetCellValue(1, 2) == -1){ //조회되지않음=-1 //조회되지않았을 경우 //마감 취소 X 마감 O 정산 O 추가 O
			$("#add").show();
			$("#dead_buttons").show(); 
			$("#dead_cancel_buttons").hide(); 
			$("#sum").show();
			
		}else if(mySheet3.GetCellValue(1, 2) != -1){ //조회된 상태 != -1 //조회된 경우 - 정산까지 한 경우  마감 취소 X 마감 O 정산 O 추가 O
			$("#add").show();
			$("#dead_buttons").show(); 
			$("#dead_cancel_buttons").hide(); 
			$("#sum").show();
			for(let i = 1; i <= T_Maskingcell; i++){
				mySheet2.SetRowBackColor(i,"#ffff80");
			}
			mySheet3.SetRowBackColor(1,"#ffff80");
			 //전체 로우의 수를 구한다.
			for(let i = 1; i <= T_Maskingcell; i++){
				if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_YN")) == 'N'){ //정산은 했지만 마감하지 않았을 경우 그 Row는 edit : 1
					mySheet2.SetRowEditable(i,1); 
					
					$("#dead_cancel_buttons").hide(); //마감 취소 버튼 숨김
					$("#dead_buttons").show(); //마감 버튼 보여줌
					$("#sum").show(); //정산 버튼 보여줌
					$("#add").show();//추가 버튼 보여줌
					/* alert(mySheet3.GetCellValue(1, 0)); */
					mySheet3.SetCellValue(2, 0, "I");   //상태 셀을 "입력" 상태로 설정
					/* alert(mySheet3.GetCellValue(1, 0)); */
					
					
				}
				else if(mySheet2.GetCellValue(i, mySheet2.SaveNameCol("working_STATUS_YN")) == 'Y'){ //정산도 하고 //마감했을 때
					mySheet2.SetRowEditable(i,0); 
					$("#dead_cancel_buttons").show(); //마감 취소 버튼 보여줌
					$("#dead_buttons").hide(); //마감 버튼 숨김
					$("#sum").hide(); //정산 버튼 숨김
					$("#add").hide();//추가 버튼 숨김
					mySheet2.SetRowBackColor(i,"#e0e0e0");
					//마감이 된 상태이기에 탐색하여 sheet3의 조회
					mySheet3.SetRowBackColor(1, "#e0e0e0"); //회색
					
				}
			}
			
		}
		
	}
	
	function mySheet2_OnSaveEnd(code,msg){
		//저장후 바로 sheet2 검색해서 update
		mySheet2.DoSearch("${contextPath}/wm/p0001/WS_searchList.do", "P_EMP_CODE=" + mySheet.GetCellValue(mySheet.GetSelectRow(), 0) + "&monthpicker=" +$('#monthpicker').val());
		if (msg != "") {
			alert(msg);
			/* alert("mysheet3 저장"); */
			//번호 다시 매기기
			/* mySheet3.SetHeaderBackColor("#FF0000"); 
			mySheet3.SetHeaderFontColor("#ffffff"); */ 
		}
	}
	function selectSite(){
		var searchList = $('#searchList').val();
		console.log(searchList);
		$.ajax({
			url : "${contextPath}/sm/p0006/SiteList.do", //목록을 조회할 url
			
			type : "POST",
			
			dataType : "JSON",
			
			success : function(data){
				for(var i = 0; i< data['Data'].length; i++){
					var option = "<option name='1' value='" + data['Data'][i].site_NAME + "'>"
						+ data['Data'][i].site_NAME + "</option>";
						
				//대상 콤보박스에 추가
				
				$('#SiteList').append(option);
				
				}
			},
			
			error : function(jqxhr, status, error){
				alert("에러");
			}
		});
		
	};
	function selectDept(){
		
		var SiteList = $('#SiteList').val();
		console.log(SiteList);
		
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
.deadbuttons {
	margin-top: 40px;
	margin: 10px;
	position: absolute;
	right: 420px;
}

.dead_cancel_buttons {
	margin-top: 40px;
	margin: 10px;
	position: absolute;
	right: 480px;
}

.otherbuttons {
	margin-top: 40px;
	margin: 10px;
	position: absolute;
	right: 320px;
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
	width: 1450px;
}
.center{
	position: relative;
	top: -285px;
	left: 520px;
	width: 670px;
	/* 670px; */
}
.right_end{
position: relative;
top: -785px;
left: 1150px;
width: 360px;
background: #d4d4d4;
border-radius: 10px;
height: 500px;
}
.right_end table {
height: 60%;
vertical-align: middle;
}

.right_end table{
font-size:12px;
padding: 30px;
}


.right_end table tr td:nth-child(1) span{
text-align:right;
background: #5E5E5E;
padding: 5px 10px 5px 10px;
    color: white;
    border-radius: 4px;
    vertical-align: middle;
    font-weight: normal;
}
.right_end table tr td:nth-child(2){
width: 20px;
}

.right_end table tr td:nth-child(3) input{
height: 20px;
	border-radius: 3px;
	border: none;
	padding-right: 10px;
	vertical-align: middle;
	text-align: right;
	width: 60px;
} 

.bottom{
position: relative;
    top: -770px;
    left: 60px;
width: 1450px;
border-top: 2px solid #C3C3C3;
padding-top: 15px;
height: 95px;
}
.leftbottom{
position: relative;
	top: 230px;
	left: 60px;
	width: 430px;
border-right: 2px solid #C3C3C3;
margin-right: 15px;
padding-bottom: 15px;
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
}

.left input, select{
	height: 22px;
	border-radius: 3px;
	border: none;
	padding-left:5px;
	vertical-align: middle;
}
.left span{
margin-left: 110px;
	background: #5E5E5E;
    padding: 5px 5px;
    color: white;
    border-radius: 5px;
    margin-right: 10px;
    vertical-align: middle;
}



.GridMain1 .GridMain2 .GMMainTable {
	border: 0px;
}
.ui-datepicker table{ font-size: 12px; }
.ui-widget input, .ui-widget select, .ui-widget textarea, .ui-widget button{ width:40%; font-size: 14px; }
img {vertical-align: middle; padding: 0px 5px 0px 2px; }

</style>
</head>
<body onload="LoadPage()" >
	<div class="leftbuttons">
		<a href="javascript:doAction('excel')" class="IBbutton">엑셀</a>
	</div>
	<div class="dead_cancel_buttons">
		<a href="javascript:doAction('deadline_cancel')" class="IBbutton" id="dead_cancel_buttons">마감취소</a>
	</div>
	<div class="deadbuttons">
		<a href="javascript:doAction('deadline')" class="IBbutton" id="dead_buttons">마감</a>
	</div>
	<div class="otherbuttons" id="sum">
		<a href="javascript:doAction('calculate')" class="IBbutton">정산</a> 
	</div>
	<div class="rightbuttons" id="all">
		<a href="javascript:doAction('reload')" class="IBbutton">초기화</a> 
		<a href="javascript:doAction('insert')" class="IBbutton" id="add">추가</a>
		<a href="javascript:doAction('search')" class="IBbutton">조회</a> <a
			href="javascript:doAction('save')" class="IBbutton">저장</a>
	</div>

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 근태관리 : 근태입력
		</header>
	</div>
	<div class="left">
		<form id="searchBar" name="searchBar">
			<span class="yearMonth">귀속연월</span> 
			<input id="monthpicker" type="text">
			<img id="btn_monthpicker" src="${contextPath}/resources/image/icons/icon_calendar.png">
			
			<span class="kindofsearch">사업장구분</span>
				<select id="SiteList" onchange="selectDept()">
					<option value="" selected>전체</option>
				</select>
			<span class="kindofsearch">부서</span>
				<select id="DeptList">
		    		<option value="" selected>전체</option>
				</select>
			<span class="kindofsearch">구분</span>
			<select id="Employee_Select" >
				<option value="" selected>구분</option>
				<option value="employee_name">사원명</option>
				<option value="employee_code">사원코드</option>
			</select>
			<input type="text" id="p_text" placeholder="사원명 or사원코드">
			<input type="hidden" id="Ppayment_code">
			<input type="hidden" id="Ppayment_des_name">
	
		</form>
		
	</div>
	<div class="leftbottom">
	<script>createIBSheet("mySheet", "100%", "100%");
		selectSite();
		</script>
	</div>
	<div class="center">
		<script>createIBSheet("mySheet2", "100%", "100%");</script>
		
	</div>
	
	<form id=WORK_TIME>
	
	<div class="right_end">
	
		<table>
			<tr>
				<td><span>평일정상근무시간(분)</span></td>
				<td><input type="hidden" name="myRow"></td>
				<td><input type="text" name="weekday_NORMAL_WORK_TIME" maxlength="5" class="WORK_TIME"  placeholder="_____" > 시간(분)</td>
			</tr>
			<tr>
				<td><span>평일연장근무시간(분)</span></td>
				<td></td>
				<td><input type="text" name="weekday_EXTENSION_WORK_TIME" maxlength="5" class="WORK_TIME"  placeholder="_____" > 시간(분)</td>
			</tr>
			<tr>
				<td><span>평일야간근무시간(분)</span></td>
				<td></td>
				<td><input type="text" name="weekday_NIGHT_WORK_TIME" maxlength="5" class="WORK_TIME"  placeholder="_____" > 시간(분)</td>
			</tr>
			<tr>
				<td><span>휴일정상근무시간(분)</span></td>
				<td></td>
				<td><input type="text" name="holiday_NORMAL_WORK_TIME" maxlength="5" class="WORK_TIME"  placeholder="_____" > 시간(분)</td>
			</tr>
			<tr>
				<td><span>휴일연장근무시간(분)</span></td>
				<td></td>
				<td><input type="text" name="holiday_EXTENSION_WORK_TIME" maxlength="5" class="WORK_TIME" placeholder="_____" > 시간(분)</td>
			</tr>
			<tr>
				<td><span>휴일야간근무시간(분)</span></td>
				<td></td>
				<td><input type="text" name="holiday_NIGHT_WORK_TIME" maxlength="5" class="WORK_TIME" placeholder="_____" > 시간(분)</td>
			</tr>
		</table>
	</div>
	</form>
	<div class="bottom">
		<script>createIBSheet("mySheet3", "100%", "100%");</script>
	</div>

</body>
</html>