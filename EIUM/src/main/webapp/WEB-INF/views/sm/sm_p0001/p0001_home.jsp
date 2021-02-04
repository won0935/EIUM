<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사등록</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script language="javascript">
	//주민등록번호 FORMAT형식 맞추기!!!
	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.SetWaitImageVisible(0);
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {
			SearchMode : smLazyLoad,
			ToolTip : 1,
			MouseHoverMode : 2,
			sizeMode : 0
		}
		initSheet.HeaderMode = {
			Sort : 1,
			ColMove : 0,
			ColResize : 0,
			HeaderCheck : 1
		};
		initSheet.Cols = [ {
			Header : "상태",
			Type : "Status",
			SaveName : "STATUS",
			MinWidth : 60,
			Align : "Center"
		}, {
			Header : "삭제",
			Type : "DelCheck",
			SaveName : "DEL_CHK",
			MinWidth : 60
		}, {
			Header : "회사코드",
			Type : "Text",
			SaveName : "company_CODE",
			MinWidth : 80,
			KeyField : 1,
			Edit : 0,
			Align : "Center"
		}, {
			Header : "회사명",
			Type : "Text",
			SaveName : "company_NAME",
			MinWidth : 140,
			KeyField : 1,
			Align : "Center"
		}, {
			Header : "구분",
			Type : "Combo",
			SaveName : "company_YN",
			KeyField : 1,
			MinWidth :110,
			Edit : 1,
			ComboText : "0. 법인|1. 개인",
			ComboCode : "0|1",
			Align : "Center"
		}, {
			Header : "사업자 등록번호",
			Type : "Text",
			SaveName : "company_RESISTRATION_NUMBER",
			KeyField : 0,
			Hidden : 1
		}, {
			Header : "법인등록번호",
			Type : "Text",
			SaveName : "company_CORPARATION_NUMBER",
			KeyField : 0,
			Hidden : 1
		}, {
			Header : "대표자성명",
			Type : "Text",
			SaveName : "company_REPRESENTATIVE_NAME",
			KeyField : 0,
			Hidden : 1
		}, {
			Header : "외국인여부",
			Type : "Text",
			SaveName : "company_REPRESENTATIVE_FOREIGN",
			Hidden : 1
		}, {
			Header : "주민등록번호",
			Type : "Text",
			SaveName : "company_REPRESENTATIVE_NUMBER",
			KeyField : 0,
			Hidden : 1
		}, {
			Header : "본점우편번호",
			Type : "Text",
			SaveName : "company_ZIP_CODE",
			Hidden : 1
		}, {
			Header : "본점주소",
			Type : "Text",
			SaveName : "company_ADDRESS",
			KeyField : 0,
			Hidden : 1
		}, {
			Header : "본점번지",
			Type : "Text",
			SaveName : "company_ADDRESS_DETAIL",
			KeyField : 0,
			Hidden : 1
		}, {
			Header : "본점전화번호",
			Type : "Text",
			SaveName : "company_CONTACT",
			Hidden : 1
		}, {
			Header : "본점 FAX",
			Type : "Text",
			SaveName : "company_FAX",
			Hidden : 1
		}, {
			Header : "업체",
			Type : "Text",
			SaveName : "company_CATEGORY",
			KeyField : 0,
			Hidden : 1
		}, {
			Header : "종목",
			Type : "Text",
			SaveName : "company_TYPE",
			KeyField : 0,
			Hidden : 1
		}, {
			Header : "설립연월일",
			Type : "Text",
			SaveName : "company_ESTABLISHED_DATE",
			Hidden : 1
		}, {
			Header : "개업연월일",
			Type : "Text",
			SaveName : "company_OPENBUSINESS_DATE",
			Hidden : 1
		}, {
			Header : "폐업연월일",
			Type : "Text",
			SaveName : "company_CLOSEBUSINESS_DATE",
			Hidden : 1
		}, {
			Header : "사용여부",
			Type : "Text",
			SaveName : "company_BUSINESS_YN",
			KeyField : 0,
			Hidden : 1
		}

		];
		IBS_InitSheet(mySheet, initSheet);

		mySheet.SetEditableColorDiff(1); //편집불가능한 셀 표시 구분
		mySheet.SetSheetHeight(700);
		mySheet.DoSearch("${contextPath}/sm/p0001/searchList.do");

		//달력 API
		$(function() {
			$(".Datepicker")
					.datepicker(
							{
								dateFormat : "yy-mm-dd",
								showOn : "both",
								buttonImage : "${contextPath}/resources/image/icons/icon_calendar.png",
								buttonImageOnly : true,
								dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일',
										'토요일', '일요일' ],
								dayNamesMin : [ '월', '화', '수', '목', '금', '토',
										'일' ],
								monthNamesShort : [ '1', '2', '3', '4', '5',
										'6', '7', '8', '9', '10', '11', '12' ],
								monthNames : [ '1월', '2월', '3월', '4월', '5월',
										'6월', '7월', '8월', '9월', '10월', '11월',
										'12월' ]
							});
		});

	}

	/*Sheet 각종 처리*/
	function doAction(sAction) {
		switch (sAction) {
		case "search": // 조회

			mySheet.DoSearch("${contextPath}/sm/p0001/searchList.do");
			//mySheet.DoSearch("transaction_data2.json");
			break;
		case "reload": //초기화
			//조회 데이터 삭제
			mySheet.RemoveAll();
			$("form").each(function() {  
	            this.reset();
	         });  
			break;
		case "save": //저장
			mySheet.SetCellValue($('input[name=myRow]').val(), 5, nullcheck($(
					'input[name=company_RESISTRATION_NUMBER]').val()));
			mySheet.SetCellValue($('input[name=myRow]').val(), 6, nullcheck($(
					'input[name=company_CORPARATION_NUMBER]').val()));
			mySheet.SetCellValue($('input[name=myRow]').val(), 7, nullcheck($(
					'input[name=company_REPRESENTATIVE_NAME]').val()));
			mySheet.SetCellValue($('input[name=myRow]').val(), 8, $(
					'select[name=company_REPRESENTATIVE_FOREIGN]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(), 9, nullcheck($(
					'input[name=company_REPRESENTATIVE_NUMBER]').val()));
			mySheet.SetCellValue($('input[name=myRow]').val(), 10, nullcheck($(
					'input[name=company_ZIP_CODE]').val()));
			mySheet.SetCellValue($('input[name=myRow]').val(), 11, nullcheck($(
					'input[name=company_ADDRESS]').val()));
			mySheet.SetCellValue($('input[name=myRow]').val(), 12, nullcheck($(
					'input[name=company_ADDRESS_DETAIL]').val()));
			mySheet.SetCellValue($('input[name=myRow]').val(), 13, $(
					'input[name=company_CONTACT]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(), 14, $(
					'input[name=company_FAX]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(), 15, nullcheck($(
					'input[name=company_CATEGORY]').val()));
			mySheet.SetCellValue($('input[name=myRow]').val(), 16, nullcheck($(
					'input[name=company_TYPE]').val()));
			mySheet.SetCellValue($('input[name=myRow]').val(), 17, nullcheck($(
					'input[name=company_ESTABLISHED_DATE]').val()));
			mySheet.SetCellValue($('input[name=myRow]').val(), 18, nullcheck($(
					'input[name=company_OPENBUSINESS_DATE]').val()));
			mySheet.SetCellValue($('input[name=myRow]').val(), 19, $(
					'input[name=company_CLOSEBUSINESS_DATE]').val());
			mySheet.SetCellValue($('input[name=myRow]').val(), 20, nullcheck($(
					'select[name=company_BUSINESS_YN]').val()));

			mySheet.DoSave("${contextPath}/sm/p0001/saveData.do");
			break;
		case "insert": //신규행 추가
			var row = mySheet.DataInsert(-1);
			mySheet.SetCellEditable(mySheet.GetSelectRow(), mySheet.SaveNameCol("company_CODE"), 1);
			break;
		case "excel":
			var param = { Mode : -1 };
			mySheet.Down2Excel(param);
			break;
		}

	}

	//로우 클릭시
	function mySheet_OnClick(Row, Col) {
		if (Row != 0) {
			$('input[name=myRow]').val(Row);
			$('input[name=company_RESISTRATION_NUMBER]').val(
					mySheet.GetCellValue(Row, 5));
			$('input[name=company_CORPARATION_NUMBER]').val(
					mySheet.GetCellValue(Row, 6));
			$('input[name=company_REPRESENTATIVE_NAME]').val(
					mySheet.GetCellValue(Row, 7));
			$('select[name=company_REPRESENTATIVE_FOREIGN]').val(
					mySheet.GetCellValue(Row, 8));
			$('input[name=company_REPRESENTATIVE_NUMBER]').val(
					mySheet.GetCellValue(Row, 9));
			$('input[name=company_ZIP_CODE]')
					.val(mySheet.GetCellValue(Row, 10));
			$('input[name=company_ADDRESS]').val(mySheet.GetCellValue(Row, 11));
			$('input[name=company_ADDRESS_DETAIL]').val(
					mySheet.GetCellValue(Row, 12));
			$('input[name=company_CONTACT]').val(mySheet.GetCellValue(Row, 13));
			$('input[name=company_FAX]').val(mySheet.GetCellValue(Row, 14));
			$('input[name=company_CATEGORY]')
					.val(mySheet.GetCellValue(Row, 15));
			$('input[name=company_TYPE]').val(mySheet.GetCellValue(Row, 16));
			$('input[name=company_ESTABLISHED_DATE]').val(
					mySheet.GetCellValue(Row, 17));
			$('input[name=company_OPENBUSINESS_DATE]').val(
					mySheet.GetCellValue(Row, 18));
			$('input[name=company_CLOSEBUSINESS_DATE]').val(
					mySheet.GetCellValue(Row, 19));
			$('select[name=company_BUSINESS_YN]').val(
					mySheet.GetCellValue(Row, 20));
		}
	}
	// 조회완료 후 처리할 작업
	function mySheet_OnSearchEnd() {

	}

	 function nullcheck(value){
	      if(value==null||value==""){
	         alert("필수 폼이 비어있습니다.");
	         event.stopImmediatePropagation;
	         return false;
	      }else{
	         return value;
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
	//저장할 값들에 대해 validation check할 수 있도록 이벤트 발생
	/* function mySheet_OnValidation(Row, Col, Value){
		if(Col == 2){
			if(Value==""){
				alert("필수 입력 폼이 비어있습니다.");
			}
		}
	} */

	//Formating
	$(document)
			.ready(
					function() {
						//주민등록번호
						$(function() {
							$('input[name=company_REPRESENTATIVE_NUMBER]')
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
						//사업자등록번호
						$(function() {
							$('input[name=company_RESISTRATION_NUMBER]')
									.keydown(
											function(event) {
												var key = event.charCode
														|| event.keyCode || 0;
												$text = $(this);
												if (key !== 8 && key !== 9) {
													if ($text.val().length === 3) {
														$text.val($text.val()
																+ '-');
													}
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
						//법인등록번호
						$(function() {
							$('input[name=company_CORPARATION_NUMBER]')
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

						//전화번호,팩스
						$(function() {
							$('.companyNUM')
									.keydown(
											function(event) {
												var key = event.charCode
														|| event.keyCode || 0;
												$text = $(this);
												if (key !== 8 && key !== 9) {
													if ($text.val()
															.substr(0, 2) == '02') {
														if ($text.val().length === 2) {
															$text.val($text
																	.val()
																	+ '-');
														}
														if ($text.val().length === 7) {
															$text.val($text
																	.val()
																	+ '-');
														}
													} else {
														if ($text.val().length === 3) {
															$text.val($text
																	.val()
																	+ '-');
														}
														if ($text.val().length === 7) {
															$text.val($text
																	.val()
																	+ '-');
														}
													}

												}
												return (key == 8
														|| key == 9
														|| key == 46
														|| (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
											})
						});

					});//document.ready

	//도로명주소검색 API //변경!!!!!!!!!!!!!!!!주의
	function goPopup() {
		var pop = window.open("findAddress.do", "addressPopup",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {

		document.form.company_ZIP_CODE.value = zipNo;
		document.form.company_ADDRESS.value = roadAddrPart1;
		document.form.company_ADDRESS_DETAIL.value = addrDetail;
	}
</script>

<style type="text/css">
.ui-datepicker {
	font-size: 12px;
	width: 160px;
}

.ui-datepicker select.ui-datepicker-month {
	width: 30%;
	font-size: 11px;
}

.ui-datepicker select.ui-datepicker-year {
	width: 40%;
	font-size: 11px;
}

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
	top: 130px;
	left: 60px;
}

.right {
	position: relative;
	top: -572px;
	left: 550px;
	width: 920px;
	height: 700px;
	background: #EBEBEB;
	border-radius: 10px;
}

.innerheader {
	font-size: 14px;
	border-radius: 3px;
	position: relative;
	margin: 20px;
	top: 20px;
	left: 10px;
	background: #333333;
	width: 100px;
	text-align: center;
	color: white;
	padding: 10px;
	0
	px;
	10
	px;
	0
	px;
}

.right .tg input, select {
	height: 22px;
	border-radius: 3px;
	border: none;
	padding-left: 10px;
	width: 80%;
}

.tg img {
	vertical-align: middle;
	padding: 0px 5px 0px 2px;
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
	width: 90%;
	position: relative;
	top: 45px;
	left: 20px;
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

.tg .tg-lu1x {
	font-size: 12px;
	font-family: Verdana, Geneva, sans-serif !important;;
	background-color: #333333;
	color: #ffffff;
	border-color: inherit;
	text-align: center;
	vertical-align: center;
	width: 30px;
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
<body onload="LoadPage()" style="overflow-x: hidden">
	<div class="leftbuttons">
		<a href="javascript:doAction('excel')" class="IBbutton">엑셀</a>
	</div>


	<div class="rightbuttons">
		<a href="javascript:doAction('reload')" class="IBbutton">초기화</a><a
			href="javascript:doAction('search')" class="IBbutton">조회</a> <a
			href="javascript:doAction('insert')" class="IBbutton">추가</a> <a
			href="javascript:doAction('save')" class="IBbutton">저장</a>
	</div>

	<div class="title">
		<header>
			<i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 등록정보관리 :
			회사등록
		</header>
	</div>
	<div class="left">

		<script>
			//IBSheet 객체 생성 (객체 id, 너비, 높이)
			createIBSheet("mySheet", "100%", "100%");
		</script>
	</div>

	<form name="form" id="form" method="post">

		<div class="right">
			<table class="tg">
				<tr>
					<th class="tg-lu1x" rowspan="16"><i class="fa fa-address-book"
						aria-hidden="true"></i><br>기<br>본<br>정<br>보</th>
					<th class="tg-au0w" rowspan="16"></th>
					<td class="tg-8thm">사업자등록번호</td>
					<th class="tg-v9i9" rowspan="16"></th>
					<td class="tg-v9i9"><input type="text"
						name="company_RESISTRATION_NUMBER" maxlength="12"
						placeholder="___-__-_____" required/><input type="hidden"
						name="myRow"></td>
				</tr>
				<tr>
					<td class="tg-8thm">법인 등록번호</td>
					<td class="tg-v9i9"><input type="text"
						name="company_CORPARATION_NUMBER" maxlength="14"
						placeholder="______-_______"></td>
				</tr>
				<tr>
					<td class="tg-8thm">대표자성명</td>
					<td class="tg-v9i9"><input type="text"
						name="company_REPRESENTATIVE_NAME"></td>
				</tr>
				<tr>
					<td class="tg-8thm">외국인여부</td>
					<td class="tg-v9i9"><select
						name=company_REPRESENTATIVE_FOREIGN><option value='N'
								selected>0. 내국인</option>
							<option value='Y'>1. 외국인</option></select></td>
				</tr>
				<tr>
					<td class="tg-8thm">주민등록번호</td>
					<td class="tg-v9i9"><input type="text"
						name="company_REPRESENTATIVE_NUMBER" maxlength="14"
						placeholder="______-_______" style="background: #F8FAE6;"></td>
				</tr>
				<tr>
					<td class="tg-8thm">본점우편번호</td>
					<td class="tg-v9i9"><input type="text" name="company_ZIP_CODE"
						id="company_ZIP_CODE" style="width: 50px;"><a
						href="javascript:goPopup();"><img
							src="${contextPath}/resources/image/icons/icon_plus.png"></a></td>
				</tr>
				<tr>
					<td class="tg-8thm">본점주소</td>
					<td class="tg-v9i9"><input type="text" name="company_ADDRESS"
						id="company_ADDRESS"></td>
				</tr>
				<tr>
					<td class="tg-8thm">본점번지</td>
					<td class="tg-v9i9"><input type="text"
						name="company_ADDRESS_DETAIL" id="company_ADDRESS_DETAIL"></td>
				</tr>
				<tr>
					<td class="tg-8thm">본점전화번호</td>
					<td class="tg-v9i9"><input type="text" name="company_CONTACT"
						id="company_CONTACT" placeholder="__-____-____" class="companyNUM"
						maxlength="12"></td>
				</tr>
				<tr>
					<td class="tg-8thm">본점FAX</td>
					<td class="tg-v9i9"><input type="text" name="company_FAX"
						id="company_FAX" placeholder="__-____-____" class="companyNUM"
						maxlength="12"></td>
				</tr>
				<tr>
					<td class="tg-8thm">업태</td>
					<td class="tg-v9i9"><input type="text" name="company_CATEGORY"></td>
				</tr>
				<tr>
					<td class="tg-8thm">종목</td>
					<td class="tg-v9i9"><input type="text" name="company_TYPE"></td>
				</tr>
				<tr>
					<td class="tg-8thm">설립연월일</td>
					<td class="tg-v9i9"><input type="text" class="Datepicker"
						name="company_ESTABLISHED_DATE"></td>
				</tr>
				<tr>
					<td class="tg-8thm">개업연월일</td>
					<td class="tg-v9i9"><input type="text" class="Datepicker"
						name="company_OPENBUSINESS_DATE"></td>
				</tr>
				<tr>
					<td class="tg-8thm">폐업연월일</td>
					<td class="tg-v9i9"><input type="text" class="Datepicker"
						name="company_CLOSEBUSINESS_DATE"></td>
				</tr>
				<tr>
					<td class="tg-8thm">사용여부</td>
					<td class="tg-v9i9"><select name=company_BUSINESS_YN
						style="width: 100px;"><option value='N' selected>0.
								미사용</option>
							<option value='Y'>1. 사용</option></select></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>