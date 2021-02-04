
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
<link href="${contextPath}/resources/tab/css/ibtab-style.css"
	rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js"
	type="text/javascript"></script>
<script language="javascript">

function LoadPage() {
	
	

//탭
 createIBTab($('#tab1')[0], $('#tab_contents1')[0], 'myTabs1', {
	 themes: {
        tabs: "flat_blue",
        contents: "flat_blue",
        contextMenu: "flat_blue"
    },
    allowCloseBTN: false
});

//탭2   
createIBTab($('#tab2')[0], $('#tab_contents_2')[0], 'myTabs2', {
	themes: {
        tabs: "flat_blue",
        contents: "flat_blue",
        contextMenu: "flat_blue"
    },
    allowCloseBTN: false
});

	/*Sheet 기본 설정 */
	
		
		 //mySheet1 //사원정보
		mySheet.RemoveAll();
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
		initSheet.Cols = [
			{Header:"상태",SaveName:"sStatus",Type:"Status",align:"Center",Width:60},
			{Header:"삭제",SaveName:"DEL_CHK",Type:"DelCheck",Width:60},
	        {Header:"사원코드",Type:"Text",SaveName:"employee_code",KeyField:1,Align:"Center",Edit:0,Width:100},	
			{Header:"사원명",Type:"Text",SaveName:"employee_name",MinWidth:100, Align:"Center",Edit:0,Width:140},
	        {Header:"키",Type:"Text",SaveName:"height",Hidden:1 },         
	        {Header:"몸무게",Type:"Text",SaveName:"weight",Hidden:1},         
	        {Header:"혈액형",Type:"Text",SaveName:"blood_type",Hidden:1},         
	        {Header:"취미",Type:"Text",SaveName:"hobby",Hidden:1},         
	        {Header:"특기",Type:"Text",SaveName:"special_ability",Hidden:1},
	        {Header:"장애구분",Type:"Text",SaveName:"handicapped_yn",Hidden:1},         
	        {Header:"결혼여부",Type:"Text",SaveName:"marriage_yn",Hidden:1},         
	        {Header:"종교",Type:"Text",SaveName:"religion",Hidden:1},
	        {Header:"거주구분",Type:"Text",SaveName:"residential_division",Hidden:1},
	        {Header:"병역구분",Type:"Text",SaveName:"military_type",Hidden:1},         
	        {Header:"군번",Type:"Text",SaveName:"military_number",Hidden:1},
	        {Header:"제대구분",Type:"Text",SaveName:"discharge_yn",Hidden:1}
	        
		];  
		IBS_InitSheet(mySheet , initSheet);
  
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet.SetSheetHeight(700);
		mySheet.SetWaitImageVisible(0);

		
		
		 //mySheet2 //학력
		  var initData = {};
          initData.Cfg = {SearchMode:smLazyLoad, Page:50,MergeSheet:msHeaderOnly,ChildPage:10,DragMode:1 };
		  initData.Cols = [
		  {Header:"상태",SaveName:"sStatus",Type:"Status",Align:"Center",Width:60},
		  {Header:"삭제",SaveName:"DEL_CHK",Type:"DelCheck",Align:"Center",Width:60},
          {Header:"사원학력고유번호",Type:"Text", SaveName:"education_code",Hidden:1},
          {Header:"학교명",Type:"Text", SaveName:"school_name", Width:160, Align:"Center"},
          {Header:"입학일",Type:"Text", SaveName:"start_date", Width:170, Align:"Center",Format:"Ymd"},
          {Header:"졸업일",Type:"Text", SaveName:"end_date", Width:170, Align:"Center",Format:"Ymd"},
          {Header:"구분",Type:"Combo", SaveName:"available", Width:100, Align:"Center", ComboText:"졸업|중퇴|휴학", ComboCode:"졸업|중퇴|휴학"},
          {Header:"전공과목",Type:"Text", SaveName:"major", Width:120, Align:"Center"},
          {Header:"부전공",Type:"Text", SaveName:"minor", Width:120, Align:"Center"},
          {Header:"학위구분",Type:"Text", SaveName:"graduate_yn", Width:60, Align:"Center"}
      ];
 
		createIBSheet2($("#ib-container2")[0],"mySheet2", "100%", "300px");
        IBS_InitSheet(mySheet2,initData);
    	mySheet2.SetWaitImageVisible(0);
		mySheet2.SetSheetHeight(230);

        
    //mySheet3 //경력
     initData.Cols = [
		  {Header:"상태",SaveName:"sStatus",Type:"Status",Align:"Center",Width:60},
		  {Header:"삭제",SaveName:"DEL_CHK",Type:"DelCheck",Align:"Center",Width:60},
          {Header:"사원경력고유번호",Type:"Text", SaveName:"career_code",Hidden:1},
          {Header:"직장명",Type:"Text", SaveName:"company_name", Width:130, Align:"Center"},
          {Header:"입사일",Type:"Text", SaveName:"start_date", Width:90, Align:"Center",Format:"Ymd"},
          {Header:"퇴사일",Type:"Text", SaveName:"end_date", Width:90, Align:"Center",Format:"Ymd"},
          {Header:"근무년한",Type:"Text", SaveName:"sum_year", Width:70, Align:"Center"},
          {Header:"담당업무",Type:"Text", SaveName:"role", Width:90, Align:"Center"},
          {Header:"직위",Type:"Text", SaveName:"position", Width:90, Align:"Center"},
          {Header:"급여",Type:"Int", SaveName:"salary", Width:110, Align:"Center"},
          {Header:"퇴직사유",Type:"Text", SaveName:"reason", Width:160, Align:"Center"},
          {Header:"근속기간",Type:"Text", SaveName:"total_work", Width:70, Align:"Center"}
      ];
       createIBSheet2($("#ib-container3")[0],"mySheet3", "100%", "300px");
       IBS_InitSheet(mySheet3,initData);
       mySheet3.SetSheetHeight(230);
       mySheet3.SetWaitImageVisible(0);
   	
    //mySheet4 //면허
     initData.Cols = [
		  {Header:"상태",SaveName:"sStatus",Type:"Status",Align:"Center",Width:60},
		  {Header:"삭제",SaveName:"DEL_CHK",Type:"DelCheck",Width:60},
          {Header:"사원면허번호",Type:"Text", SaveName:"employee_license_code",Hidden:1},
          {Header:"자격증번호",Type:"Text", SaveName:"license_number", Width:160, Align:"Center"},
          {Header:"자격코드",Type:"Text", SaveName:"license_code", Width:150, Align:"Center",Hidden:1},
          {Header:"자격종류",Type:"Popup", SaveName:"license_name", Width: 190, Align:"Center"},
          {Header:"취득일",Type:"Date", SaveName:"start_date", Width:150, Align:"Center",Format:"Ymd"},
          {Header:"만료일",Type:"Date", SaveName:"end_date", Width:150, Align:"Center",Format:"Ymd"},
          {Header:"발행기관",Type:"Text", SaveName:"institute", Width:150, Align:"Center"},
          {Header:"수당",Type:"Combo", SaveName:"bonus", Width:100, Align:"Center", ComboText:"해당|비해당", ComboCode:"해당|비해당"}
      ];
        
     createIBSheet2($("#ib-container4")[0],"mySheet4", "100%", "300px");
     IBS_InitSheet(mySheet4,initData);
     mySheet4.SetSheetHeight(230);
     mySheet4.SetWaitImageVisible(0);
    	
 
		
    //mySheet5 //인사발령
     initData.Cols = [
        {Header:"발령코드",Type:"Text", SaveName:"appoint_code", Width:100, Align:"Center",Edit:0,InsertEdit:"0", UpdateEdit:"0"},
        {Header:"발령구분",Type:"Text", SaveName:"hr_appoint_index_name", Width:80, Align:"Center",Edit:0,InsertEdit:"0", UpdateEdit:"0"},
        {Header:"발령이름",Type:"Text", SaveName:"appoint_title", Width:100, Align:"Center",Edit:0,InsertEdit:"0", UpdateEdit:"0"},
        {Header:"발령일자",Type:"Text", SaveName:"appoint_date", Width:120, Align:"Center",Edit:0, InsertEdit:"0", UpdateEdit:"0",Format:"Ymd"},
        {Header:"발령자",Type:"Text", SaveName:"employee_name", Width:100, Align:"Center",Edit:0, InsertEdit:"0", UpdateEdit:"0"},
        {Header:"재직상태",Type:"Text", SaveName:"work_status_name", Width:80, Align:"Center",Edit:0, InsertEdit:"0", UpdateEdit:"0"},
        {Header:"사업장",Type:"Text", SaveName:"site_name", Width:110, Align:"Center",Edit:0, InsertEdit:"0", UpdateEdit:"0"},
        {Header:"부서",Type:"Text", SaveName:"department_name", Width:110, Align:"Center",Edit:0, InsertEdit:"0", UpdateEdit:"0"},
        {Header:"직급",Type:"Text", SaveName:"position_name", Width:110, Align:"Center",Edit:0, InsertEdit:"0", UpdateEdit:"0"},
        {Header:"직책",Type:"Text", SaveName:"duty_name", Width:110, Align:"Center",Edit:0, InsertEdit:"0", UpdateEdit:"0"}
    ];
         
     createIBSheet2($("#ib-container5")[0],"mySheet5", "100%", "300px");
     IBS_InitSheet(mySheet5,initData);
     mySheet5.SetSheetHeight(330);
     mySheet5.SetWaitImageVisible(0);
 	
    //mySheet6 //인사고과
   initData.Cols = [
		{Header:"상태",SaveName:"sStatus",Type:"Status",Align:"Center",Width:60},
		{Header:"삭제",SaveName:"DEL_CHK",Type:"DelCheck",Width:60},
		{Header:"인사고과고유번호",Type:"Text", SaveName:"hr_assessment_code",Hidden:1,Width:100},
		{Header:"인사고과코드",Type:"Text", SaveName:"assessment_code",Hidden:1},
        {Header:"고과명",Type:"Popup", SaveName:"assessment_name", Width:100, Align:"Center"},
        {Header:"평가시작일",Type:"Text", SaveName:"hr_assessment_test_start_date", Width:130, Align:"Center",Format:"Ymd"},
        {Header:"평가종료일",Type:"Text", SaveName:"hr_assessment_test_end_date", Width:130, Align:"Center",Format:"Ymd"},
        {Header:"고과일",Type:"Text", SaveName:"hr_assessment_date", Width:130, Align:"Center",Format:"Ymd"},
        {Header:"고과자",Type:"Text", SaveName:"hr_assessment_master", Width:110, Align:"Center"},
        {Header:"반영률",Type:"Text", SaveName:"hr_assessment_reflection_pcnt", Width:100, Align:"Center"},
        {Header:"점수",Type:"Text", SaveName:"hr_assessment_score", Width:100, Align:"Center"},
        {Header:"등급",Type:"Text", SaveName:"hr_assessment_grade", Width:100, Align:"Center"}
    ];
         
   createIBSheet2($("#ib-container6")[0],"mySheet6", "100%", "300px");
   IBS_InitSheet(mySheet6,initData);
   mySheet6.SetSheetHeight(330);
   mySheet6.SetWaitImageVisible(0);
	
		 //mySheet7 //근태
	   initData.Cols = [
			{Header:"년월|년월",Type:"Date",Width:30,SaveName:"total_month",Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:120, Format:"Ym"},
			{Header:"평일근무|정상시간(분)",Type:"Text",Width:30,SaveName:"weekday_normal_work_time",Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:90},
			{Header:"평일근무|연장시간(분)",Type:"Text",Width:30,SaveName:"weekday_extension_work_time",Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:90},
			{Header:"평일근무|야간시간(분)",Type:"Text",Width:30,SaveName:"weekday_night_work_time",Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:90},
			{Header:"휴일근무|정상시간(분)",Type:"Text",Width:30,SaveName:"holiday_normal_work_time",Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:90},
			{Header:"휴일근무|연장시간(분)",Type:"Text",Width:30,SaveName:"holiday_extension_work_time",Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:90},
			{Header:"휴일근무|야간시간(분)",Type:"Text",Width:30,SaveName:"holiday_night_work_time",Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:90},
			{Header:"결과|출근일",Type:"Text",Width:30,SaveName:"working_status00",Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:90},
			{Header:"결과|지각일",Type:"Text",Width:30,SaveName:"working_status01",Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:90},
			{Header:"결과|조퇴일",Type:"Text",Width:30,SaveName:"working_status02",Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:90},
			{Header:"결과|외출일",Type:"Text",Width:30,SaveName:"working_status03",Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:90}
	    ];
	         
	   createIBSheet2($("#ib-container7")[0],"mySheet7", "100%", "300px");
	      IBS_InitSheet(mySheet7,initData);
	      mySheet7.SetSheetHeight(330);    
	      mySheet7.SetWaitImageVisible(0);
	  
    //mySheet8 //출장
   initData.Cols = [
			{Header:"출장고유번호",Type:"Text", SaveName:"business_trip_code",Hidden:1},
		    {Header:"출장국가",Type:"Text", SaveName:"country_name", Width:60, Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:90},
   		    {Header:"출장지",Type:"Text", SaveName:"area", Width:60, Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:90},
		    {Header:"시작일",Type:"Text", SaveName:"start_date", Width:60, Align:"Center",InsertEdit:"0", UpdateEdit:"0",Format:"Ymd",Width:110},
	        {Header:"종료일",Type:"Text", SaveName:"end_date", Width:60, Align:"Center",InsertEdit:"0", UpdateEdit:"0",Format:"Ymd",Width:110},
	        {Header:"항공료",Type:"Int", SaveName:"flight_cost", Width:60, Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:100},
	        {Header:"본인부담",Type:"Int", SaveName:"self_burden", Width:60, Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:100},
	        {Header:"회사부담",Type:"Int", SaveName:"company_burden", Width:60, Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:100},
		    {Header:"기타비용",Type:"Int", SaveName:"ect_cost", Width:60, Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:90},
		    {Header:"총비용",Type:"Int", SaveName:"total_cost", Width:60, Align:"Center",CalcLogic:"|6|+|7|+|8|",InsertEdit:"0", UpdateEdit:"0",Width:110},
		    {Header:"목적",Type:"Text", SaveName:"purpose", Width:60, Align:"Center",InsertEdit:"0", UpdateEdit:"0",Width:120}
    ];
         
   createIBSheet2($("#ib-container8")[0],"mySheet8", "100%", "300px");
   IBS_InitSheet(mySheet8,initData);
   mySheet8.SetSheetHeight(330);
	mySheet8.SetWaitImageVisible(0);
  	
    //mySheet9 //상벌관리
   initData.Cols = [
		{Header:"상태",SaveName:"sStatus",Type:"Status",Align:"Center",Width:60},
		{Header:"삭제",SaveName:"DEL_CHK",Type:"DelCheck",Width:60},
		{Header:"상벌관리고유번호",Type:"Text", SaveName:"hr_rnp_code",Hidden:1},
        {Header:"구분",Type:"Combo", SaveName:"hr_rnp_index", Width:80, Align:"Center", ComboText:"포상|징계", ComboCode:"포상|징계"},
		{Header:"상벌관리코드",Type:"Text", SaveName:"rnp_code",Hidden:1},
        {Header:"포상/징계명",Type:"Popup", SaveName:"rnp_name", Width:120, Align:"Center"},
        {Header:"포상/징계일",Type:"Text", SaveName:"hr_rnp_date", Width:120, Align:"Center",Format:"Ymd"},
        {Header:"포상/징계내역",Type:"Text", SaveName:"hr_rnp_history", Width:110, Align:"Center"},
        {Header:"시행처",Type:"Text", SaveName:"hr_rnp_institute", Width:120, Align:"Center"},
        {Header:"금액",Type:"Int", SaveName:"hr_rnp_cost", Width:110, Align:"Center"},
        {Header:"징계시작일",Type:"Text", SaveName:"hr_rnp_start_date", Width:120, Align:"Center",Format:"Ymd"},
        {Header:"징계종료일",Type:"Text", SaveName:"hr_rnp_end_date", Width:120, Align:"Center",Format:"Ymd"}
    ];
         
   createIBSheet2($("#ib-container9")[0],"mySheet9", "100%", "300px");
   IBS_InitSheet(mySheet9,initData);
   mySheet9.SetSheetHeight(330);  
   mySheet9.SetWaitImageVisible(0);
 	
   //mySheet10 //어학시험
   initData.Cols = [
	   {Header:"상태",SaveName:"sStatus",Type:"Status",Align:"Center",Width:60},
		{Header:"삭제",SaveName:"DEL_CHK",Type:"DelCheck",Width:60},
		{Header:"어학시험고유번호",Type:"Text", SaveName:"employee_language_code",Hidden:1},
		{Header:"시험코드",Type:"Text", SaveName:"language_code", Width:60, Align:"Center",Hidden:1},
		{Header:"시험명",Type:"Popup", SaveName:"language_name", Width:210, Align:"Center"},
		{Header:"유효기간시작일",Type:"Text", SaveName:"start_date", Width:170, Align:"Center",Format:"Ymd"},
		{Header:"유효기간종료일",Type:"Text", SaveName:"end_date", Width:170, Align:"Center",Format:"Ymd"},
		{Header:"점수",Type:"Text", SaveName:"grade", Width:140, Align:"Center"},
		{Header:"주관기관",Type:"Text", SaveName:"institute", Width:210, Align:"Center"}
		];
	  
        
  createIBSheet2($("#ib-container10")[0],"mySheet10", "100%", "300px");
  IBS_InitSheet(mySheet10,initData);
  mySheet10.SetSheetHeight(230);
  mySheet10.SetWaitImageVisible(0);   
  //mySheet11 //교육관리
  initData.Cols = [
     {Header:"교육명",Type:"Text", SaveName:"employee_training_name", Width:120, Align:"Center",InsertEdit:"0", UpdateEdit:"0"},
     {Header:"시작일",Type:"Text", SaveName:"employee_training_start_date", Width:100, Align:"Center",InsertEdit:"0", UpdateEdit:"0",Format:"Ymd"},
     {Header:"종료일",Type:"Text", SaveName:"employee_training_end_date", Width:100, Align:"Center",InsertEdit:"0", UpdateEdit:"0",Format:"Ymd"},
     {Header:"교육시간",Type:"Text", SaveName:"employee_training_time", Width:100, Align:"Center",InsertEdit:"0", UpdateEdit:"0"},
     {Header:"교육일수",Type:"Text", SaveName:"employee_training_date_count", Width:60, Align:"Center",InsertEdit:"0", UpdateEdit:"0"},
     {Header:"이수여부",Type:"Text", SaveName:"finish_yn", Width:60, Align:"Center",InsertEdit:"0", UpdateEdit:"0"},
     {Header:"출석점수",Type:"Text", SaveName:"attendence_score", Width:100, Align:"Center",InsertEdit:"0", UpdateEdit:"0"},
     {Header:"태도점수",Type:"Text", SaveName:"attitude_score", Width:90, Align:"Center",InsertEdit:"0", UpdateEdit:"0"},
     {Header:"평가점수",Type:"Text", SaveName:"score", Width:90, Align:"Center",InsertEdit:"0", UpdateEdit:"0"},
     {Header:"합계",Type:"Text", SaveName:"total", Width:90, Align:"Center",InsertEdit:"0", UpdateEdit:"0"},
     {Header:"교육평가",Type:"Text", SaveName:"assessment_desc", Width:110, Align:"Center",InsertEdit:"0", UpdateEdit:"0"}
		];       
 createIBSheet2($("#ib-container11")[0],"mySheet11", "100%", "300px");
 IBS_InitSheet(mySheet11,initData);
 mySheet11.SetSheetHeight(330);
 mySheet11.SetWaitImageVisible(0);   

	}
	
//로우 클릭시
function mySheet_OnClick(Row, Col) {
	if (Row != 0) {	
		  x = "x=" + mySheet.GetCellValue(Row, 2);
	
			mySheet2.DoSearch("${contextPath}/hm/p0007/searchEducation.do", x);
			mySheet3.DoSearch("${contextPath}/hm/p0007/searchCareer.do", x);
		    mySheet4.DoSearch("${contextPath}/hm/p0007/searchLicense.do", x);
	 		mySheet5.DoSearch("${contextPath}/hm/p0007/searchAppoint.do", x);
	 		mySheet6.DoSearch("${contextPath}/hm/p0007/searchAssessment.do", x);
	 		mySheet7.DoSearch("${contextPath}/hm/p0007/searchWorking_status.do", x);
			mySheet8.DoSearch("${contextPath}/hm/p0007/searchBusiness_trip.do", x);
			mySheet9.DoSearch("${contextPath}/hm/p0007/searchRnp.do", x);
			mySheet10.DoSearch("${contextPath}/hm/p0007/searchEmployee_language.do", x);
			mySheet11.DoSearch("${contextPath}/hm/p0007/searchTraining_assessment.do", x);		  



		  $('input[name=myRow]').val(Row);
		  $('input[name=height]').val(mySheet.GetCellValue(Row,4));
	      $('input[name=weight]').val(mySheet.GetCellValue(Row,5));
	      $('select[name=blood_type]').val(mySheet.GetCellValue(Row,6)); 
	      $('input[name=hobby]').val(mySheet.GetCellValue(Row,7));
	      $('input[name=special_ability]').val(mySheet.GetCellValue(Row,8));
	      $('select[name=handicapped_yn]').val(mySheet.GetCellValue(Row,9));
	      $('select[name=marriage_yn]').val(mySheet.GetCellValue(Row,10));
	      $('select[name=religion]').val(mySheet.GetCellValue(Row,11));
	      $('select[name=residential_division]').val(mySheet.GetCellValue(Row,12));
	      $('select[name=military_type]').val(mySheet.GetCellValue(Row,13));
	      $('input[name=military_number]').val(mySheet.GetCellValue(Row,14));
	      $('select[name=discharge_yn]').val(mySheet.GetCellValue(Row,15));
	      

	      
	      
	    
	} 
}

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": //조회
			var param = FormQueryStringEnc(document.frm);
			mySheet.DoSearch("${contextPath}/hm/p0007/searchList.do", param);
			break;

		case "reload": //초기화
			mySheet.RemoveAll();
			mySheet2.RemoveAll();
			mySheet3.RemoveAll();
			mySheet4.RemoveAll();
			mySheet5.RemoveAll();
			mySheet6.RemoveAll();
			mySheet7.RemoveAll();
			mySheet8.RemoveAll();
			mySheet9.RemoveAll();
			mySheet10.RemoveAll();
			mySheet11.RemoveAll();
			$("form").each(function() {  
	            this.reset();
	         });  
			break;
			
		case "save": // 저장
			console.log(myTabs1.tabs.getActiveTab());
			if(myTabs1.tabs.getActiveTab() == 0){
				 mySheet.SetCellValue($('input[name=myRow]').val(),4,$('input[name=height]').val());
		         mySheet.SetCellValue($('input[name=myRow]').val(),5,$('input[name=weight]').val());
		         mySheet.SetCellValue($('input[name=myRow]').val(),6,$('select[name=blood_type]').val());
		         mySheet.SetCellValue($('input[name=myRow]').val(),7,$('input[name=hobby]').val());
		         mySheet.SetCellValue($('input[name=myRow]').val(),8,$('input[name=special_ability]').val());
		         mySheet.SetCellValue($('input[name=myRow]').val(),9,$('select[name=handicapped_yn]').val());
		         mySheet.SetCellValue($('input[name=myRow]').val(),10,$('select[name=marriage_yn]').val());
		         mySheet.SetCellValue($('input[name=myRow]').val(),11,$('select[name=religion]').val());
		         mySheet.SetCellValue($('input[name=myRow]').val(),12,$('select[name=residential_division]').val());
		         mySheet.SetCellValue($('input[name=myRow]').val(),13,$('select[name=military_type]').val());
		         mySheet.SetCellValue($('input[name=myRow]').val(),14,$('input[name=military_number]').val());
		         mySheet.SetCellValue($('input[name=myRow]').val(),15,$('select[name=discharge_yn]').val());
		 		 mySheet.DoSave("${contextPath}/hm/p0007/saveHr_info.do", x);

			}
			
			if(myTabs1.tabs.getActiveTab() == 1){
				mySheet2.DoSave("${contextPath}/hm/p0007/saveEducation.do", x);
			}
			
			if(myTabs1.tabs.getActiveTab() == 2){
				mySheet3.DoSave("${contextPath}/hm/p0007/saveCareer.do", x)
				}
			
			if(myTabs1.tabs.getActiveTab() == 3){
				mySheet4.DoSave("${contextPath}/hm/p0007/saveLicense.do", x);
				}
			
			if(myTabs1.tabs.getActiveTab() == 4){
				mySheet10.DoSave("${contextPath}/hm/p0007/saveEmployee_language.do", x);
			}
			
			if(myTabs2.tabs.getActiveTab() == 1){
				mySheet6.DoSave("${contextPath}/hm/p0007/saveAssessment.do", x);

			}
			if(myTabs2.tabs.getActiveTab() == 4){
				mySheet9.DoSave("${contextPath}/hm/p0007/saveRnp.do", x);

			}
			
			break;
			
			
		 case "insert2":
			      var row = mySheet2.DataInsert(-1);
			      break;
			      
		   case "insert3":
			      var row = mySheet3.DataInsert(-1);
			      break;
			      
		   case "insert4":
			      var row = mySheet4.DataInsert(-1);
			      break;
			      			      
		   case "insert6":
			      var row = mySheet6.DataInsert(-1);
			      break;
			   	      
		   case "insert8":
			      var row = mySheet8.DataInsert(-1);
			      break;
			      
		   case "insert9":
			      var row = mySheet9.DataInsert(-1);
			      break;
			      
		   case "insert10":
			      var row = mySheet10.DataInsert(-1);
			      break;
			      
		   case "insert11":
			      var row = mySheet11.DataInsert(-1);
			      break; 
			       

		}
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
	
	function mySheet3_OnSaveEnd(code, msg) {
		if (msg != "") {
			alert(msg);
			//번호 다시 매기기
			//mySheet.ReNumberSeq();
		}
	}
	
	function mySheet4_OnSaveEnd(code, msg) {
		if (msg != "") {
			alert(msg);
			//번호 다시 매기기
			//mySheet.ReNumberSeq();
		}
	}
	
	function mySheet6_OnSaveEnd(code, msg) {
		if (msg != "") {
			alert(msg);
			//번호 다시 매기기
			//mySheet.ReNumberSeq();
		}
	}
	
	function mySheet9_OnSaveEnd(code, msg) {
		if (msg != "") {
			alert(msg);
			//번호 다시 매기기
			//mySheet.ReNumberSeq();
		}
	}
	
	function mySheet10_OnSaveEnd(code, msg) {
		if (msg != "") {
			alert(msg);
			//번호 다시 매기기
			//mySheet.ReNumberSeq();
		}
	}
	
	function mySheet11_OnSaveEnd(code, msg) {
		if (msg != "") {
			alert(msg);
			//번호 다시 매기기
			//mySheet.ReNumberSeq();
		}
	}
	
	function mySheet2_OnSearchEnd() {
		mySheet2.DataInsert(-1);
	}
	
	function mySheet3_OnSearchEnd() {
		mySheet3.DataInsert(-1);
	}
	
	function mySheet4_OnSearchEnd() {
		mySheet4.DataInsert(-1);
	}
	
	function mySheet6_OnSearchEnd() {
		mySheet6.DataInsert(-1);
	}
	function mySheet9_OnSearchEnd() {
		mySheet9.DataInsert(-1);
	}
	function mySheet10_OnSearchEnd() {
		mySheet10.DataInsert(-1);
	}

	
	function mySheet2_OnKeyUp(Row, Col, KeyCode, Shift) {
		//if (Modify == 1) { 인사코드 부분 - 수정 가능일시이니까 / 인사기록카드에서는 상관x
	         //console.log("keycode: "+KeyCode+"&col:"+mySheet2.LastCol()+"&row:"+mySheet2.RowCount());
	         /* console.log("keycode: " + KeyCode);
	         console.log("col:" + Col + "lastcol:" + mySheet2.LastCol());
	         console.log("row:" + Row + "row갯수:" + mySheet2.RowCount()); */
	         if ( KeyCode == 13 &&  Col == mySheet2.LastCol()
	               && Row < mySheet2.RowCount()) { // 엔터를 누르고 / col이 마지막 col이고 / row가 마지막 열일경우
	            doAction("insert2");
	         }
		}
	
	function mySheet3_OnKeyUp(Row, Col, KeyCode, Shift) {
			//if (Modify == 1) { 인사코드 부분 - 수정 가능일시이니까 / 인사기록카드에서는 상관x
		         //console.log("keycode: "+KeyCode+"&col:"+mySheet2.LastCol()+"&row:"+mySheet2.RowCount());
		         /* console.log("keycode: " + KeyCode);
		         console.log("col:" + Col + "lastcol:" + mySheet2.LastCol());
		         console.log("row:" + Row + "row갯수:" + mySheet2.RowCount()); */
		         if ( KeyCode == 13 &&  Col == mySheet3.LastCol()
		               && Row < mySheet3.RowCount()) { // 엔터를 누르고 / col이 마지막 col이고 / row가 마지막 열일경우
		            doAction("insert3");
		         }
			}
			
	function mySheet4_OnKeyUp(Row, Col, KeyCode, Shift) {
				//if (Modify == 1) { 인사코드 부분 - 수정 가능일시이니까 / 인사기록카드에서는 상관x
			         //console.log("keycode: "+KeyCode+"&col:"+mySheet2.LastCol()+"&row:"+mySheet2.RowCount());
			         /* console.log("keycode: " + KeyCode);
			         console.log("col:" + Col + "lastcol:" + mySheet2.LastCol());
			         console.log("row:" + Row + "row갯수:" + mySheet2.RowCount()); */
			         if ( KeyCode == 13 &&  Col == mySheet4.LastCol()
			               && Row < mySheet4.RowCount()) { // 엔터를 누르고 / col이 마지막 col이고 / row가 마지막 열일경우
			            doAction("insert4");
			         }
				}
				
	function mySheet6_OnKeyUp(Row, Col, KeyCode, Shift) {
					//if (Modify == 1) { 인사코드 부분 - 수정 가능일시이니까 / 인사기록카드에서는 상관x
				         //console.log("keycode: "+KeyCode+"&col:"+mySheet2.LastCol()+"&row:"+mySheet2.RowCount());
				         /* console.log("keycode: " + KeyCode);
				         console.log("col:" + Col + "lastcol:" + mySheet2.LastCol());
				         console.log("row:" + Row + "row갯수:" + mySheet2.RowCount()); */
				         if ( KeyCode == 13 &&  Col == mySheet6.LastCol()
				               && Row < mySheet6.RowCount()) { // 엔터를 누르고 / col이 마지막 col이고 / row가 마지막 열일경우
				            doAction("insert6");
		         
					}
			}
	
					
	function mySheet9_OnKeyUp(Row, Col, KeyCode, Shift) {
						//if (Modify == 1) { 인사코드 부분 - 수정 가능일시이니까 / 인사기록카드에서는 상관x
					         //console.log("keycode: "+KeyCode+"&col:"+mySheet2.LastCol()+"&row:"+mySheet2.RowCount());
					         /* console.log("keycode: " + KeyCode);
					         console.log("col:" + Col + "lastcol:" + mySheet2.LastCol());
					         console.log("row:" + Row + "row갯수:" + mySheet2.RowCount()); */
					         if ( KeyCode == 13 &&  Col == mySheet9.LastCol()
					               && Row < mySheet9.RowCount()) { // 엔터를 누르고 / col이 마지막 col이고 / row가 마지막 열일경우
					            doAction("insert9");
					         }
				}
	
	function mySheet10_OnKeyUp(Row, Col, KeyCode, Shift) {
					//if (Modify == 1) { 인사코드 부분 - 수정 가능일시이니까 / 인사기록카드에서는 상관x
				         //console.log("keycode: "+KeyCode+"&col:"+mySheet2.LastCol()+"&row:"+mySheet2.RowCount());
				         /* console.log("keycode: " + KeyCode);
				         console.log("col:" + Col + "lastcol:" + mySheet2.LastCol());
				         console.log("row:" + Row + "row갯수:" + mySheet2.RowCount()); */
				         if ( KeyCode == 13 &&  Col == mySheet10.LastCol()
				               && Row < mySheet10.RowCount()) { // 엔터를 누르고 / col이 마지막 col이고 / row가 마지막 열일경우
				            doAction("insert10");
				         }
					}
	
					
					
	function mySheet4_OnPopupClick(Row,Col,Value){
		
		if(Col=="5"){
			
		window.open("${contextPath}/hm/p0007/license_Popup.do", "a", "width=480, height=650, left=100, top=50"); 
		}
		
	}				

	function mySheet6_OnPopupClick(Row,Col,Value){
		
		if(Col=="4"){
			
		window.open("${contextPath}/hm/p0007/assessment_Popup.do", "a", "width=480, height=650, left=100, top=50"); 
		}
		
	}
	
	function mySheet9_OnPopupClick(Row,Col,Value){
		
		if(Col=="5"){
			
		window.open("${contextPath}/hm/p0007/rnp_Popup.do", "a", "width=480, height=650, left=100, top=50"); 
		}
		
	}
	
	function mySheet10_OnPopupClick(Row,Col,Value){
		
		if(Col=="4"){
			
		window.open("${contextPath}/hm/p0007/language_Popup.do", "a", "width=480, height=650, left=100, top=50"); 
		}
		
	}
	
			


	function assessmentValue(rowData){
		mySheet6.SetRowData(mySheet6.GetSelectRow(),rowData);
	}
	function rnpValue(rowData){
		mySheet9.SetRowData(mySheet9.GetSelectRow(),rowData);
	}
	
	function licenseValue(rowData){
		mySheet4.SetRowData(mySheet4.GetSelectRow(),rowData);
	}
	function languageValue(rowData){
		mySheet10.SetRowData(mySheet10.GetSelectRow(),rowData);
	}
	

	        
	// }
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


.left {
	position: relative;
	top: 140px;
	left: 60px;
	width: 403px;
}

.right {
	position: relative;
	top: -560px;
	left: 460px;
	height: 400px;
	width: 1100px;
	background: #EBEBEB;
	border-radius:5px;
}

.right-down {
	position: relative;
	top: -660px;
	left: 460px;
	height: 400px;
	width: 1100px;
	background: #EBEBEB;
	border-radius:5px;
}

#searchBar {
	background: #EBEBEB;
	padding: 10px 30px;
	margin-bottom: 20px;
	border-radius: 5px;
	font-size: 12px;
	border-radius:5px;
}
.tg input,select{
height: 22px;
border-radius: 3px;
border : none;
}

.tg1 {width:150px; height:200px; margin-left: 25px}
.tg1 td{font-family:Arial, sans-serif;font-size:14px;padding:0px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black; }
.tg1 th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black; }
.tg1 .tg-2ut6{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;background-color:#ffffff;color:#ffccc9;border-color:#c0c0c0;text-align:left;vertical-align:middle}

.tg  {border-collapse:collapse;border-spacing:0; width:95%;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:7px 2px;overflow:hidden;word-break:normal;border-color:black;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:0px 5px;overflow:hidden;word-break:normal;border-color:black;}
.tg .tg-yyj2{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;background-color:#d4d4d4;border-color:#bebebe;text-align:left;vertical-align:center}
.tg .tg-dm68{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;background-color:#d4d4d4;border-color:#bebebe;text-align:center;vertical-align:center}
.tg .tg-lu1x{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;background-color:#333333;color:#ffffff;border-color:inherit;text-align:center;vertical-align:center;width:40px; border-radius:2px;}
.tg .tg-au0w{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;border-color:inherit;text-align:left;vertical-align:center}
.tg .tg-au00{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;border-color:inherit;text-align:center;vertical-align:center}
.tg .tg-8thm{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;background-color:#d4d4d4;border-color:inherit;text-align:right;vertical-align:center}
.tg .tg-v9i9{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;background-color:#d4d4d4;border-color:inherit;text-align:left;vertical-align:center}



</style>
</head>
<body onload="LoadPage()" style="overflow: hidden;">
<form name="frm">
	<div class="leftbuttons">
		<a href="javascript:doAction('excel')" class="IBbutton">엑셀</a>
	</div>
	<div class="rightbuttons">
		<a href="javascript:doAction('reload')" class="IBbutton">초기화</a> <a
			href="javascript:doAction('search')" class="IBbutton">조회</a> <a
			href="javascript:doAction('save')" class="IBbutton">저장</a>
	</div>

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 인사관리 : 인사기록카드
		</header>
	</div>
	<div class="left">
		<script>createIBSheet("mySheet", "1500px", "710px");</script>
    </div>

	<div class="right">

		 <div id="tab1" class="ib-tab-tab">  
               <div class="ib-tab-tabs-item">
				<a class="ib-tab-tabs-item__link is-active"><span class="ib-tab-tabs-item__title">신체/병역/기타</span></a> 
				<a class="ib-tab-tabs-item__link"><span class="ib-tab-tabs-item__title">학력</span></a>
				<a class="ib-tab-tabs-item__link"><span class="ib-tab-tabs-item__title">경력</span></a>
				<a class="ib-tab-tabs-item__link"><span class="ib-tab-tabs-item__title">면허자격</span></a>
				<a class="ib-tab-tabs-item__link"><span class="ib-tab-tabs-item__title">어학시험</span></a>
				
			</div>
		</div>

		<div id="tab_contents1" class="ib-tab-contents" >
		
			<div class="ib-tab-contents__item" style="background: none;">
			
				<div id='ib-container1'>

					


<table class="tg">
  <tr>
    <th class="tg-lu1x" rowspan="10"><i class="fa fa-address-book" aria-hidden="true"></i><br>개<br>인<br>정<br>보</th>  
  </tr>
  <tr>
							<td class="tg-v9i9"></td>
							<td class="tg-v9i9" colspan="5"></td>
</tr>
   <tr>

   <td class="tg-8thm">신장</td><td class="tg-v9i9" >      <input type="hidden"	name="myRow">
   <input type="text" id="height" name="height"><td class="tg-8thm">체중</td><td class="tg-v9i9" ><input type="text" id="weight" name="weight"><td class="tg-8thm">
   
   혈액형</td><td class="tg-v9i9" ><select name="blood_type"><option value='A형' selected>A형</option>
									<option value='B형'>B형</option>
									<option value='O형'>O형</option>
									<option value='AB형'>AB형</option></select>
   
   
   </tr>
   <tr>
							<td class="tg-v9i9"></td>
							<td class="tg-v9i9" colspan="5"></td>
</tr>
  <tr>
<td class="tg-8thm">결혼구분</td><td class="tg-v9i9" ><select name="marriage_yn"><option value='기혼' selected>기혼</option><option value='미혼'>미혼</option></select></td>
    <td class="tg-8thm">종교</td>
    <td class="tg-v9i9"><select name="religion"><option value='기독교' selected>기독교</option>
									<option value='천주교'>천주교</option>
									<option value='불교'>불교</option>
									<option value='무교'>무교</option></select>
	</td>
	<td class="tg-8thm">주거구분</td><td class="tg-v9i9"><select name="residential_division">
									<option value='자가' selected>자가</option>
									<option value='전세'>전세</option>
									<option value='월세'>월세</option></select>
	</td>
									
  </tr>
  <tr>
							<td class="tg-v9i9"></td>
							<td class="tg-v9i9" colspan="5"></td>
</tr>
  <tr>
<td class="tg-8thm">병역구분</td><td class="tg-v9i9" ><select name="military_type">
									<option value='현역' selected>현역</option>
									<option value='단기사병' >단기사병</option>
									<option value='면제'>면제</option></select></td>
    <td class="tg-8thm">군번</td><td class="tg-v9i9"><input type="text" id="military_number" name="military_number"></td>
	<td class="tg-8thm">제대구분</td><td class="tg-v9i9"><select name="discharge_yn">
									<option value='만기' selected>만기</option>
									<option value='단기'>단기</option>
									<option value='의가'>의가</option></select>
	</td>							
  </tr>
  <tr>
							<td class="tg-v9i9"></td>
							<td class="tg-v9i9" colspan="5"></td>
</tr>
    <tr>
   <td class="tg-8thm">취미</td><td class="tg-v9i9" ><input type="text" id="hobby" name="hobby"><td class="tg-8thm">특기</td><td class="tg-v9i9" ><input type="text" id="special_ability" name="special_ability">
   <td class="tg-8thm">장애여부</td><td class="tg-v9i9"><select name="handicapped_yn">
									<option value='Y' selected>여</option>
									<option value='N'>부</option>
									</select>
	</td>							
   
   </tr>
   <tr>
							<td class="tg-v9i9"></td>
							<td class="tg-v9i9" colspan="5"></td>
</tr>
</table>
				</div>
				
			</div>
			<div class="ib-tab-contents__item">
                  <div id='ib-container2'></div>
               </div>
			<div class="ib-tab-contents__item">
                  <div id='ib-container3'></div>
               </div>
			<div class="ib-tab-contents__item">
                  <div id='ib-container4'></div>
               </div>
            <div class="ib-tab-contents__item">
                  <div id='ib-container10'></div>
               </div>
			
		</div>
	</div>
	
		<div class="right-down">
		 <div id="tab2" class="ib-tab-tabs">
               <div class="ib-tab-tabs-item">
				<a class="ib-tab-tabs-item__link is-active"><span class="ib-tab-tabs-item__title">인사발령</span></a> 
				<a class="ib-tab-tabs-item__link"><span class="ib-tab-tabs-item__title">인사고과</span></a> 
				<a class="ib-tab-tabs-item__link"><span class="ib-tab-tabs-item__title">근태</span></a>
				<a class="ib-tab-tabs-item__link"><span class="ib-tab-tabs-item__title">출장</span></a>
				<a class="ib-tab-tabs-item__link"><span class="ib-tab-tabs-item__title">상벌관리</span></a>
				<a class="ib-tab-tabs-item__link"><span class="ib-tab-tabs-item__title">교육관리</span></a>
				
			</div>
		</div>

		<div id="tab_contents_2" class="ib-tab-contents">
			 <div class="ib-tab-contents__item"> 
                  <div id='ib-container5'></div> 
               </div>
			 <div class="ib-tab-contents__item"> 
                  <div id='ib-container6'></div> 
               </div>
			 <div class="ib-tab-contents__item"> 
                  <div id='ib-container7'></div> 
               </div>
			 <div class="ib-tab-contents__item"> 
                  <div id='ib-container8'></div> 
               </div>
			 <div class="ib-tab-contents__item"> 
                  <div id='ib-container9'></div> 
               </div>
             <div class="ib-tab-contents__item"> 
                  <div id='ib-container11'></div> 
               </div>

		</div>
	</div>
</form>
</body>
</html>