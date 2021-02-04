<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='${contextPath}/resources/fullcalendar/core/main.css' rel='stylesheet' />
<link href='${contextPath}/resources/fullcalendar/daygrid/main.css' rel='stylesheet' />
<script src='${contextPath}/resources/fullcalendar/core/main.js'></script>
<script src='${contextPath}/resources/fullcalendar/interaction/main.js'></script>
<script src='${contextPath}/resources/fullcalendar/daygrid/main.js'></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker-standalone.css">




<script>



 //달력
   document.addEventListener('DOMContentLoaded', function() {  
    
	   var locale;
	   if("${pageContext.response.locale.language}"=="cn"){
		   locale="zh-cn"
	   }else{
		   locale="${pageContext.response.locale.language}";
	   }
	   
	  var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [  'dayGrid', 'list' ],
      locale:locale,
      height:400,
      editable: false,
      selectable: false,
      eventLimit: true, 
      events: ${jsonArray}
    });

    calendar.render();
  

  
	// 현재인원 그래프
		Highcharts.chart('circlegraph', {
			chart : {
				plotBackgroundColor : null,
				plotBorderWidth : null,
				plotShadow : false,
				type : 'pie'
			},
			title : {
				text : '현재 인원',
				style : {
					color : '#111820',
					fontFamily : 'san-serif',
					fontWeight : 'bold',
					fontSize : '21px'
				}
			},

			plotOptions : {
				pie : {
					allowPointSelect : true,
					cursor : 'pointer',
					colors : pieColors,
					dataLabels : {
						enabled : false,
					},
					showInLegend : {
						enabled : true
					}

				}

			},
			series : [ {
				name : '인원',
				colorByPoint : true,
				data : [ {
					name : '출근',
					y : 45
				}, {
					name : '휴가',
					y : 5
				}, {
					name : '병가',
					y : 1
				}, {
					name : '출장',
					y : 3
				}, {
					name : '기타',
					y : 4
				}, ]
			}, {
				name : '인원',
				colors : [ '#FFFFFF' ],
				size : '50%',
				center : [ '50%', '50%' ],
				dataLabels : {
					enabled : true,
					style : {
						textOutline : false,
						textShadow : false,
				 		fontWeight : 'bold',
						fontFamily : 'san-serif',
						fontSize : '25px'
					},
					distance : -65,
					format : '{point.y}'
				},
				showInLegend : false,
				data : [ [ '전체', 58 ] ]
			} ]
		});
		
	
   });
	//컬러 fnction
	var pieColors = (function() {
		var colors = [], base = Highcharts.getOptions().colors[0], i;
		for (i = 0; i < 10; i += 1) {
			colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
		}
		return colors;
	}());
	
	//휴가, 출장 탭이동
	function createTab(r,c,v){
		parent.leftMenu_OnClick(r,c,v);
	}
	
	
</script>
<style>
#calendar {
	margin: 20px 0 0 20px;
	max-width: 800px;
	font-size: 10px;
}
.topright {
	width: 700px;
	height: 370px;
	margin:25px;
	margin-left:50px;
	position: relative;
	left: 820px;
	top: -400px;
}
.bottomleft {
	width: 750px;
	height: 390px;
	position: relative;
	left: 10px;
	top: -390px;
}
.bottomright {
	width: 820px;
	height: 360px;
	position: relative;
	left: 780px;
	top: -770px;
}
.notice {
	position: relative;
	top: 0%;
	left: 0%;
	width: 50%;
	height: 100%;
	background: #212121 ;
}
.todo {
	width: 50%;
	height: 100%;
	background: #D4D4D4;
	position: relative;
	top: -100%;
	left: 50%;
}
.vacation {
position: relative;
	top: 0%;
	left: 0%;
	width: 33.3%;
	height: 100%;
	background: #111820 ;  
	
}
.business {
	width: 33.3%;
	height: 100%;
	background: #2C3E50;
	position: relative;
	top: -100%;
	left: 33.3%;

}
.events {
	width: 33.3%;
	height: 100%;
	background: #e9ebed;
	position: relative;
	top: -200%;
	left: 66%;

}
.circlegraph {
	width: 40%;
	height: 100%;
	background: #212121;
}
.squaregraph {
	padding:3%;
	width: 60%;
	height: 100%;
	position: relative;
	top: -100%;
	left: 40%;
}
.squarecontent{
color:white;
margin:5px;
 width: 100px;
 height:100px;
 background: #111820;
 float: left;
}
.squarecontent:hover{
 background: #233140;
}
.squarecontent .teamname{
position:relative;
top:5%;
left:5%;
font-size: 15px;
}
 .plusbutton, .goModal{
position:absolute;
top:2%;
right:10%;
font-size: 30px;
font-weight: bold;
z-index:100;
text-decoration: none;
}

 .notice .plusbutton,.vacation .plusbutton,.business .plusbutton,.notice .goModal,.vacation .goModal,.business .goModal  {
color: white;
}
.todo .plusbutton,.events .plusbutton,.todo .goModal,.events .goModal{
color: #212121;
}
 .plusbutton:hover,.goModal:hover{
color: #4A4949;
text-decoration: none;
}
.squarecontent .number{
position:relative;
top:30%;
left:20%;
font-size: 25px;
font-weight:bold; 
}
.divboard{
width: 90%;
margin: 10% 5% 5% 5%;
height:80%;
display: block;
overflow-y: auto;
}
.boardtable{
width: 100%;
font-size: 13px;
}
.boardtitle{
position:relative;
top:5%;
left:10%;
width:80%;
font-size: 20px;
font-weight: bold;
border-bottom: 2px solid;
}
.boardtable td{
padding-top: 5px;
}
.boardtable tr:hover{
color: #4A4949;
cursor:pointer;
}
.boardtable td:last-child,.boardtable td:nth-child(2) {
	text-align: right;
	font-size:10px;
}
body ::-webkit-scrollbar {width: 12px; height: 12px;  }
body ::-webkit-scrollbar-button:start:decrement, 
body ::-webkit-scrollbar-button:end:increment {display: block; width: 12px;height: 12px; background: url() rgba(0,0,0,.05);}
body ::-webkit-scrollbar-track {     background: rgba(0,0,0,.05); }
body ::-webkit-scrollbar-thumb {  background: rgba(0,0,0,.1);  }

</style>
</head>
<body >


 	 <jsp:include page="cm_main_p01.jsp" /> 
	<div id='calendar' class="calendar"></div>

	<div id='topright' class="topright">
		<div id='vacation' class="vacation" style="color: white;">
		    <c:forEach items="${sessionScope.menu_code}" begin="0" end="35" step="1" var="menu_code" varStatus="status">
		       <c:if test="${menu_code eq 'M029'}">
		       <a class="plusbutton" href="javascript:createTab(${status.count + 5}, 0,'<spring:message code="lo_VacationManagement"  text="휴가관리"/>');">+</a>
		       </c:if>
		    </c:forEach>  
			<div class="boardtitle" style="border-bottom-color: white;"><spring:message code="lo_vacation"  text="휴가"/></div>
			<div class="divboard">  
  
				<table class="boardtable" id="vacationtable">
					<c:forEach var="vacation" items="${vacationList}">

						<tr id="${vacation.vacation_CODE}">
							<td>${vacation.empNAME}</td>
							<td>${vacation.vacation_TYPE}</td>
							<td>${vacation.vacation_START_DATE}<c:if
									test="${!empty vacation.vacation_END_DATE}">
									<br>${vacation.vacation_END_DATE}
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>

			</div>


		</div>
		<div id='business' class="business" style="color: white;">
		    <c:forEach items="${sessionScope.menu_code}" begin="0" end="35" step="1" var="menu_code" varStatus="status">
		       <c:if test="${menu_code eq 'M031'}">
		       <a class="plusbutton" href="javascript:createTab(${status.count + 5}, 0,'<spring:message code="lo_TravelManagement"  text="출장관리"/>');">+</a>
		       </c:if>
		    </c:forEach>
			<div class="boardtitle" style="border-bottom-color: white;"><spring:message code="lo_business"  text="출장"/></div>
			<div class="divboard">
				<table class="boardtable" id="noticetable">
					<c:forEach var="business" items="${businessList}">

						<tr id="${business.business_TRIP_CODE}">
							<td>${business.empNAME}</td>
							<td>${business.purpose}</td>
							<td>${business.start_DATE}<c:if
									test="${!empty business.end_DATE}">
									<br>${business.end_DATE}
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>

			</div>


		</div>
		<div id='events' class="events" style="color: #111820;">
		 	<c:forEach items="${sessionScope.menu_code}" begin="0" end="35" step="1" var="menu_code" varStatus="status">
		      <c:if test="${menu_code eq 'M031'}">
		       <a class="goModal" href=""id="hrefevent">+</a>
		       </c:if>
		    </c:forEach>
				
			<div class="boardtitle" style="border-bottom-color: #111820;"><spring:message code="lo_event"  text="경조사"/></div>
			<div class="divboard">
				<table class="boardtable" id="eventtable">

					<c:forEach var="board" items="${boardList}">
						<c:if test="${board.board_DES == 'EVENT'}">
							<tr id="${board.board_CODE}">
								<td>${board.board_TITLE}
								<input type="hidden" value="${board.board_CONTENT}" class="board_CONTENT">
								<input type="hidden" value="${board.id}" class="id">
								<input type="hidden" value="${board.board_DES}" class="board_DES">
								<input type="hidden" value="${board.board_DES_DES}" class="board_DES_DES">
								<input type="hidden" value="${board.board_TITLE}" class="board_TITLE">
								<input type="hidden" value="${board.board_END_DATE}" class="board_END_DATE">
								<input type="hidden" value="${board.empNAME}" class="empNAME">
								</td>
								<td>${board.board_START_DATE}
								<c:if test="${!empty board.board_END_DATE}">
									<br>${board.board_END_DATE}
								</c:if>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>

			</div>
			
		</div>
	</div>
	<div id='bottomleft' class="bottomleft">
		<div id='notice' class="notice" style="color: white;">
		<c:forEach items="${sessionScope.menu_code}" begin="0" end="35" step="1" var="menu_code" varStatus="status">
		      <c:if test="${menu_code eq 'M031'}">
		      <a class="goModal" href="" id="hrefnotice">+</a>
		       </c:if>
		    </c:forEach>
				
			
			<div class="boardtitle" style="border-bottom-color: white;">Notice</div>
			<div class="divboard">
				<table class="boardtable" id="noticetable">
				
					<c:forEach var="board" items="${boardList}">
						<c:if test="${board.board_DES == 'NOTICE'}">
							<tr id="${board.board_CODE}">
								<td>${board.board_TITLE}
								<input type="hidden" value="${board.board_CONTENT}" class="board_CONTENT">
								<input type="hidden" value="${board.id}" class="id">
								<input type="hidden" value="${board.board_DES}" class="board_DES">
								<input type="hidden" value="${board.board_DES_DES}" class="board_DES_DES">
								<input type="hidden" value="${board.board_TITLE}" class="board_TITLE">
								<input type="hidden" value="${board.board_END_DATE}" class="board_END_DATE">
								<input type="hidden" value="${board.empNAME}" class="empNAME">
								</td>
								<td>${board.board_START_DATE}
								<c:if test="${!empty board.board_END_DATE}">
									<br>${board.board_END_DATE}
								</c:if>
								</td>
							</tr>
						</c:if>
					</c:forEach>

				</table>

			</div>



		</div>
		<div id='todo' class="todo" style="color: #212121;">
			<a class="goModal" href="" id="hreftodo">+</a>
			<div class="boardtitle" style="border-bottom-color: #212121;">To
				Do</div>

			<div class="divboard">
				<table class="boardtable" id="todotable">

						<c:forEach var="board" items="${boardList}">
						<c:if test="${board.board_DES == 'TODO'}">
							<tr id="${board.board_CODE}">
								<td>${board.board_TITLE}
								<input type="hidden" value="${board.board_CONTENT}" class="board_CONTENT">
								<input type="hidden" value="${board.id}" class="id">
								<input type="hidden" value="${board.board_DES}" class="board_DES">
								<input type="hidden" value="${board.board_DES_DES}" class="board_DES_DES">
								<input type="hidden" value="${board.board_TITLE}" class="board_TITLE">
								<input type="hidden" value="${board.board_END_DATE}" class="board_END_DATE">
								<input type="hidden" value="${board.empNAME}" class="empNAME">
								</td>
								<td>${board.board_START_DATE}
								<c:if test="${!empty board.board_END_DATE}">
									<br>${board.board_END_DATE}
								</c:if>
								</td>
							</tr>
						</c:if>
					</c:forEach>

				</table>

			</div>

		</div>
	</div>

	<div id='bottomright' class="bottomright">
		<div id='circlegraph' class="circlegraph">

		</div>
		<div id='squaregraph' class="squaregraph">

			<div id='squarecontent' class="squarecontent">
				<span class="teamname">인사<br>
				 </span>
				<span class="number">4/5
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">재무<br>
				 </span>
				<span class="number">12/13
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">영업<br>
				 </span>
				<span class="number">20/23
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">마케팅<br>
				 </span>
				<span class="number">5/6
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">총무<br>
				 </span>
				<span class="number">3/3
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">제조<br>
				 </span>
				<span class="number">46/51
				 </span>
			</div>
			<div id='squarecontent' class="squarecontent">
				<span class="teamname">기타<br>
				 </span>
				<span class="number">3/3
				 </span>
			</div>
			

		</div>
		 
		 	 
	</div>
	
</body>
</html>
