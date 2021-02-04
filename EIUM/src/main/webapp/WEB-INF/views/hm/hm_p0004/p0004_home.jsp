<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<link href="${contextPath}/resources/tab/css/ibtab-style.css" rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js" type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js" type="text/javascript"></script>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script language="javascript">
   /*Sheet 기본 설정 */
   function LoadPage() {
      //탭
      createIBTab($('#ib_sheetTab')[0], $('#ib_sheetContents')[0], 'sheetTab', {
          themes: {
              tabs: "flat_blue",
              contents: "flat_blue",
              contextMenu: "flat_blue"
          },
          allowCloseBTN: false
      });
      //아이비시트1 
      mySheet.RemoveAll();
      var initSheet = {};
      initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
      initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
      initSheet.Cols = [      
         {Header:"상태",Type:"Status",SaveName:"STATUS" ,Hidden:1},
           {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",Hidden:1},   
           {Header:"사원코드",Type:"Text",SaveName:"emp_CODE",MinWidth:120,KeyField:1,Edit:0,Align:"Center"},   
         {Header:"사원명",Type:"Text",SaveName:"emp_NAME",MinWidth:120,Edit:0,Align:"Center"},         
         {Header:"부서명",Type:"Text",SaveName:"dep_NAME",MinWidth:140,Edit:0,Align:"Center"},  //4
         
         //인적정보
         {Header:"사원명(영문)",Type:"Text",SaveName:"emp_NAME_EN", Hidden:1},         
         {Header:"사원명(한자)",Type:"Text",SaveName:"emp_NAME_HN", Hidden:1},         
         {Header:"내외국인구분",Type:"Text",SaveName:"foreign_YN", Hidden:1},         
         {Header:"주민등록번호",Type:"Text",SaveName:"rr_NUM", Hidden:1},         
         {Header:"성별",Type:"Text",SaveName:"sex", Hidden:1},         
         {Header:"생년월일",Type:"Text",SaveName:"birth", Hidden:1},         //10
         {Header:"전화번호",Type:"Text",SaveName:"contact", Hidden:1},         
         {Header:"최종학력코드",Type:"Text",SaveName:"final_EDU_CODE", Hidden:1},         
         {Header:"최종학력이름",Type:"Text",SaveName:"final_EDU_NAME", Hidden:1},         
         {Header:"사진",Type:"Image",SaveName:"picture",   Hidden:1  },         
         {Header:"우편번호",Type:"Text",SaveName:"zip_CODE", Hidden:1},         //15
         {Header:"주민등록주소",Type:"Text",SaveName:"res_ADDRESS", Hidden:1},         
         {Header:"상세주소",Type:"Text",SaveName:"res_ADDRESS_DETAIL", Hidden:1},         
         {Header:"영문주소",Type:"Text",SaveName:"res_ADDRESS_EN", Hidden:1},         
         {Header:"이메일",Type:"Text",SaveName:"email",  Hidden:1 },         
         {Header:"출입카드번호",Type:"Text",SaveName:"card_NUM", Hidden:1},         //20
         {Header:"세대주여부",Type:"Text",SaveName:"hh_YN", Hidden:1},         
         {Header:"장애인구분",Type:"Text",SaveName:"hc_YN", Hidden:1},         
         {Header:"국적코드",Type:"Text",SaveName:"country_CODE", Hidden:1},         
         {Header:"국적이름",Type:"Text",SaveName:"country_NAME", Hidden:1},                  
         {Header:"채용구분",Type:"Text",SaveName:"hire_TYPE", Hidden:1},         //25      
         {Header:"기수",Type:"Text",SaveName:"hire_NUM", Hidden:1},      
         
         //재직정보
         {Header:"입사일",Type:"Text",SaveName:"employee_JOIN_DATE", Hidden:1},         
         {Header:"퇴사일",Type:"Text",SaveName:"employee_RESIGNATION_DATE", Hidden:1},         
         {Header:"부서코드",Type:"Text",SaveName:"department_CODE", Hidden:1},         
         {Header:"부서이름",Type:"Text",SaveName:"department_NAME", Hidden:1},      //30   
         {Header:"직급코드",Type:"Text",SaveName:"position_CODE", Hidden:1},         
         {Header:"직급이름",Type:"Text",SaveName:"position_NAME", Hidden:1},         
         {Header:"퇴직사유코드",Type:"Text",SaveName:"out_REASON_CODE", Hidden:1},         
         {Header:"퇴직사유이름",Type:"Text",SaveName:"out_REASON_NAME", Hidden:1},            
         {Header:"직종코드",Type:"Text",SaveName:"job_CLASS_CODE", Hidden:1},         //35
         {Header:"직종이름",Type:"Text",SaveName:"job_CLASS_NAME", Hidden:1},         
         {Header:"직책코드",Type:"Text",SaveName:"duty_CODE", Hidden:1},         
         {Header:"직책이름",Type:"Text",SaveName:"duty_NAME", Hidden:1},         
         {Header:"직무코드",Type:"Text",SaveName:"job_DIS_CODE", Hidden:1},         
         {Header:"직무이름",Type:"Text",SaveName:"job_DIS_NAME", Hidden:1},         //40            
         {Header:"재직구분",Type:"Text",SaveName:"work_STATUS_NAME", Hidden:1},         
         {Header:"수습적용",Type:"Text",SaveName:"probation_YN", Hidden:1},         
         {Header:"수습만료일",Type:"Text",SaveName:"probation_DATE", Hidden:1},         
         {Header:"근속기간포함",Type:"Text",SaveName:"work_INCLUDE_YN", Hidden:1},         
         {Header:"휴직기간시작",Type:"Text",SaveName:"leave_DATE_START",  Hidden:1 },   //45      
         {Header:"휴직기간종료",Type:"Text",SaveName:"leave_DATE_END", Hidden:1},         
         {Header:"분류코드",Type:"Text",SaveName:"d_CODE_CODE", Hidden:1},         
         {Header:"분류코드명",Type:"Text",SaveName:"d_CODE_NAME", Hidden:1},         
         {Header:"고용형태코드",Type:"Text",SaveName:"work_TYPE_CODE", Hidden:1},      
         {Header:"고용형태이름",Type:"Text",SaveName:"work_TYPE_NAME", Hidden:1},   //50   
         {Header:"급여형태코드",Type:"Text",SaveName:"pay_TYPE_CODE", Hidden:1},      
         {Header:"급여형태이름",Type:"Text",SaveName:"pay_TYPE_NAME", Hidden:1},       
      
      
         //급여정보  
         {Header:"호봉코드",Type:"Text",SaveName:"pay_GRADE_CODE", Hidden:1},         
         {Header:"호봉이름",Type:"Text",SaveName:"pay_GRADE_NAME", Hidden:1},         
         {Header:"기본급",Type:"Text",SaveName:"salary", Hidden:1},         //55
         {Header:"은행코드1",Type:"Text",SaveName:"bank_CODE_1", Hidden:1},         
         {Header:"은행명1",Type:"Text",SaveName:"bank_NAME_1", Hidden:1},         
         {Header:"계좌번호1",Type:"Text",SaveName:"account_NUMBER_1", Hidden:1},         
         {Header:"예금주1",Type:"Text",SaveName:"account_NAME_1", Hidden:1},         
         {Header:"은행코드2",Type:"Text",SaveName:"bank_CODE_2", Hidden:1},      //60   
         {Header:"은행명2",Type:"Text",SaveName:"bank_NAME_2", Hidden:1},          
         {Header:"계좌번호2",Type:"Text",SaveName:"account_NUMBER_2", Hidden:1},     
         {Header:"예금주2",Type:"Text",SaveName:"account_NAME_2", Hidden:1}         
         
           
      ];   
      IBS_InitSheet( mySheet , initSheet);
  
      mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
      mySheet.SetSheetHeight(620);
      mySheet.SetWaitImageVisible(0);
      
         //아이비시트 초기화
         var initSheet2 = {};
         initSheet2.Cfg = {SearchMode:smLazyLoad, ToolTip:1, sizeMode:3, FrozenCol:5}
         initSheet2.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
         initSheet2.Cols = [
               {Header:"상태",Type:"Status",SaveName:"STATUS", Align:"Center"},
               {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK"},
               {Header:"사원코드",Type:"Text",SaveName:"employee_CODE",Align:"Center",Width:100,InsertEdit:0, Hidden:1},    
               {Header:"계약시작월",Type:"Date",SaveName:"contract_START_MONTH",Align:"Center",Width:100,Format:"Ym"},         
               {Header:"계약종료월",Type:"Date",SaveName:"contract_END_MONTH",Align:"Center",Width:100,Format:"Ym"},
               {Header:"연봉",Type:"Int",SaveName:"contract_YEAR_PAY",Align:"Center",Width:200,Format:"Integer"},         
               {Header:"월급",Type:"Int",SaveName:"contract_MONTH_PAY",Align:"Center",Width:150,Format:"Integer"},         
               {Header:"일급",Type:"Int",SaveName:"contract_DAY_PAY",Align:"Center",Width:105,Format:"Integer"},       
               {Header:"시급",Type:"Int",SaveName:"contract_TIME_PAY",Align:"Center",Width:100,Format:"Integer"}
               ];
         createIBSheet2($("#yogi")[0],"mySheet2", "850px", "300px");
         IBS_InitSheet(mySheet2,initSheet2);
         mySheet2.SetWaitImageVisible(0);
        
            
       //주민등록번호
         $(function() {
            $('input[name=rrNumber]')
                  .keydown(
                        function(event) {
                           var key = event.charCode
                                 || event.keyCode || 0;
                           $text = $(this);
                           if (key !== 8 && key !== 9) {
                              if ($text.val().length === 6) {
                                 $text.val($text.val()
                                       + '-');
                              }

                           }
                           return (key == 8
                                 || key == 9
                                 || key == 46
                                 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
                        })
         });
      
      
      //달력 API
      $(function() {
          $( ".Datepicker" ).datepicker({
             changeMonth: true,
             changeYear: true,
             dateFormat: "yy-mm-dd",
             showOn: "both", 
             yearRange: "-100:+0",
             constrainInput: false,
             showMonthAfterYear: true,
              buttonImage: "${contextPath}/resources/image/icons/icon_calendar.png", 
              buttonImageOnly: true , 
               dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
               dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
               monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
               monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
        });
      });
      
      searchCondition();
   }
   
   //사원검색 조건
   function searchCondition(){
       var cond =document.getElementById("condition").value;
       var command =$('input[name="emp_radio"]:checked').val();    
       mySheet.DoSearch('${contextPath}/hm/p0004/searchList.do','condition='+cond+"&command="+command);
      
      }
   
   /*Sheet 각종 처리*/
   function doAction(sAction) {
      switch (sAction) {
      case "excel":
         var sums;
         for(var i=1;i<63;i++){
            sums+=i+"|";
         }sums+=++i;
         var params = { FileName : "인사정보등록.xls", SheetName : "Sheet1",DownCols:sums} ;
         mySheet.Down2Excel(params);
         break;
      case "search": //조회
         searchCondition();
         break;
       case "reload": //초기화
               mySheet.RemoveAll();
               mySheet2.RemoveAll();
             $('.right').find('input','select').val(''); 
               break;
       case "insert": //초기화
             var row = mySheet2.DataInsert();
               break;
        case "save": // 저장
            
               mySheet.SetCellValue($('input[name=myRow]').val(),5,$('input[name=engName]').val());
               
               //인적정보
               mySheet.SetCellValue($('input[name=myRow]').val(),6,$('input[name=hanName]').val());
               mySheet.SetCellValue($('input[name=myRow]').val(),7,$('input[name=foreignYN]').val());
               mySheet.SetCellValue($('input[name=myRow]').val(),8,$('input[name=rrNumber]').val());
               mySheet.SetCellValue($('input[name=myRow]').val(),9,$('select[name=sex]').val());
               mySheet.SetCellValue($('input[name=myRow]').val(),10,$('input[name=birthDate]').val());
               mySheet.SetCellValue($('input[name=myRow]').val(),11,$('input[name=contactNum]').val());
               mySheet.SetCellValue($('input[name=myRow]').val(),12,$('input[name=finalEduCode]').val());   
               mySheet.SetCellValue($('input[name=myRow]').val(),15,$('input[name=zipcode]').val());
               mySheet.SetCellValue($('input[name=myRow]').val(),16,$('input[name=address]').val());
               mySheet.SetCellValue($('input[name=myRow]').val(),17,$('input[name=addressDetail]').val());
               mySheet.SetCellValue($('input[name=myRow]').val(),18,$('input[name=addressEng]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),19,$('input[name=email]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),20,$('input[name=accessCard]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),21,$('select[name=householdYN]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),22,$('select[name=handicappedYN]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),23,$('input[name=countryCODE]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),25,$('select[name=hireType]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),26,$('input[name=hireNum]').val()); 
               
               //재직정보
            /*   mySheet.SetCellValue($('input[name=myRow]').val(),27,$('input[name=employee_JOIN_DATE]').val());
               mySheet.SetCellValue($('input[name=myRow]').val(),28,$('input[name=employee_RESIGNATION_DATE]').val());
                mySheet.SetCellValue($('input[name=myRow]').val(),31,$('input[name=department_CODE]').val());
               mySheet.SetCellValue($('input[name=myRow]').val(),32,$('input[name=department_NAME]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),33,$('input[name=position_CODE]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),34,$('input[name=position_NAME]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),35,$('input[name=out_REASON_CODE]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),36,$('input[name=out_REASON_NAME]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),39,$('input[name=job_CLASS_CODE]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),40,$('input[name=job_CLASS_NAME]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),41,$('input[name=duty_CODE]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),42,$('input[name=duty_NAME]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),43,$('input[name=job_DIS_CODE]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),44,$('input[name=job_DIS_NAME]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),41,$('input[name=work_STATUS_NAME]').val());  */
               mySheet.SetCellValue($('input[name=myRow]').val(),42,$('select[name=probation_YN]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),43,$('input[name=probation_DATE]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),44,$('select[name=work_INCLUDE_YN]').val()); 
              /*  mySheet.SetCellValue($('input[name=myRow]').val(),51,$('input[name=leave_DATE_START]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),52,$('input[name=leave_DATE_END]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),53,$('input[name=d_CODE_CODE]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),54,$('input[name=d_CODE_NAME]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),55,$('input[name=work_TYPE_CODE]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),56,$('input[name=work_TYPE_NAME]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),57,$('input[name=pay_TYPE_CODE]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),58,$('input[name=pay_TYPE_NAME]').val());   */
       
             //급여정보  
               mySheet.SetCellValue($('input[name=myRow]').val(),53,$('input[name=pay_GRADE_CODE]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),54,$('input[name=pay_GRADE_NAME]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),55,$('input[name=salary]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),56,$('input[name=bank_CODE_1]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),57,$('input[name=bank_NAME_1]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),58,$('input[name=account_NUMBER_1]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),59,$('input[name=account_NAME_1]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),60,$('input[name=bank_CODE_2]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),61,$('input[name=bank_NAME_2]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),62,$('input[name=account_NUMBER_2]').val()); 
               mySheet.SetCellValue($('input[name=myRow]').val(),63,$('input[name=account_NAME_2]').val()); 
                
               //사진전송
               sendData();

               mySheet.DoSave("${contextPath}/hm/p0004/saveData.do");
               
               if(mySheet2.IsDataModified()) {
            	   mySheet2.DoSave("${contextPath}/hm/p0004/saveData2.do", empCode); 
            	  }

              
               break;      
      }
   }
   function mySheet_OnSearchEnd(c,m){
       mySheet_OnClick(1, 5);
   }
   
   
   //로우 클릭시
   function mySheet_OnClick(Row, Col) {
      if (Row != 0) {
          $('input[name=myRow]').val(Row);
          
         //인적정보
            $('input[name=engName]').val(mySheet.GetCellValue(Row,5));
            $('input[name=hanName]').val(mySheet.GetCellValue(Row,6)); 
            $('input[name=foreignYN]').val(mySheet.GetCellValue(Row,7));
            $('input[name=rrNumber]').val(mySheet.GetCellValue(Row,8));
            $('select[name=sex]').val(mySheet.GetCellValue(Row,9));
            $('input[name=birthDate]').val(mySheet.GetCellValue(Row,10));
            $('input[name=contactNum]').val(mySheet.GetCellValue(Row,11));
            $('input[name=finalEduCode]').val(mySheet.GetCellValue(Row,12));
            $('input[name=finalEduName]').val(mySheet.GetCellValue(Row,13));
            $('#uploadedImg').attr('src',"${contextPath}/hm/p0004/getByteImage.do?empCode="+mySheet.GetCellValue(Row,2));   
            $('input[name=zipcode]').val(mySheet.GetCellValue(Row,15));
            $('input[name=address]').val(mySheet.GetCellValue(Row,16));
            $('input[name=addressDetail]').val(mySheet.GetCellValue(Row,17));
            $('input[name=addressEng]').val(mySheet.GetCellValue(Row,18));
            $('input[name=email]').val(mySheet.GetCellValue(Row,19));
            $('input[name=accessCard]').val(mySheet.GetCellValue(Row,20));
            $('select[name=householdYN]').val(mySheet.GetCellValue(Row,21));
            $('select[name=handicappedYN]').val(mySheet.GetCellValue(Row,22));
            $('input[name=countryCODE]').val(mySheet.GetCellValue(Row,23));
            $('input[name=countryNAME]').val(mySheet.GetCellValue(Row,24));
            $('select[name=hireType]').val(mySheet.GetCellValue(Row,25));
            $('input[name=hireNum]').val(mySheet.GetCellValue(Row,26));
      
          //재직정보  
            $('input[name=employee_JOIN_DATE]').val(mySheet.GetCellValue(Row,27));
            $('input[name=employee_RESIGNATION_DATE]').val(mySheet.GetCellValue(Row,28)); 
            $('input[name=department_CODE]').val(mySheet.GetCellValue(Row,29));
            $('input[name=department_NAME]').val(mySheet.GetCellValue(Row,30));
            $('input[name=position_CODE]').val(mySheet.GetCellValue(Row,31));
            $('input[name=position_NAME]').val(mySheet.GetCellValue(Row,32));
            $('input[name=out_REASON_CODE]').val(mySheet.GetCellValue(Row,33));
            $('input[name=out_REASON_NAME]').val(mySheet.GetCellValue(Row,34));
            $('input[name=job_CLASS_CODE]').val(mySheet.GetCellValue(Row,35));
            $('input[name=job_CLASS_NAME]').val(mySheet.GetCellValue(Row,36));
            $('input[name=duty_CODE]').val(mySheet.GetCellValue(Row,37)); 
            $('input[name=duty_NAME]').val(mySheet.GetCellValue(Row,38));
            $('input[name=job_DIS_CODE]').val(mySheet.GetCellValue(Row,39));
            $('input[name=job_DIS_NAME]').val(mySheet.GetCellValue(Row,40));
            $('input[name=work_STATUS_NAME]').val(mySheet.GetCellValue(Row,41));
            $('select[name=probation_YN]').val(mySheet.GetCellValue(Row,42));
            $('input[name=probation_DATE]').val(mySheet.GetCellValue(Row,43));
            $('select[name=work_INCLUDE_YN]').val(mySheet.GetCellValue(Row,44));
            $('input[name=leave_DATE_START]').val(mySheet.GetCellValue(Row,45));
            $('input[name=leave_DATE_END]').val(mySheet.GetCellValue(Row,46));
            $('input[name=d_CODE_CODE]').val(mySheet.GetCellValue(Row,47));
            $('input[name=d_CODE_NAME]').val(mySheet.GetCellValue(Row,48));
            $('input[name=work_TYPE_CODE]').val(mySheet.GetCellValue(Row,49));
            $('input[name=work_TYPE_NAME]').val(mySheet.GetCellValue(Row,50));
            $('input[name=pay_TYPE_CODE]').val(mySheet.GetCellValue(Row,51));
            $('input[name=pay_TYPE_NAME]').val(mySheet.GetCellValue(Row,52));
            
            //급여정보  
            $('input[name=pay_GRADE_CODE]').val(mySheet.GetCellValue(Row,53));
            $('input[name=pay_GRADE_NAME]').val(mySheet.GetCellValue(Row,54)); 
            $('input[name=salary]').val(mySheet.GetCellValue(Row,55)); 
            $('input[name=bank_CODE_1]').val(mySheet.GetCellValue(Row,56));
            $('input[name=bank_NAME_1]').val(mySheet.GetCellValue(Row,57));
            $('input[name=account_NUMBER_1]').val(mySheet.GetCellValue(Row,58));
            $('input[name=account_NAME_1]').val(mySheet.GetCellValue(Row,59));
            $('input[name=bank_CODE_2]').val(mySheet.GetCellValue(Row,60));
            $('input[name=bank_NAME_2]').val(mySheet.GetCellValue(Row,61));
            $('input[name=account_NUMBER_2]').val(mySheet.GetCellValue(Row,62));
            $('input[name=account_NAME_2]').val(mySheet.GetCellValue(Row,63));
            empCode = "empCode=" + mySheet.GetCellValue(Row,2);
            mySheet2.DoSearch("${contextPath}/hm/p0004/searchContract.do", "empCode="+mySheet.GetCellValue(Row,2));  
         
      }
   }

   
   
   //도로명주소검색 API
      function goPopup(){
         var pop = window.open("findAddress.do","addressPopup","width=570,height=420, scrollbars=yes, resizable=yes"); 
      }
      function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
         document.form.zipcode.value = zipNo;    
         document.form.address.value = roadAddrPart1;   
         document.form.addressDetail.value = addrDetail;   
         document.form.addressEng.value = engAddr;   
         
   }
      
    //분류코드 팝업   
      function findPopup(tablename){
         var pop = window.open("findPopup.do?command="+tablename,"findPopup","width=342,height=520,resizable = no, scrollbars = no"); 
      }
      function findPopup(tablename, index){
         var pop = window.open("findPopup.do?command="+tablename+"&index="+index,"findPopup","width=342,height=520,resizable = no, scrollbars = no"); 
      }
     
   //사진전송
   function sendData() {   
      var data = new FormData();
      data.append("emp_CODE", mySheet.GetCellValue($('input[name=myRow]').val(),2))
      data.append("picture", $('#inpicture')[0].files[0])
      $.ajax({
         url : "${contextPath}/hm/p0004/saveFile.do",
         type : "POST",
         dataType : 'json',
         data : data,
         processData : false,
         contentType : false,
         type : 'POST',
         success : function(data) {
         }
      });
   }
  
   function selectPicture() {
      if(mySheet.GetCellValue(1,3)==-1){
         alert("조회 후 등록해주세요.");
         return false;
      }
      $("#inpicture").click();
      var ext = $("#inpicture").val().split(".").pop().toLowerCase();
      if (ext.length > 0) {
         if ($.inArray(ext, [ "gif", "png", "jpg", "jpeg" ]) == -1) {
            alert("gif,png,jpg 파일만 업로드 할수 있습니다.");
            return false;
         }
      }
      $("#inpicture").val().toLowerCase();
   }
   function readURL(input) {
      if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.readAsDataURL(input.files[0]);
         reader.onload = function(e) {
            //Initiate the JavaScript Image object.
                var image = new Image();
                //Set the Base64 string return from FileReader as source.
                image.src = e.target.result;
                image.onload = function () {
                    //Determine the Height and Width.
                    var height = this.height;
                    var width = this.width;
                    if (height > 219 || width > 252) {
                        alert("사진이 너무 큽니다");
                        return false;
                    }
                    $('#uploadedImg').attr('src', e.target.result);
                    return true;      
         };
      }
   }
   }
   
</script>
<style type="text/css">
.ui-datepicker{ font-size: 12px; width: 210px; }
.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
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
.pictureUpload {
   font-size: 13px;
   margin-left: 5px;
   background-color: #3498DB;
   color: white;
   padding: 5px 50px;
   border-radius: 7px;
   text-decoration: none;
}
.pictureUpload:hover {
   background-color: #2C3E50;
}
.left {
   position: relative;
   top: 130px;
   left: 60px;
   width: 403px;
}
.left input{
   height: 22px;
   border-radius: 3px;
   border: none;
   padding-left:5px;
   vertical-align: middle;
   }
   
.right {
   position: relative;
   top: -580px;
   left: 500px;
   height: 710px;
   width: 1000px;
   background: #EBEBEB;
   border-radius: 5px;
}
.right a {
text-decoration: none;
}
#searchBar {
   background: #EBEBEB;
   padding: 10px 30px;
   margin-bottom: 20px;
   border-radius: 5px;
   font-size: 12px;
   border-radius: 5px;
}
.tg input, select {
   height: 22px;
   border-radius: 3px;
   border: none;
   padding-left:5px;
   vertical-align: middle;
}
.tg img {
   vertical-align: middle;
   padding: 0px 5px 0px 2px;
}
.tg {
   border-collapse: collapse;
   border-spacing: 0;
   width: 90%;
   
}
.tg td {
   font-family: Arial, sans-serif;
   font-size: 14px;
   padding: 7px 2px;
   overflow: hidden;
   word-break: normal;
   border-color: black;
}
.tg th {
   font-family: Arial, sans-serif;
   font-size: 14px;
   font-weight: normal;
   padding: 0px 5px;
   overflow: hidden;
   word-break: normal;
   border-color: black;
}
.tg .tg-dm68 {
   font-size: 12px;
   font-family: Verdana, Geneva, sans-serif !important;;
   background-color: #d4d4d4;
   border-color: #bebebe;
   text-align: center;
   vertical-align: center
}
.tg .tg-lu1x {
   font-size: 12px;
   font-family: Verdana, Geneva, sans-serif !important;;
   background-color: #333333;
   color: #ffffff;
   border-color: inherit;
   text-align: center;
   vertical-align: center;
   width: 40px;
   border-radius: 2px;
}
.tg .tg-au0w {
   font-size: 12px;
   font-family: Verdana, Geneva, sans-serif !important;;
   border-color: inherit;
   text-align: left;
   vertical-align: center
}
.tg .tg-8thm {
   font-size: 12px;
   font-family: Verdana, Geneva, sans-serif !important;;
   background-color: #d4d4d4;
   border-color: inherit;
   text-align: right;
   vertical-align: center
}
.tg .tg-v9i9 {
   font-size: 12px;
   font-family: Verdana, Geneva, sans-serif !important;;
   background-color: #d4d4d4;
   border-color: inherit;
   text-align: left;
   vertical-align: center
}
</style>
</head>
<body onload="LoadPage()" style="overflow: hidden;">
   <div class="leftbuttons">
       <a href="javascript:doAction('excel')" class="IBbutton">엑셀</a>
   </div>
   <div class="rightbuttons">
      <a href="javascript:doAction('reload')" class="IBbutton">초기화</a> <a
         href="javascript:doAction('search')" class="IBbutton">조회</a> <a
         href="javascript:doAction('insert')" class="IBbutton">계약추가</a> <a
         href="javascript:doAction('save')" class="IBbutton">저장</a>
   </div>

   <div class="title">
      <header>
         <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 인사관리 :
         인사정보등록
      </header>
   </div>
   <div class="left">
      <form id="searchBar" action="javascript:searchCondition();">
         조회기준 
         <input type="radio" name="emp_radio" value="doWork" onclick="searchCondition();"> 재직 
         <input type="radio" name="emp_radio" value="noWork" onclick="searchCondition();">퇴직 
         <input type="radio" name="emp_radio" value="" checked="checked" onclick="searchCondition();"> 전체<br> 
         사원검색 <input type="text" name="condition" id="condition" placeholder="사원번호"> 
         <input type="submit" value="조회" style="background-color: #5E5E5E; color: white;">
      </form>

      <script>createIBSheet("mySheet", "100%", "100%");</script>
   </div>

   <div class="right">

      <div id="ib_sheetTab">
         <div class="ib-tab-tabs-item">
            <a class="ib-tab-tabs-item__link is-active"><span
               class="ib-tab-tabs-item__title">인적정보 </span></a> <a
               class="ib-tab-tabs-item__link"><span
               class="ib-tab-tabs-item__title">재직정보 </span></a> <a
               class="ib-tab-tabs-item__link"><span
               class="ib-tab-tabs-item__title">급여정보</span></a>
         </div>
      </div>

      <div id="ib_sheetContents">
         <div class="ib-tab-contents__item" style="background: none;">
            <div id='ib-container1'>



               <form name="form" id="form" method="post">
                  <table class="tg">
                     <tr>
                        <th class="tg-lu1x" rowspan="8"><i
                           class="fa fa-address-book" aria-hidden="true"></i><br>개<br>인<br>정<br>보</th>
                        <th class="tg-au0w" rowspan="18"></th>
                        <td class="tg-dm68" rowspan="7"><img id=uploadedImg alt="" src="" ></td>
                              
                        <th class="tg-au0w" rowspan="8"></th>

                        <td class="tg-8thm">성명(영문)<input type="hidden" name="myRow"></td>
                        <th class="tg-v9i9" rowspan="8"></th>
                        <td class="tg-v9i9" colspan="3"><input type="text"
                           id="engName" name="engName" style="width: 350px;"></td>
                     </tr>
                     <tr>
                        <td class="tg-8thm">성명(한자)</td>
                        <td class="tg-v9i9" colspan="3"><input type="text"
                           id="hanName" name="hanName" style="width: 350px;"></td>
                     </tr>
                     <tr>
                        <td class="tg-8thm">내외국인구분</td>
                        <td class="tg-v9i9" colspan="3"><select name=foreignYN
                           style="width: 350px;"><option value='Y' selected>내국인</option>
                              <option value='N'>외국인</option></select></td>
                     </tr>
                     <tr>
                        <td class="tg-8thm">주민등록번호</td>
                        <td class="tg-v9i9" colspan="3"><input type="text"
                           id="rrNumber" name="rrNumber" style="width: 350px;"maxlength="14" placeholder="______-_______"></td>
                     </tr>
                     <tr>
                        <td class="tg-8thm">성별</td>
                        <td class="tg-v9i9" colspan="3"><select name=sex
                           style="width: 350px;"><option value='남' selected>남자</option>
                              <option value='여'>여자</option></select></td>
                     </tr>
                     <tr>
                        <td class="tg-8thm">생년월일</td>
                        <td class="tg-v9i9" colspan="3"><input type="text"
                           name="birthDate" class="Datepicker"  style="width: 330px;"  placeholder="____-__-__" readonly></td>
                     </tr>
                     <tr>
                        <td class="tg-8thm">전화번호</td>
                        <td class="tg-v9i9" colspan="3"><input type="text"
                           id="contactNum" name="contactNum" style="width: 350px;"></td>
                     </tr>
                     <tr>
                        <td class="tg-dm68"><a id="pictureUpload" class="pictureUpload"href=javascript:selectPicture()>사진등록</a>
                        <input type="file" name="picture" id="inpicture" onchange="readURL(this);" style="width:0;height:0;"/></td>

                        <td class="tg-8thm">최종학력</td>
                        <td class="tg-v9i9" colspan="3"><input type="text"
                           id="FINAL_EDU_CODE" name="finalEduCode" style="width: 50px;"><a
                           href="javascript:findPopup('FINAL_EDU');"><img
                              src="${contextPath}/resources/image/icons/icon_plus.png"></a>
                           <input type="text" id="FINAL_EDU_NAME" name="finalEduName"
                           style="width: 272px;"></td>
                     </tr>
                     <tr>
                        <td class="tg-au0w"></td>
                        <td class="tg-au0w" colspan="7"></td>
                     </tr>
                     <tr>
                        <td class="tg-lu1x" rowspan="9"><i
                           class="fa fa-id-card" aria-hidden="true"></i><br>거<br>주<br>정<br>보</td>

                        <td class="tg-8thm">주민등록주소</td>
                        <td class="tg-v9i9" rowspan="9"></td>
                        <td class="tg-v9i9" colspan="5"><input type="text"
                           name="zipcode" id="zipcode" onclick="javascript:goPopup();"
                           style="width: 50px;"><a href="javascript:goPopup();"><img
                              src="${contextPath}/resources/image/icons/icon_plus.png"></a>
                           <input type="text" id="address" name="address"
                           onclick="javascript:goPopup();" style="width: 380px;"></td>
                     </tr>
                     <tr>
                        <td class="tg-8thm">상세주소</td>
                        <td class="tg-v9i9" colspan="5"><input type="text"
                           id="addressDetail" name="addressDetail" style="width: 460px;"></td>
                     </tr>
                     <tr>
                        <td class="tg-8thm">영문주소</td>
                        <td class="tg-v9i9" colspan="5"><input type="text"
                           id="addressEng" name="addressEng" style="width: 460px;"></td>
                     </tr>
                     <tr>
                        <td class="tg-8thm">E-MAIL</td>
                        <td class="tg-v9i9" colspan="5"><input type="text"
                           id="email" name="email" style="width: 460px;"></td>
                     </tr>
                     <tr>
                        <td class="tg-8thm">출입카드NO.</td>
                        <td class="tg-v9i9" colspan="5"><input type="text"
                           id="accessCard" name="accessCard" style="width: 460px;"></td>
                     </tr>
                     <tr>
                        <td class="tg-8thm">세대주여부</td>
                        <td class="tg-v9i9"><select name=householdYN><option
                                 value='Y' selected>여</option>
                              <option value='N'>부</option></select></td>

                        <td class="tg-v9i9"></td>
                        <td class="tg-8thm">장애인구분</td>
                        <td class="tg-v9i9"></td>
                        <td class="tg-v9i9"><select name=handicappedYN><option
                                 value='Y'>여</option>
                              <option value='N' selected>부</option></select></td>
                     </tr>
                     <tr>
                        <td class="tg-8thm">국적</td>
                        <td class="tg-v9i9" colspan="5"><a
                           href="javascript:findPopup('COUNTRY');"><input type="text"
                           id="COUNTRY_CODE" name="countryCODE" style="width: 50px;"><img
                              src="${contextPath}/resources/image/icons/icon_plus.png"><input type="text" id="COUNTRY_NAME" name="countryNAME"
                           style="width: 380px;"></a>
                           </td>
                     </tr>
                     
                     <tr>
                        <td class="tg-8thm">채용구분</td>
                        <td class="tg-v9i9"><select name=hireType><option
                                 value='공채'>공개채용</option>
                              <option value='수시'>수시채용</option></select></td>
                        <td class="tg-v9i9"></td>
                        <td class="tg-8thm">기수</td>
                        <td class="tg-v9i9"></td>
                        <td class="tg-v9i9"><input type="text" id="hireNum"
                           name="hireNum" style="width: 230px;"></td>
                     </tr>
                  </table>
               </form>

            </div>
         </div>
         <div class="ib-tab-contents__item">
            <div id='ib-container2'>

               <table class="tg">
                  <tr>
                     <th class="tg-lu1x" rowspan="5"><i
                        class="fa fa-address-book" aria-hidden="true"></i><br>입<br>사<br>정<br>보
                     </th>
                     <td class="tg-au0w" rowspan="5"></td>
                     <td class="tg-8thm">입사일자</td>
                     <td class="tg-v9i9" rowspan="5"></td>
                     <td class="tg-v9i9"><input type="text" name="employee_JOIN_DATE" style="width: 255px;"placeholder="____-__-__" readonly></td>
                     <td class="tg-8thm">퇴사일자</td>
                     <td class="tg-v9i9" rowspan="5"></td>
                     <td class="tg-v9i9"><input type="text" name="employee_RESIGNATION_DATE" style="width: 255px;"placeholder="____-__-__" readonly></td>
                  </tr>
                  <tr>
                     <td class="tg-8thm">재직구분</td>
                     <td class="tg-v9i9"><input name="work_STATUS_NAME" style="width: 255px;" readonly></td>
                     <td class="tg-8thm"></td>
                     <td class="tg-v9i9"></td>
                  </tr>
                  <tr>
                     <td class="tg-8thm">수습적용</td>
                     <td class="tg-v9i9"><select name="probation_YN"
                        style="width: 255px;">
                           <option value='N'>미적용</option>
                           <option value='Y'>적용</option>
                     </select></td>
                     <td class="tg-8thm">수습만료일</td>
                     <td class="tg-v9i9"><input type="text" name="probation_DATE"
                        class="Datepicker" style="width: 230px;"readonly placeholder="____-__-__"></td>
                  </tr>
                  <tr>
                     <td class="tg-8thm">근속기간포함</td>
                     <td class="tg-v9i9"><select name="work_INCLUDE_YN"
                        style="width: 255px;">
                           <option value='Y'>포함</option>
                           <option value='N'>미포함</option>
                     </select></td>
                     <td class="tg-8thm"></td>
                     <td class="tg-v9i9"></td>
                  </tr>
                  <tr>
                     <td class="tg-8thm">휴직기간</td>
                     <td class="tg-v9i9" colspan="2"><input type="text"
                        name="leave_DATE_START" class="Datepicker" style="width: 95px;" readonly placeholder="____-__-__">
                        ~ <input type="text" name="leave_DATE_END" class="Datepicker"
                        style="width: 95px;" readonly placeholder="____-__-__"></td>
                     <td class="tg-v9i9"></td>
                  </tr>
                  <tr>
                     <td class="tg-au0w" colspan="8"></td>
                  </tr>
                  <tr>
                     <td class="tg-lu1x" rowspan="11"><i class="fa fa-id-card"
                        aria-hidden="true"></i><br>근<br>무<br>정<br>보
                     </td>
                     <td class="tg-au0w" rowspan="11"></td>
                     <td class="tg-8thm">부서</td>
                     <td class="tg-v9i9" rowspan="11"></td>
                     <td class="tg-v9i9" colspan="4"><input type="text"
                        id="DEPARTMENT_CODE" name="department_CODE" style="width: 50px;" readonly>
                        <input type="text" id="DEPARTMENT_NAME" name="department_NAME"
                        style="width: 272px;"readonly></td>
                  </tr>
                  <tr>
                     <td class="tg-8thm">고용형태</td>
                     <td class="tg-v9i9" colspan="4"><input type="text"
                        id="WORK_TYPE_CODE" name="work_TYPE_CODE" style="width: 50px;" readonly>
                        <input type="text" id="WORK_TYPE_NAME" name="work_TYPE_NAME"
                        style="width: 272px;"readonly></td>
                  </tr>
                  <tr>
                     <td class="tg-8thm">직종</td>
                     <td class="tg-v9i9" colspan="4"><input type="text"
                        id="JOB_CLASS_CODE" name="job_CLASS_CODE" style="width: 50px;" readonly>
                        <input type="text" id="JOB_CLASS_NAME" name="job_CLASS_NAME"
                        style="width: 272px;"readonly></td>
                  </tr>
                  <tr>
                     <td class="tg-8thm">급여형태</td>
                     <td class="tg-v9i9" colspan="4"><input type="text"
                        id="PAY_TYPE_CODE" name="pay_TYPE_CODE" style="width: 50px;" readonly>
                        <input type="text" id="PAY_TYPE_NAME" name="pay_TYPE_NAME"
                        style="width: 272px;"readonly></td>
                  </tr>
                  <tr>
                     <td class="tg-8thm">직급</td>
                     <td class="tg-v9i9" colspan="4"><input type="text"
                        id="POSITION_CODE" name="position_CODE" style="width: 50px;" readonly>
                        <input type="text" id="POSITION_NAME" name="position_NAME"
                        style="width: 272px;"readonly></td>
                  </tr>
                  <tr>
                     <td class="tg-8thm">직책</td>
                     <td class="tg-v9i9" colspan="4"><input type="text"
                        id="DUTY_CODE" name="duty_CODE" style="width: 50px;" readonly>
                        <input type="text" id="DUTY_NAME" name="duty_NAME"
                        style="width: 272px;"readonly></td>
                  </tr>
                  <tr>
                     <td class="tg-8thm">직무</td>
                     <td class="tg-v9i9" colspan="4"><input type="text"
                        id="JOB_DIS_CODE" name="job_DIS_CODE" style="width: 50px;" readonly>
                        <input type="text" id="JOB_DIS_NAME" name="job_DIS_NAME"
                        style="width: 272px;"readonly></td>
                  </tr>
                  <tr>
                     <td class="tg-8thm">분류코드</td>
                     <td class="tg-v9i9" colspan="4"><input type="text"
                        id="D_CODE_CODE" name="d_CODE_CODE" style="width: 50px;" readonly>
                        <input type="text" id="D_CODE_NAME" name="d_CODE_NAME"
                        style="width: 272px;"readonly></td>
                  </tr>
                  <tr>
                     <td class="tg-8thm">퇴직사유</td>
                     <td class="tg-v9i9" colspan="4"><input type="text"
                        id="OUT_REASON_CODE" name="out_REASON_CODE" style="width: 50px;" readonly>
                        <input type="text" id="OUT_REASON_NAME" name="out_REASON_NAME"
                        style="width: 272px;"readonly></td>
                  </tr>
               </table>


            </div>
         </div>
         <div class="ib-tab-contents__item">
            <div id='ib-container3'>

               <table class="tg">
                  <tr>
                     <th class="tg-lu1x" rowspan="7"><i class="fa fa-id-card"
                        aria-hidden="true"></i><br>급<br>여<br>정<br>보
                     </th>
                     <td class="tg-au0w" rowspan="7"></td>
                     <td class="tg-8thm">호봉</td>
                     <td class="tg-v9i9" rowspan="7"></td>
                     <td class="tg-v9i9"><input type="text"
                           id="PAY_GRADE_CODE" name="pay_GRADE_CODE" style="width: 50px;"readonly><img
                              src="${contextPath}/resources/image/icons/icon_plus.png">
                           <input type="text" id="PAY_GRADE_NAME" name="pay_GRADE_NAME"
                           style="width: 170px;"></td>
                     <td class="tg-8thm">기본급</td>
                     <td class="tg-v9i9"></td>
                     <td class="tg-v9i9"><input type="text" id="salary" name="salary"
                           style="width: 150px;"> 원</td>
                  </tr>
                  <tr>
                     <td class="tg-v9i9"></td>
                     <td class="tg-v9i9" colspan="4"></td>
                  </tr>
                  <tr>
                     <td class="tg-8thm">급여이체은행</td>
                     <td class="tg-v9i9" colspan="4"><a
                        href="javascript:findPopup('BANK','_1');"><input type="text"
                        id="BANK_CODE_1" name="bank_CODE_1" style="width: 80px;"readonly><img
                           src="${contextPath}/resources/image/icons/icon_plus.png">
                        <input type="text" id="BANK_NAME_1" name="bank_NAME_1"
                        style="width: 470px;" readonly></a></td>
                  </tr>
                  <tr>
                     <td class="tg-8thm">계좌번호</td>
                     <td class="tg-v9i9"><input type="text" id="account_NUMBER_1" name="account_NUMBER_1"
                        style="width: 250px;"></td>
                     <td class="tg-8thm">예금주</td>
                     <td class="tg-v9i9"></td>
                     <td class="tg-v9i9"><input type="text" id="account_NAME_1" name="account_NAME_1"
                        style="width: 150px;"></td>
                  </tr>
                  <tr>
                     <td class="tg-v9i9"></td>
                     <td class="tg-v9i9" colspan="4"></td>
                  </tr>
                  <tr>
                     <td class="tg-8thm">급여이체은행</td>
                     <td class="tg-v9i9" colspan="4"><a
                        href="javascript:findPopup('BANK','_2');"><input type="text"
                        id="BANK_CODE_2" name="bank_CODE_2" style="width: 80px;"readonly><img
                           src="${contextPath}/resources/image/icons/icon_plus.png">
                        <input type="text" id="BANK_NAME_2" name="bank_NAME_2"
                        style="width: 470px;" readonly></a></td>
                  </tr>
                  <tr>
                     <td class="tg-8thm">계좌번호</td>
                     <td class="tg-v9i9"><input type="text" id="account_NUMBER_2" name="account_NUMBER_2"
                        style="width: 250px;"></td>
                     <td class="tg-8thm">예금주</td>
                     <td class="tg-v9i9"></td>
                     <td class="tg-v9i9"><input type="text" id="account_NAME_2" name="account_NAME_2"
                        style="width: 150px;"></td>
                  </tr>
                  <tr>
                     <td class="tg-au0w" colspan="8"></td>
                  </tr>
                     
                   <tr>
                     <th class="tg-lu1x" rowspan="7"><i class="fa fa-id-card"
                        aria-hidden="true"></i><br>계<br>약<br>정<br>보
                     </th>
                     <td class="tg-au0w" rowspan="7"></td>
                     
                     
                     <td style="padding:0px 0px 0px 0px;" width="900px" colspan="8" rowspan="7"><div id='yogi' ></div></td>
                     
                  </tr> 
               </table>

            </div>
         </div>
         
      </div>
   </div>




</body>

</html>