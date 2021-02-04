<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<script language="javascript">
	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.SetWaitImageVisible(0); 
		mySheet2.SetWaitImageVisible(0); 
		mySheet3.SetWaitImageVisible(0); 
		
		//아이비시트1 
		mySheet.RemoveAll();
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0,MouseHoverMode:2, MergeSheet:msHeaderOnly};
		initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:10,HeaderCheck:1};
		initSheet.Cols = [
			{Header:"대상직급|직급코드",Type:"Text",SaveName:"position_CODE",Width:130,KeyField:1, Align:"Center", Edit:0},
			{Header:"대상직급|직급명",Type:"Text",SaveName:"position_NAME",Width:220,KeyField:1, Align:"Center", Edit:0}		
		];   
		IBS_InitSheet( mySheet , initSheet);
  
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet.SetSheetHeight(700);
		
		
		//아이비시트2 -----------------------------------------------------------------------------------------------------
		mySheet2.RemoveAll();
		var initSheet2 = {};
		initSheet2.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0,MergeSheet:msHeaderOnly,MouseHoverMode:2};
		initSheet2.HeaderMode = {Sort:1,ColMove:1,ColResize:10,HeaderCheck:1};
		initSheet2.Cols = [
			{Header:"tmp직급코드|직급코드",Type:"Text",SaveName:"temp_POSITION_CODE", Hidden: 1},
			{Header:"tmp호봉코드|호봉코드",Type:"Text",SaveName:"temp_PAY_GRADE_CODE", Hidden: 1},
			{Header:"호봉코드|호봉코드",Type:"Text",SaveName:"pay_GRADE_CODE", Hidden: 1},
	        {Header:"호봉|호봉",Type:"Text",SaveName:"pay_GRADE_NAME",Width:160 ,KeyField:1, Align:"Center","UpdateEdit":0},			
			{Header:"호봉테이블|기본급",Type:"Int",SaveName:"salary",Width:250 , Align:"Right"},
			{Header:"합계|합계",Type:"Int",SaveName:"tot_salary",Width:350 , Align:"Right", CalcLogic:"|4|"},
			{Header:"상태|상태",Type:"Status",SaveName:"STATUS", Align:"Center", Hidden: 1},
	        {Header:"삭제|삭제",Type:"DelCheck",SaveName:"DEL_CHK", Hidden: 1}
		];   
		IBS_InitSheet( mySheet2 , initSheet2);
  
		mySheet2.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet2.SetSheetHeight(385);
		
		
		//아이비시트3 -----------------------------------------------------------------------------------------------------
		mySheet3.RemoveAll();
		var initSheet3 = {};
		initSheet3.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0,MergeSheet:msHeaderOnly,MouseHoverMode:2};
		initSheet3.HeaderMode = {Sort:1,ColMove:1,ColResize:10,HeaderCheck:1};
		initSheet3.Cols = [
	     	{Header:"상태|상태",Type:"Status",SaveName:"STATUS",MinWidth:60, Align:"Center"},
	        {Header:"삭제|삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:60},	
			{Header:"호봉이력|적용시작연월",Type:"Date",SaveName:"start_DATE",MinWidth:145, Align:"Center", Format:"Ym"},
	        {Header:"호봉이력|적용종료연월",Type:"Date",SaveName:"end_DATE",MinWidth:145, Align:"Center", Format:"Ym", Edit:"0"}			
		];   
		IBS_InitSheet( mySheet3 , initSheet3);
  
		mySheet3.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		mySheet3.SetSheetHeight(285);
		
		mySheet.DoSearch("${contextPath}/hm/p0001/searchList.do");
	}
	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch(sAction) {
			case "search": //조회
				mySheet2.DoSearch("${contextPath}/hm/p0001/searchList2.do","position_CODE="+mySheet.GetCellValue(mySheet.GetSelectRow(),0));
				mySheet2.SetCellValue(0, 0, mySheet.GetCellValue(mySheet.GetSelectRow(),0));
				break;
				
			case "reload": //초기화
				mySheet2.RemoveAll();
				mySheet3.RemoveAll();
				break;
			case "save": // 저장
				//확인!!!
				/* var tempStr = mySheet3.GetSaveString();
				/* tempStr = tempStr + "&p_position_CODE="+mySheet2.GetCellValue(0,0); */
				//alert("서버로 전달되는 문자열 확인 :"+tempStr);  */
				
				break;
				
			case "insert": //신규행 추가
				var row = mySheet3.DataInsert();
				break;
				
			case "excel":
				var param = { Mode : -1 };
				mySheet.Down2ExcelBuffer(true);  
			    mySheet.Down2Excel(param);
			    mySheet2.Down2Excel(param);
			    mySheet3.Down2Excel(param);
			    mySheet.Down2ExcelBuffer(false); 
			     break;
		}
	}
	
	//로우 클릭시 (직급코드 선택시)
	function mySheet_OnClick(Row) {
		if(Row!=0){
			
			mySheet2.SetCellValue(0, 0, mySheet.GetCellValue(Row,0)); // 두번째 시트의 0, 0의 값을 해당 직급코드로 변경
			mySheet2.SetCellValue(0, 1, "C01"); //두번째 시트의 0, 1의 값을 기본 C01로 변경
			mySheet3.SetWaitImageVisible(0); //mySheet3 조회 이미지 보여지는 것을 X
			
			mySheet3.DoSearch("${contextPath}/hm/p0001/searchList3.do", "position_CODE2=" + mySheet2.GetCellValue(0,0) + "&pay_GRADE_CODE=" + mySheet2.GetCellValue(0, 1));
			//해당 직급과 C01에 해당하는 이력의 연월을 조회 - 
			//mySheet3 조회가 끝난후 가장 끝 Row로 해당하는 연월의 값을 가져옴
			//그 후 그 값으로 mySheet2 조회
		}
	}  
	//로우 클릭시 (호봉이력 클릭시)
	function mySheet3_OnClick(Row) {
		if(Row!=0){
			mySheet3.SetWaitImageVisible(0);
			if(mySheet3.GetDataLastRow() == mySheet3.GetSelectRow()){ //시작연월이 없는 mySheet3의 row를 클릭시 호봉테이블 보이지 X
				mySheet2.RemoveAll();
			}else{
				mySheet2.DoSearch("${contextPath}/hm/p0001/searchList2.do", "position_CODE=" + mySheet.GetCellValue(mySheet.GetSelectRow(), 0) + "&start_DATE=" + mySheet3.GetCellValue(mySheet3.GetSelectRow(), 2));
				/* alert(mySheet3.GetCellValue(mySheet3.GetSelectRow(),0)); */
				if(mySheet3.GetSelectRow() == mySheet3.GetDataLastRow()-1 && mySheet3.GetCellText(mySheet3.GetSelectRow(),1) == 1){
					mySheet3.DoSave("${contextPath}/hm/p0001/DATE_deleteData.do", "p_position_CODE=" + mySheet2.GetCellValue(0,0)); 
					mySheet3.SetCellValue(mySheet3.GetSelectRow(), 1, "R");
				}
			}
		}
	}
	function mySheet2_OnSearchEnd(Row, Col, code, msg){
		if(mySheet3.GetDataLastRow() - mySheet3.GetSelectRow()  < 2){
			mySheet2.SetColEditable(4,1);
		}else{
			mySheet2.SetColEditable(4,0);
		}
		
	}
	//mySheet3 조회가 끝난 후
	function mySheet3_OnSearchEnd(Row, Col, code,msg){
		
		if(mySheet3.GetSelectRow() >= 2){ // mySheet3의 선택한 Row가 2일경우 
			
			// mySheet3의 마지막 Row의 시작연월 값과 종료연월 값 출력
			mySheet2.DoSearch("${contextPath}/hm/p0001/searchList2.do", "position_CODE=" + mySheet.GetCellValue(mySheet.GetSelectRow(), 0) + "&start_DATE=" + mySheet3.GetCellValue(mySheet3.GetDataLastRow(), 2));
			//mySheet2의 조회로 마지막 Row의 시작연월 값을 파라미터 값을 넘김
			/* mySheet3.SetCellValue(mySheet3.GetSelectRow(),3,""); */
			
			//조회시 최신 시작연월은 삭제블록을 클릭가능하지만 나머지는 Row를 아예 선택 못하도록 설정
			var Maskingcell = mySheet3.GetDataLastRow();
			for(let i=Maskingcell; i >= 2 ; i--){
				if(i == Maskingcell){ //최상단일 경우
					mySheet3.SetCellEditable(i, 2, 0); // 최상단의 시작연월 edit 불가
					mySheet3.SetColEditable(1, 0); //삭제 칸 모두 불가능하도록
					
					mySheet3.SetCellEditable(i, 1, 1); //최상단의 시작연월 edit만 삭제 칸 클릭 가능
				}else if(i != Maskingcell){
					mySheet3.SetRowEditable(i, 0); //나머지 row를 다 수정 불가능하도록 설정
					
				}
			}
			//가장 상단의 삭제도 클릭못하게 막기
			
		}else if(mySheet3.GetSelectRow() == -1){ // mySheet3의 선택한 Row가 -1일 경우 (조회한 이력 연월이 없을 때)
			mySheet3.SetCellValue(mySheet3.GetSelectRow()-1, 3, mySheet3.GetCellValue(mySheet3.GetSelectRow(), 3));
			mySheet2.RemoveAll();
		}
		
		
		mySheet3.DataInsert(-1);
		/* if(Row == 2){
			alert(Row);
			alert(mySheet3.GetCellValue(Row, Col+1));
		}else if(Row >2){
			alert(mySheet3.GetSelectRow());
			alert(Row);
			alert(mySheet3.GetCellValue(Row, Col+1));
		}*/
	}
	
	//직급코드 선택후 호봉코드를 선택시(1번째) - 시작연월 종료연월
	/* function mySheet2_OnSearchEnd(code,msg){
		
		mySheet3.DoSearch("${contextPath}/hm/p0001/searchList3.do", "position_CODE2=" + mySheet2.GetCellValue(0,0) + "&pay_GRADE_CODE=" + mySheet2.GetCellValue(0, 1));
	} */
	
	//로우 클릭시 (호봉 선택시)
	/* function mySheet2_OnClick(Row){
		if(Row!=0){
			mySheet2.SetCellValue(0, 1, mySheet2.GetCellValue(Row, 2));
			mySheet3.DoSearch("${contextPath}/hm/p0001/searchList3.do", "position_CODE2=" + mySheet2.GetCellValue(0,0) + "&pay_GRADE_CODE=" + mySheet2.GetCellValue(0, 1));
		}
	} */
	
	//시작연월 종료연월아래에 insert 띄워주기
	
	
	function mySheet3_OnChange(Row, Col) {
			if(Row == 2){ //시작 연월 클릭시 적용시작연월이 처음 입력일 경우
				
			}else if(Row >2){//시작 연월 클릭시 적용시작연월이 처음이 아닐경우

			}
			
	}
	
	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet3_OnSaveEnd(code,msg){
		
		if(code == 0){
			/* alert("저장성공!!"); */	
			mySheet3.DataInsert(-1);
			mySheet3.SetEditEnterBehavior("down");

			mySheet3.DoSearch("${contextPath}/hm/p0001/searchList3.do", "position_CODE2=" + mySheet2.GetCellValue(0,0) + "&pay_GRADE_CODE=" + mySheet2.GetCellValue(0, 1));
			/* alert(mySheet3.GetDataLastRow()); */
			/* mySheet3.SetRowEditable(1,0); */
			//번호 다시 매기기
            //mySheet.ReNumberSeq();
		}else if(code == -1){
			alert(msg, "저장실패!!!");	
		}
	}
	function mySheet2_OnSaveEnd(code, msg){
		if(code == 0){
			/* alert("저장성공!!"); */
			mySheet2.SetEditEnterBehavior("down");
			mySheet2.SetWaitImageVisible(0);
		}else if(code == -1){
			alert(msg, "저장실패!!!");	
		}
	}
	
	function mySheet3_OnBeforeEdit(Row, Col) { //Enter를 입력시 cell의 값을 변경하기 바로 직전
		
		if(Row == 2){ //처음 시작연월을 저장시
		    mySheet3.DoSave("${contextPath}/hm/p0001/saveData.do", "p_position_CODE=" + mySheet2.GetCellValue(0,0)); //호봉이력 연월 저장
			mySheet2.DoSearch("${contextPath}/hm/p0001/searchList2.do","position_CODE="+mySheet.GetCellValue(mySheet.GetSelectRow(),0)); // 호봉 코드 입력된 2번째 sheet 조회 
		}else if(Row > 2){ //처음 시작연월을 저장이 아닐 시
			mySheet3.SetCellValue(mySheet3.GetSelectRow()-1, 3, mySheet3.GetCellValue(mySheet3.GetSelectRow(), 2));
		   	mySheet3.DoSave("${contextPath}/hm/p0001/saveData.do", "p_position_CODE=" + mySheet2.GetCellValue(0,0) + "&PP_START_DATE=" + mySheet3.GetCellValue(mySheet3.GetSelectRow(), 2)); //호봉이력 연월 저장
		   	/* mySheet3.SetCellValue(mySheet3.GetSelectRow()-1, 3, mySheet3.GetCellValue(Row, 2)); */
		   	/* mySheet2.DoSearch("${contextPath}/hm/p0001/searchList2.do","position_CODE="+mySheet.GetCellValue(mySheet.GetSelectRow(),0)); // 호봉 코드 입력된 2번째 sheet 조회  */
		}
	} 
	
	//호봉테이블의 기본급을 update하려할때 
	function mySheet2_OnBeforeEdit(Row, Col) {
		mySheet2.SetEditEnterBehavior("down");
	}
	
	function mySheet2_OnAfterEdit(Row, Col) {
		mySheet2.DoSave("${contextPath}/hm/p0001/SALARY_saveData.do", "p_position_CODE=" + mySheet2.GetCellValue(0,0) + "&PP_START_DATE=" + mySheet3.GetCellValue(mySheet3.GetDataLastRow()-1, 2)); //호봉이력 연월 저장
		/* var tempStr2 = mySheet2.GetSaveString();
		tempStr2 = tempStr2 + "&p_position_CODE="+mySheet2.GetCellValue(0,0) + "&PP_START_DATE=" + mySheet3.GetCellValue(mySheet3.GetSelectRow(), 2);
		alert("서버로 전달되는 문자열 확인 :"+tempStr2);  */
		
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
	background-color: #2B69A0;
	color: white;
	padding: 5px 15px;
	border-radius: 7px;
	text-decoration: none;	
}
.IBbutton:hover {
background-color: #2C3E50;
}
#mySheet{
position: relative;
top: 120px;
left: 40px;
width:350px;
padding: 0px 30px 0 0;
border-right: 2px solid #C3C3C3;
}

#mySheet3{
 position: relative;
top: -580px;
left: 420px;
width:760px;
padding: 0 0 15px 30px;
border-bottom: 2px solid #C3C3C3;
}
#mySheet2{
position: relative;
top:  -565px;
left: 420px;
padding: 0 0 0 30px;
} 

</style>
</head>
<body onload="LoadPage()" style="overflow-x: hidden">



 <div class="leftbuttons">
  <a href="javascript:doAction('excel')" class="IBbutton">엑셀</a>
	</div> 


	<div class="rightbuttons">  
		<a href="javascript:doAction('reload')" class="IBbutton">초기화</a> 
	</div>

<div class="title"> 
<header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 기초환경설정 : 호봉테이블등록</header>
</div>
	<div id="mySheet"><script>createIBSheet("mySheet", "1000px", "100%");</script></div>
	<div id="mySheet3"><script>createIBSheet("mySheet3", "1500px", "100%");</script></div>
	<div id="mySheet2"><script>createIBSheet("mySheet2", "1500px", "100%");</script></div>
</body>
</html>