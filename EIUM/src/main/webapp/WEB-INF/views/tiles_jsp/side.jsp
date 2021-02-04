<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>side</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${contextPath}/resources/sheet/ibleaders.js"></script>
<script src="${contextPath}/resources/sheet/ibsheetinfo.js"></script>
<script src="${contextPath}/resources/sheet/ibsheet.js"></script>
<link href="${contextPath}/resources/tab/css/ibtab-style.css"rel="stylesheet">
<script src="${contextPath}/resources/tab/js/ibtab.js"type="text/javascript"></script>
<script src="${contextPath}/resources/tab/js/ibtabinfo.js"type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
/* 배너단 */
.logobox {
	background-color: #212121;
	height: 140px;
	padding: 10px 0px 10px 10px;
}
.logobox .logo {
	width: auto;
	height: 80px;
}
.logobox .sideSearchBar {
	width: 170px;
	position: relative;
	bottom:-10px;
}

/* 트리메뉴 */
#sidexx {
	width: 190px;
	height: 100%;
	background-color: #212121;
}

</style>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/locale.jsp" /> 
<script> //메뉴트리
var data = {Data:[
	<c:if test="${authority_code eq 'A000'}" >
	{menuCode:"m000",Level:0,FontColor:"white", BackColor:"#2C3E50",TITLE:lo_RegistrationInformationManagement},
	</c:if>
	<c:if test="${authority_code eq 'A001'}" >
	{menuCode:"m000",Level:0,FontColor:"white", BackColor:"#2C3E50",TITLE:lo_RegistrationInformationManagement},
	</c:if>
	
	<c:forEach items="${sessionScope.menu_code}" begin="0" end="35" step="1" var="menu_code" varStatus="status">
	<c:if test="${menu_code eq 'M001'}">
	{menuCode:"M001",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"sm/p0001/searchInit.do",TITLE:lo_Companyregistration},
	</c:if>
	<c:if test="${menu_code eq 'M002'}">
	{menuCode:"M002",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"sm/p0002/searchInit.do", TITLE:lo_Siteregistration},
	</c:if>
	<c:if test="${menu_code eq 'M003'}">
	{menuCode:"M003",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"sm/p0003/searchInit.do", TITLE:lo_Departmentregistration},
	</c:if>
	<c:if test="${menu_code eq 'M004'}">
	{menuCode:"M004",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"sm/p0004/searchInit.do", TITLE:lo_Employeeregistration},
	</c:if>
	<c:if test="${menu_code eq 'M005'}">
	{menuCode:"M005",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"sm/p0005/searchInit.do", TITLE:lo_Authoritymanagement},
	</c:if>
	<c:if test="${menu_code eq 'M006'}">
	{menuCode:"M006",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"sm/p0006/searchInit.do", TITLE:lo_Setpermissionsbyaccount},
	</c:if>
	</c:forEach>
	
	<c:if test="${authority_code eq 'A000'}" >
	{menuCode:"m06",Level:0,FontColor:"white", BackColor:"#2C3E50",TITLE:lo_Environmentsetting},
	</c:if>
	<c:if test="${authority_code eq 'A001'}" >
	{menuCode:"m06",Level:0,FontColor:"white", BackColor:"#2C3E50",TITLE:lo_Environmentsetting},
	</c:if>
	
	<c:forEach items="${sessionScope.menu_code}" begin="0" end="35" step="1" var="menu_code" varStatus="status">
	<c:if test="${menu_code eq 'M007'}">
	{menuCode:"M007",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0001/searchInit.do", TITLE:lo_PayrollTableRegistration},
	</c:if>
	<c:if test="${menu_code eq 'M008'}">
	{menuCode:"M008",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0002/searchInit.do", TITLE:lo_Paymentdateregistration},
	</c:if>
	<c:if test="${menu_code eq 'M009'}">
	{menuCode:"M009",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0003/searchInit.do", TITLE:lo_PersonnelBasicCodeRegistration},
	</c:if>
	</c:forEach>
	
	{menuCode:"m10",Level:0,FontColor:"white", BackColor:"#2C3E50",TITLE:lo_HRmanagement},
	
	<c:forEach items="${sessionScope.menu_code}" begin="0" end="35" step="1" var="menu_code" varStatus="status">
	<c:if test="${menu_code eq 'M010'}">
	{menuCode:"M010",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0004/searchInit.do", TITLE:lo_PersonnelInformationRegistration},
	</c:if>
	<c:if test="${menu_code eq 'M011'}">
	{menuCode:"M011",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0007/searchInit.do", TITLE:lo_PersonnelRecordCard},
	</c:if>
	<c:if test="${menu_code eq 'M012'}">
	{menuCode:"M012",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0018/searchInit.do", TITLE:lo_EducationManagement},
	</c:if>
	<c:if test="${menu_code eq 'M013'}">
	{menuCode:"M013",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0021/searchInit.do", TITLE:lo_EducationalEvaluation},
	</c:if>
	<c:if test="${menu_code eq 'M014'}">
	{menuCode:"M014",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0022/searchInit.do", TITLE:lo_Personnelappointment},
	</c:if>
	<c:if test="${menu_code eq 'M015'}">
	{menuCode:"M015",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0023/searchInit.do", TITLE:lo_Personnelappointmentinquiry},
	</c:if>
	<c:if test="${menu_code eq 'M016'}">
	{menuCode:"M016",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0029/searchInit.do", TITLE:lo_EmployeeInformation},
	</c:if>
	<c:if test="${menu_code eq 'M017'}">
	{menuCode:"M017",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0033/searchInit.do", TITLE:lo_HRnRewards},
	</c:if>
	<c:if test="${menu_code eq 'M018'}">
	{menuCode:"M018",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0036/searchInit.do", TITLE:lo_EmployeeLeavingStatus},
	</c:if>
	<c:if test="${menu_code eq 'M019'}">
	{menuCode:"M019",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0035/searchInit.do", TITLE:lo_Pricingwage},
	</c:if>
	<c:if test="${menu_code eq 'M020'}">
	{menuCode:"M020",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0039/searchInit.do", TITLE:lo_YearsofService},
	</c:if>
	<c:if test="${menu_code eq 'M021'}">
	{menuCode:"M021",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"hm/p0040/searchInit.do", TITLE:lo_EducationStatus},
	</c:if>
	</c:forEach>
	
	{menuCode:"m25",Level:0,FontColor:"white", BackColor:"#2C3E50",TITLE:lo_Payrollmanagement},
	
	<c:forEach items="${sessionScope.menu_code}" begin="0" end="35" step="1" var="menu_code" varStatus="status">
	<c:if test="${menu_code eq 'M022'}">
	{menuCode:"M022",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"pm/p0001/searchInit.do", TITLE:lo_Salaryinputandcalculation},
	</c:if>
	<c:if test="${menu_code eq 'M023'}">
	{menuCode:"M023",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"pm/p0002/searchInit.do", TITLE:lo_Payroll},
	</c:if>
	<c:if test="${menu_code eq 'M024'}">
	{menuCode:"M024",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"pm/p0003/searchInit.do", TITLE:lo_Salaryspecification},
	</c:if>
	<c:if test="${menu_code eq 'M025'}">
	{menuCode:"M025",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"pm/p0004/searchInit.do", TITLE:lo_TransferStatus},
	</c:if>
	<c:if test="${menu_code eq 'M026'}">
	{menuCode:"M026",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"pm/p0009/searchInit.do", TITLE:lo_MonthlyPaymentStatus},
	</c:if>
	<c:if test="${menu_code eq 'M027'}">
	{menuCode:"M027",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"pm/p0010/searchInit.do", TITLE:lo_EmployeeWageStatistics},
	</c:if>
	</c:forEach>
	
	{menuCode:"m32",Level:0,FontColor:"white", BackColor:"#2C3E50",TITLE:lo_TnAManagement},
	
	<c:forEach items="${sessionScope.menu_code}" begin="0" end="35" step="1" var="menu_code" varStatus="status">
	<c:if test="${menu_code eq 'M028'}">
	{menuCode:"M028",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"wm/p0001/searchInit.do", TITLE:lo_TnAinput},
	</c:if>
	<c:if test="${menu_code eq 'M029'}">
	{menuCode:"M029",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"wm/p0002/searchInit.do", TITLE:lo_VacationManagement},
	</c:if>
	<c:if test="${menu_code eq 'M030'}">
	{menuCode:"M030",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"wm/p0003/searchInit.do", TITLE:lo_VacationHistory},
	</c:if>
	<c:if test="${menu_code eq 'M031'}">
	{menuCode:"M031",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"wm/p0004/searchInit.do", TITLE:lo_TravelManagement},
	</c:if>
	<c:if test="${menu_code eq 'M032'}">
	{menuCode:"M032",Level:1,FontColor:"#212121", BackColor:"#E0E0E0",URL:"wm/p0005/searchInit.do", TITLE:lo_Businesstripinquiry}
	</c:if>
	</c:forEach>
	]};
$(document).ready(function(){	
		
	var sheetHeight = $(window).height();	//높이 자동계산
	createIBSheet2(document.getElementById("sideMenu"),"leftMenu","100%",(sheetHeight-155)+"px");
	leftMenu.CustomScroll =3;	//스크롤 모양
	leftMenu.SetTheme("LGY2","LightGray2");
	leftMenu.NoTreeLines = 1; //트리모양
	var ibdata = {};
	ibdata.Cfg = {SizeMode:"sizeAdvancedAuto",DataRowHeight:30, MouseHoverMode:2,DragMode:-1};
	ibdata.HeaderMode = {};
	ibdata.Cols = [
		{Header:"타이틀",Type:"Text",SaveName:"TITLE", Width:100,TreeCol:1,Edit:0 }, //효과적용X
		{Header:"URL",Type:"Text",SaveName:"URL",Hidden:1},	//컬럼숨김
		{Header:"menuCode",Type:"Text",SaveName:"menuCode",Hidden:1}	//컬럼숨김
	];  
	IBS_InitSheet(leftMenu,ibdata); //초기화
	
	leftMenu.SetExtendLastCol(1);	//마지막 컬럼 늘임여부
	leftMenu.SetRowHidden(0,1); //(로우,히든여부)
	leftMenu.SetWaitImageVisible(0); //로딩이미지
	leftMenu.SetFocusAfterProcess(0); //조회 후 포커스를두지않음
	
	leftMenu.LoadSearchData(data); //시작
	
	//tab 객체 생성
		createIBTab(document.getElementById("tabBar"),document.getElementById("tabContents"),"tabMenu",
		{
			widthTabBar: "100%",
			heightTabBar:"45px",
			heightContents:"100%",
			
			 themes: {
			  tabs: "material_black",
			  contents: "",
			  contextMenu: "material_black"
			}
    });
    
    	tabMenu.setOptions({
    		
    		tabs : [{
					type : "tab", //탭 유형 설정
					title : "Home",  //탭 제목 설정
					hold : true,
					style : {
						btnClose:false,
						icon: {
							type: "none"  // 탭 아이콘 유형 설정
						}
					}
				}],
				contents:[{
					type:"iframe",	
					contents:"cm/main.do"
				}],
				customZone:{
					width:"0px"
				}
			});
    	
    	
    	
    	 
    	
});
 function leftMenu_OnClick(r,c,v){
	 if(leftMenu.IsHaveChild(r)){	//트리 펼침여부
		leftMenu.SetRowExpanded(r  ,  !(leftMenu.GetRowExpanded(r)));
	} 
	
	//이미 열린 텝인지 확인
	var obj = tabMenu.findTabId(leftMenu.GetCellValue(r,"menuCode"));
	//없으면 undefined가 리턴됨.
	if(obj){
		tabMenu.goToTab(obj.getIndex());
		return;
	}
	//전체 열린 텝의 개수가 15개 이상이면 경고 발생
	if(tabMenu.tabs.getCountTab()>15){
		if(confirm(lo_manytabs)){
			tabMenu.removeTab(1);		
		}
	}
	
	
	if(leftMenu.GetCellValue(r,"URL")!=""){
			//텝 추가
			tabMenu.addTab({
			  tabs: {
			    title: v,
			    focus: true,
			    id:leftMenu.GetCellValue(r,"menuCode"),
			    style : {
						btnClose:true
					}
			  },
			  contents: {
			    type:"iframe",	
				contents:leftMenu.GetCellValue(r,"URL")
			  }
			});
	}
}
 function leftMenu_OnSearchEnd(code,msg){
	 var menulist=activeSearch();
	 $("#searchInput").autocomplete({source: menulist});
 }

 function activeSearch(){
	 var menulist=[];
	 for(var i =0; i<leftMenu.GetDataLastRow();i++){	 
			 menulist.push(leftMenu.GetCellValue(i,0));
	 } 
	return menulist;	  
 }
 function submitMenu(){
	 for(var i =0; i<leftMenu.GetDataLastRow();i++){
		 if($("#searchInput").val()==leftMenu.GetCellValue(i,0)){
			 leftMenu_OnClick(i,0,$("#searchInput").val());
		 }
		 
 } 
 }
 
 
 
</script>
</head>
<body>
 
	<div id="sidexx">
		<div class="logobox">
			<a href="${contextPath}/main.do"> <img class="logo"
				src="${contextPath}/resources/image/EIUM_banner.png" /></a>

			<form class="sideSearchBar" action="javascript:submitMenu();">		
				<div class="input-group mb-3 input-group-sm">
					<input type="search" placeholder=<spring:message code="lo_searchmenu" />
						aria-describedby="button-addon5" id="searchInput"class="form-control">
					<div class="input-group-append">
						<button id="button-addon5" type="submit" class="btn btn-secondary">
							<i class="fa fa-search"></i>  
						</button>
					</div>
				</div>
			</form >

		</div>
		<div id="sideMenu"></div>
		
	</div>

</body>
</html>