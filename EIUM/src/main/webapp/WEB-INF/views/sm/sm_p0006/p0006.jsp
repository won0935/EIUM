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
<script type="text/javascript">
	var pageheightoffset = 200; //시트높이 계산용

	//sheet 기본설정
	function LoadPage() {
		mySheet.SetWaitImageVisible(0);
		mySheet2.SetWaitImageVisible(0);

		mySheet.RemoveAll();
		mySheet2.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {
			SearchMode : smLazyLoad,
			ToolTip : 1,
			MouseHoverMode : 2
		};
		initSheet.HeaderMode = {
			Sort : 1,
			ColMove : 0,
			ColResize : 0,
			HeaderCheck : 1
		};
		initSheet.Cols = [ 
			{"Header" : "ID","SaveName" : "employee_ID","Type" : "Text","Width" : 170,"Align" : "Center","UpdateEdit":0}, 
			{"Header" : "사원명","SaveName" : "employee_NAME","Type" : "Text","Width" : 200,"Align" : "Center","UpdateEdit":0},
        	{ "Header" : "부서명", "SaveName" : "department_NAME", "Type" : "Text", "Width" : 200, "Align" : "Center","UpdateEdit":0 },
        	{ "Header" : "직급명", "SaveName" : "position_NAME", "Type" : "Text", "Width" : 200, "Align" : "Center","UpdateEdit":0 }
        ];

		var initSheet2 = {};
		initSheet2.Cfg = {
			SearchMode : smLazyLoad,
			ToolTip : 1
		};
		initSheet2.HeaderMode = {
			Sort : 1,
			ColMove : 0,
			ColResize : 0,
			HeaderCheck : 1
		};
		initSheet2.Cols = [ {
			"Header" : "상태",
			"SaveName" : "sStatus",
			"Type" : "Status",
			"Align" : "Center",
			"Width" : 60,
			"ColMerge" : 0
		}, {
			"Header" : "권한코드",
			"SaveName" : "authority_CODE",
			"Type" : "Text",
			"Width" : 100,
			"Align" : "Center",
			"UpdateEdit" : 0,
			"Hidden" : 1
		}, {
			"Header" : "권한명",
			"SaveName" : "authority_NAME",
			"Type" : "Text",
			"Width" : 300,
			"Align" : "Center",
			"UpdateEdit" : 0
		}, {
			"Header" : "권한부여",
			"SaveName" : "authority_GRANT",
			"Type" : "Radio",
			"Width" : 250,
			"Align" : "Center"
		} ];
		IBS_InitSheet(mySheet, initSheet);
		IBS_InitSheet(mySheet2, initSheet2);
		mySheet.SetEditableColorDiff(1);
		mySheet2.SetEditableColorDiff(1);
		mySheet.SetActionMenu("엑셀 파일 저장");
		mySheet.SetSelectionMode(1);
	}

	function mySheet_OnClick(Row) {
		x = "x=" + mySheet.GetCellValue(Row, 0);
		mySheet2.DoSearch("${contextPath}/sm/p0006_01/search.do", x);
	}

	function doAction(sAction) {
		switch (sAction) {
		case "search":
			var param = FormQueryStringEnc(document.frm);
		    mySheet.DoSearch("${contextPath}/sm/p0006/searchList.do", param);
		    mySheet2.RemoveAll();
			break;
		case "reset":
			mySheet.RemoveAll();
			mySheet2.RemoveAll();
			$("select#SiteList option[name='1']").remove();
			$("select#DeptList option[class='1']").remove();
			$('#SiteList').val(selectSite());
			$('#Employee_Select').val('');
			$('#p_text').val('');
			$('#p_text').attr('placeholder', "내용을 입력해주세요.");
			break;
		case "save":
			mySheet2.DoSave("${contextPath}/sm/p0006_01/saveData.do", x);
			mySheet2.RemoveAll();
			break;
	    case "down":
	    	mySheet.Down2ExcelBuffer(true);  
	    	var param = { Mode : -1 };
	    	mySheet.Down2Excel(param); 
	        mySheet2.Down2Excel(param);
	        mySheet.Down2ExcelBuffer(false); 
	        break;

		}

	}

</script>


<script>
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

							$('#SiteList').append(option);

						}

					},

					error : function(jqxhr, status, error) {

						alert("에러");

					}

				});

	};

	function selectDept() {

		var SiteList = $('#SiteList').val();

		$
				.ajax({

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
	
	function mySheet_OnSaveEnd(code, msg) {
		if (msg != "") {
			alert(msg);
			//번호 다시 매기기
			//mySheet.ReNumberSeq();
		}
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

.searchBarTitle {

	margin-left: 110px;
	background: #5E5E5E;
    padding: 5px 5px;
    color: white;
    border-radius: 5px;
    margin-right: 10px;
    vertical-align: middle;
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
#searchBar input, select {
	height: 24px;
	border-radius: 3px;
	border: none;
	padding-left: 5px;
	vertical-align: middle;
	text-align: center;
	width: 120px;
}
.left {
	position: relative;
	top: 130px;
	left: 60px;
	width: 800px;
}
.right{
 position: relative;
width: 1350px;
top: -570px;
left: 450px; 
padding: 0 0 0 30px;
border-left: 2px solid #C3C3C3;
margin-left: 15px;
}
	
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
		<button type="button" onclick="doAction('save')" class="IBbutton">저장</button>
		</div>

		<div class="title"> 
        <header> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> 등록정보관리 : 계정별권한설정</header>
        </div>
        
        <div class="left">
        <div id="searchBar">
            <span class="searchBarTitle">사업장</span> <select id="SiteList"  onchange="selectDept()">
			<option value="" selected>전체</option>
		</select>
		<span class="searchBarTitle">부서</span><select id="DeptList">
			<option value="" selected>전체</option>
		</select>
		<span class="searchBarTitle" >조회조건</span><select id="Employee_Select" style="width: 70px;">
		    <option value="" selected>구분</option>
			<option value="employee_name">사원명</option>
			<option value="employee_code">사원코드</option>
		</select>
		<input type="text" id="p_text" placeholder="내용을 입력해주세요." style="width: 200px;text-align: left;">
        </div>
		</div>

		<div style="position: absolute; top: 230px; left: 70px;width: 1500px;">
			<script type="text/javascript">
				createIBSheet("mySheet", "1500px", "620px");
				selectSite();
				selectDept();
			</script>
		</div>

		<div class="right" style="position: absolute; top: 230px; left: 855px;width: 1500px;">
			<script>
				createIBSheet("mySheet2", "1500px", "620px");
			</script>
		</div>

	</form>
</body>