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
<link href="${contextPath}/resources/tab/css/ibtab-style.css" rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js" type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js" type="text/javascript"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script language="javascript">

   /*Sheet 기본 설정 */
   function LoadPage() {
      mySheet.RemoveAll();
    
      //아이비시트 초기화
      var initSheet = {};
      initSheet.Cfg = {SearchMode:smLazyLoad,ToolTip:1,sizeMode:0};
      initSheet.HeaderMode = {Sort:1,ColMove:0,ColResize:0,HeaderCheck:1};
      initSheet.Cols = [
         {Header:"상태",Type:"Status",SaveName:"STATUS",MinWidth:60, Align:"Center"},
         {Header:"삭제",Type:"DelCheck",SaveName:"DEL_CHK",MinWidth:60},
         {Header:"코드",Type:"Text",SaveName:"site_CODE",MinWidth:80,KeyField:1, Align:"Center"},
         {Header:"사업장명",Type:"Text",SaveName:"site_NAME",MinWidth:200,KeyField:1, Align:"Center"}, 
         
         {Header:"사업자등록번호",Type:"Text",SaveName:"site_RESISTRATION_NUMBER",KeyField:1 ,Hidden:1},         
         {Header:"법인등록번호",Type:"Text",SaveName:"site_CORPARATION_NUMBER",Hidden:1},         
         {Header:"대표자명",Type:"Text",SaveName:"site_REPRESENTATIVE_NAME",KeyField:1,Hidden:1 },         
         {Header:"사업장우편번호",Type:"Text",SaveName:"site_ZIP_CODE",Hidden:1},         
         {Header:"사업장주소",Type:"Text",SaveName:"site_ADDRESS",KeyField:1,Hidden:1},         
         {Header:"사업장번지",Type:"Text",SaveName:"site_ADDRESS_DETAIL",Hidden:1},         
         {Header:"사업장전화번호",Type:"Text",SaveName:"site_CONTACT",Hidden:1},         
         {Header:"사업장팩스",Type:"Text",SaveName:"site_FAX",Hidden:1},         
         {Header:"업태",Type:"Text",SaveName:"site_CATEGORY",KeyField:1,Hidden:1},         
         {Header:"종목",Type:"Text",SaveName:"site_TYPE",KeyField:1,Hidden:1},         
         {Header:"개업연월일",Type:"Text",SaveName:"site_OPENBUSINESS_DATE",Hidden:1},
         {Header:"폐업연월일",Type:"Text",SaveName:"site_CLOSEBUSINESS_DATE",Hidden:1},
         {Header:"본점여부",Type:"Text",SaveName:"site_BUSINESS_AVAILABLE",KeyField:1,Hidden:1},
         {Header:"회사코드",Type:"Text",SaveName:"company_CODE",KeyField:1,Hidden:1}
      ];   
      IBS_InitSheet( mySheet , initSheet);
  
      mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
      mySheet.SetSheetHeight(620);
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
      
   }
   
   /*Sheet 각종 처리*/
   function doAction(sAction) {
      switch(sAction) {
     	 case "excel":
			var params = { FileName : "사업장등록.xls", SheetName : "Sheet1"} ;
			mySheet.Down2Excel(params);
			break;
         case "search": //조회
            mySheet.DoSearch("${contextPath}/sm/p0002/searchList.do", "param="+$("#company_CODE").val());
            break;
            
         case "reload": //초기화
            mySheet.RemoveAll();
            break;
         case "save": // 저장
         
         		 mySheet.SetCellValue($('input[name=myRow]').val(),4,nullcheck($('input[name=site_RESISTRATION_NUMBER]').val()));
                 mySheet.SetCellValue($('input[name=myRow]').val(),5,nullcheck($('input[name=site_CORPARATION_NUMBER]').val()));
                 mySheet.SetCellValue($('input[name=myRow]').val(),6,nullcheck($('input[name=site_REPRESENTATIVE_NAME]').val()));
                 mySheet.SetCellValue($('input[name=myRow]').val(),7,nullcheck($('input[name=site_ZIP_CODE]').val()));
                 mySheet.SetCellValue($('input[name=myRow]').val(),8,nullcheck($('input[name=site_ADDRESS]').val()));
                 mySheet.SetCellValue($('input[name=myRow]').val(),9,nullcheck($('input[name=site_ADDRESS_DETAIL]').val()));
                 mySheet.SetCellValue($('input[name=myRow]').val(),10,nullcheck($('input[name=site_CONTACT]').val()));
                 mySheet.SetCellValue($('input[name=myRow]').val(),11,nullcheck($('input[name=site_FAX]').val()));
                 mySheet.SetCellValue($('input[name=myRow]').val(),12,nullcheck($('input[name=site_CATEGORY]').val()));
                 mySheet.SetCellValue($('input[name=myRow]').val(),13,nullcheck($('input[name=site_TYPE]').val()));
                 mySheet.SetCellValue($('input[name=myRow]').val(),14,nullcheck($('input[name=site_OPENBUSINESS_DATE]').val()));
                 mySheet.SetCellValue($('input[name=myRow]').val(),15,$('input[name=site_CLOSEBUSINESS_DATE]').val());
                 mySheet.SetCellValue($('input[name=myRow]').val(),16,nullcheck($('select[name=site_BUSINESS_AVAILABLE]').val())); 
         	
				           
            
            mySheet.DoSave("${contextPath}/sm/p0002/saveData.do");
            break;         
         case "insert": //신규행 추가
            var row = mySheet.DataInsert();
            break;
      }
   }
   
   function nullcheck(value){
	   if(value==null||value==""){
		   alert("필수 폼이 비어있습니다.");
		   event.stopImmediatePropagation
		   return false;
	   }else{
		   return value;
	   }
   }
   
   
   //로우 클릭시
   function mySheet_OnClick(Row, Col) {
      if(Row!=0){
      $('input[name=myRow]').val(Row);
      $('input[name=site_RESISTRATION_NUMBER]').val(mySheet.GetCellValue(Row,4));
      $('input[name=site_CORPARATION_NUMBER]').val(mySheet.GetCellValue(Row,5)); 
      $('input[name=site_REPRESENTATIVE_NAME]').val(mySheet.GetCellValue(Row,6));
      $('input[name=site_ZIP_CODE]').val(mySheet.GetCellValue(Row,7));
      $('input[name=site_ADDRESS]').val(mySheet.GetCellValue(Row,8));
      $('input[name=site_ADDRESS_DETAIL]').val(mySheet.GetCellValue(Row,9));
      $('input[name=site_CONTACT]').val(mySheet.GetCellValue(Row,10));
      $('input[name=site_FAX]').val(mySheet.GetCellValue(Row,11));
      $('input[name=site_CATEGORY]').val(mySheet.GetCellValue(Row,12));
      $('input[name=site_TYPE]').val(mySheet.GetCellValue(Row,13));
      $('input[name=site_OPENBUSINESS_DATE]').val(mySheet.GetCellValue(Row,14));
      $('input[name=site_CLOSEBUSINESS_DATE]').val(mySheet.GetCellValue(Row,15));
      $('select[name=site_BUSINESS_AVAILABLE]').val(mySheet.GetCellValue(Row,16));
      }
   } 
   //조회 후 
   function mySheet_OnSearchEnd(code,msg){
	   if(mySheet.GetCellValue(1,3)!=-1){
	   mySheet_OnClick(1, 0);		   
	   }else{
		   $(".tg").find("input").val("");
	   }
   }
   
   
   //Formating
   $(document).ready(function () {
   
        //사업자등록번호
         $(function () {    
                  $('input[name=site_RESISTRATION_NUMBER]').keydown(function (event) {
                   var key = event.charCode || event.keyCode || 0;
                   $text = $(this); 
                   if (key !== 8 && key !== 9) {
                       if ($text.val().length === 3) {
                           $text.val($text.val() + '-');
                       }
                       if ($text.val().length === 6) {
                           $text.val($text.val() + '-');
                       }
                   }
                   return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
               })
         });
            //법인등록번호
         $(function () {            
            $('input[name=site_CORPARATION_NUMBER]').keydown(function (event) {
                 var key = event.charCode || event.keyCode || 0;
                 $text = $(this); 
                 if (key !== 8 && key !== 9) {
                     if ($text.val().length === 6) {
                         $text.val($text.val() + '-');
                     }       
                 }
                   return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
               })
         });

   
   //전화번호,팩스
   $(function () { 
         $('.siteNUM').keydown(function (event) {
        var key = event.charCode || event.keyCode || 0;
        $text = $(this);
        if (key !== 8 && key !== 9) {
           if($text.val().substr(0,2)=='02'){
              if ($text.val().length === 2) {
                    $text.val($text.val() + '-');
                }
                if ($text.val().length === 6) {
                    $text.val($text.val() + '-');
                }
           }else{
              if ($text.val().length === 3) {
                    $text.val($text.val() + '-');
                }
                if ($text.val().length === 8) {
                    $text.val($text.val() + '-');
                }
           }
      
        }
        return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
    })
   }); 
 
      
});//document.ready
   

   //도로명주소검색 API
   function goPopup(){
      var pop = window.open("findAddress.do","addressPopup","width=570,height=420, scrollbars=yes, resizable=yes"); 
   }
   function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){

      document.form.site_ZIP_CODE.value = zipNo;   
      document.form.site_ADDRESS.value = roadAddrPart1;   
      document.form.site_ADDRESS_DETAIL.value = addrDetail;   
}

   //분류코드 팝업   
   function findPopup(tablename){
      var pop = window.open("findPopup.do","findPopup","width=342,height=520,resizable = no, scrollbars = no"); 
   }
</script>
<style type="text/css">
.ui-datepicker{ font-size: 12px; width: 160px; }
.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
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
.left{
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
.right{
position: relative;
top: -580px;
left: 500px;
height: 710px;
	width: 1000px;
background: #EBEBEB;
	border-radius: 5px;
}

.right .tg{
border-collapse: collapse;
	border-spacing: 0;
	width: 90%;
	height:100%;
}

.right .tg input,select{
height: 22px;
border-radius: 3px;
border : none;
padding-left: 10px;
width: 70%;
}
#ib_sheetContents{
height:100%;
}

.tg img {
	vertical-align: middle;
	padding: 0px 5px 0px 2px;
}
.left img{
vertical-align: middle;
padding: 0px 5px 0px 2px;
}

.tg  {border-collapse:collapse;border-spacing:0; position: relative; top:20px;left:20px;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:7px 2px;overflow:hidden;word-break:normal;border-color:black;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:0px 5px;overflow:hidden;word-break:normal;border-color:black;}
.tg .tg-lu1x{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;background-color:#333333;color:#ffffff;border-color:inherit;text-align:center;vertical-align:center;width:30px; border-radius:2px;}
.tg .tg-au0w{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;border-color:inherit;text-align:left;vertical-align:center}
.tg .tg-8thm{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;background-color:#d4d4d4;border-color:inherit;text-align:right;vertical-align:center}
.tg .tg-v9i9{font-size:12px;font-family:Verdana, Geneva, sans-serif !important;;background-color:#d4d4d4;border-color:inherit;text-align:left;vertical-align:center}

#searchBar {
	background: #EBEBEB;
	padding: 25px 30px 25px 30px;
	margin-bottom: 20px;
	border-radius: 5px;
	font-size: 12px;
	border-radius: 5px;
	
}
</style>
</head>
<body onload="LoadPage()" style="overflow-x: hidden">



 <div class="leftbuttons">
      <a href="javascript:doAction('excel')" class="IBbutton">엑셀</a>
   </div> 


   <div class="rightbuttons">
      <a href="javascript:doAction('reload')" class="IBbutton">초기화</a> <a
         href="javascript:doAction('insert')" class="IBbutton">추가</a> <a
         href="javascript:doAction('search')" class="IBbutton">조회</a> <a
         href="javascript:doAction('save')" class="IBbutton">저장</a>
   </div>

<div class="title"> 
<header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 등록정보관리 : 사업장등록</header>
</div>

   <div class="left">
  <form id="searchBar" action="javascript:doAction('search');">
				
				사업장 검색  <a href="javascript:findPopup('company');" style= "text-decoration: none;">
				<input type="text" id="company_CODE" placeholder="코드" style="width: 50px;" readonly>
				<input type="text" id="company_NAME" placeholder="회사명" style="width: 130px;" readonly> 
				<img src="${contextPath}/resources/image/icons/icon_plus.png"></a>
				<input type="submit" value="조회" style="background-color: #5E5E5E; color: white;">
		</form>
   
   
   <script>createIBSheet("mySheet", "100%", "100%");</script>
   </div>


	<form name="form" id="form" method="post">
		<div class="right">

			<div id="ib_sheetContents">
				<div class="ib-tab-contents__item" style="background: none;">
					<div id='ib-container1'>
						<table class="tg">
							<tr>
								<th class="tg-lu1x" rowspan="13"><i
									class="fa fa-address-book" aria-hidden="true"></i><br>기<br>본<br>정<br>보</th>
								<th class="tg-au0w" rowspan="13"></th>
								<td class="tg-8thm">사업자등록번호</td>
								<th class="tg-v9i9" rowspan="13"></th>
								<td class="tg-v9i9"><input type="text"
									name="site_RESISTRATION_NUMBER" maxlength="12"
									placeholder="___-__-_____"><input type="hidden"
									name="myRow"></td>
							</tr>
							<tr>
								<td class="tg-8thm">법인 등록번호</td>
								<td class="tg-v9i9"><input type="text"
									name="site_CORPARATION_NUMBER" maxlength="14"
									placeholder="______-_______"></td>
							</tr>
							<tr>
								<td class="tg-8thm">대표자명</td>
								<td class="tg-v9i9"><input type="text"
									name="site_REPRESENTATIVE_NAME"></td>
							</tr>
							<tr>
								<td class="tg-8thm">사업장우편번호</td>
								<td class="tg-v9i9"><input type="text" name="site_ZIP_CODE"
									id="site_ZIP_CODE"style="width: Calc(70% - 25px);"><a
									href="javascript:goPopup();"><img
										src="${contextPath}/resources/image/icons/icon_plus.png"></a></td>
							</tr>
							<tr>
								<td class="tg-8thm">사업장주소</td>
								<td class="tg-v9i9"><input type="text" name="site_ADDRESS"
									id="site_ADDRESS"></td>
							</tr>
							<tr>
								<td class="tg-8thm">사업장번지</td>
								<td class="tg-v9i9"><input type="text"
									name="site_ADDRESS_DETAIL" id="site_ADDRESS_DETAIL"></td>
							</tr>
							<tr>
								<td class="tg-8thm">사업장전화번호</td>
								<td class="tg-v9i9"><input type="text" name="site_CONTACT"
									id="site_CONTACT" placeholder="__-___-____" class="siteNUM"
									maxlength="13"></td>
							</tr>
							<tr>
								<td class="tg-8thm">사업장팩스</td>
								<td class="tg-v9i9"><input type="text" name="site_FAX"
									id="site_FAX" placeholder="__-___-____" class="siteNUM"
									maxlength="13"></td>
							</tr>
							<tr>
								<td class="tg-8thm">업태</td>
								<td class="tg-v9i9"><input type="text" name="site_CATEGORY"></td>
							</tr>
							<tr>
								<td class="tg-8thm">종목</td>
								<td class="tg-v9i9"><input type="text" name="site_TYPE"></td>
							</tr>
							<tr>
								<td class="tg-8thm">개업연월일</td>
								<td class="tg-v9i9"><input type="text" class="Datepicker"
									name="site_OPENBUSINESS_DATE" style="width: Calc(70% - 25px);"></td>
							</tr>
							<tr>
								<td class="tg-8thm">폐업연월일</td>
								<td class="tg-v9i9"><input type="text" class="Datepicker"
									name="site_CLOSEBUSINESS_DATE"  style="width: Calc(70% - 25px);"></td>
							</tr>
							<tr>
								<td class="tg-8thm">본점여부</td>
								<td class="tg-v9i9"><select name=site_BUSINESS_AVAILABLE style="width: 70px;">
										<option value='Y' selected>여</option>
										<option value='N'>부</option></select></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>

	</form>



</body>
</html>