<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>





<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css"> 

/* 배너단 */
.logobox {
	background-color: #212121;
	padding: 10px;  
	padding-bottom: 0px;
}
.logobox .logo {
	width: auto;
	height: 80px;
}

.logobox .sideSearchBar {
	width: 170px;
	vertical-align: middle;
	white-space: nowrap;
	position: relative;
}

.logobox .sideSearchBar input#search {
	width: 170px;
	height: 30px;
	background: #ffffff;
	border: none;
	font-size: 10pt;
	color: #63717f;
	padding-left: 35px;
	border-radius: 5px;
}

.sideSearchBar .icon {
	position: absolute;
	margin-left: -160px;
	margin-top: 3px;
	z-index: 1;
	color: #4f5b66;
}



/* 트리메뉴 */

#sideMenu {
	background-color: #E0E0E0;
	color: white;
	width: 190px;  
	font-size: 15px; 
	
}
#sideMenu .topVoidLevel{
background-color:#2C3E50;
padding-left: 0px;
list-style: none;
}

#sideMenu .topVoidLevel i {
margin-left: 10px;
margin-right: 10px;
margin-top: 5px;
margin-bottom: 5px;
}


#sideMenu .topVoidLevel .menu ul{
padding-left:30px;
background-color:#E0E0E0;
	
}

#sideMenu .topVoidLevel .menu ul li{
padiing-top:2px; 
padding-bottom: 2px;
list-style: none;
}

#sideMenu .topVoidLevel A:link {
	
	color:#212121; 	
	text-decoration: none;
}

#sideMenu .topVoidLevel A:visited {

	color:#212121; 	
	text-decoration: none;
}

#sideMenu .topVoidLevel A:active {

	bacolor: #FF6000;
	text-decoration: none;
}

#sideMenu .topVoidLevel A:hover {

	color: #FF6000;
	text-decoration: none;
}
 
</style>
<meta charset="UTF-8">
<title>사이드 메뉴</title>
</head>
<body>
<script> //메뉴트리
	function CreateTree(tag) { //tag == div
	
		this.data_init = function(data) { //div태크안에다가 만들어주는 메소드
			
			$(tag).append('<ul class="topVoidLevel">')
				for (var i=0; i<data.child.length; i++) {
					if (data.child[i] != null) {			
						$('.topVoidLevel').append('<li class ="menu" class=firstMenu id=firstLevel'+i+'>');
						$('#firstLevel'+i).append('<a><i class="fa fa-minus"></i>'+ data.child[i].name+'</a>');
						$('#firstLevel'+i).append('<ul class="secondLevel">');
						for ( var j=0; j<data.child[i].child.length; j++) {
							if (data.child[i].child[j] != null) {
								$('#firstLevel'+i+'>.secondLevel').append('<li><a href = '+data.child[i].child[j].href+'  id="secondMenu" target ='+data.child[i].child[j].target+'>' +data.child[i].child[j].name+'</a><li/>');
							}
						}
					}
				}
			};
	}

	$(document).ready(function(){
	
	var tree = new CreateTree(document.getElementById('sideMenu'));
	//메뉴객체 생성
	//name : a 태그에 나타나는 내용
	//href : a 태그에 사용될 URL
	//icon : 기본 아이콘 대신할 아이콘 URL
	//child : 자식배열

	//root객체, root객체는 실제로 보이지 않는다
	var data = {
		name : "name",
		href : "A링크",
		target : "target",
		child : []
	};
	//자식개체를 하나 생성
	var childA = {
		name : "등록정보관리",
		href : "",
		target : "",
		child : []
	};
	var childB = {
		name : "기초환경설정",
		href : "",

		target : "",
		child : []
	};
	var childC = {
		name : "인사관리",
		href : "",
		target : "",
		child : []
	};
	var childD = {
		name : "급여관리",
		href : "",
		target : "",
		child : []
	};
	var childE = {
		name : "근태관리",
		href : "",
		target : "",
		child : []
	};
	//자식1를 맨위개체에 붙이기
	data.child.push(childA);
	data.child.push(childB);
	data.child.push(childC);
	data.child.push(childD);
	data.child.push(childE);

	//자식1의 하위개체를 생성
	var childA1 = {
		name : "회사등록",
		href : "http://w3.schools.com",
		target : "_blank",

		child : []
	};
	var childA2 = {
		name : "사업장등록",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childA3 = {
		name : "부서등록",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childA4 = {
		name : "사원등록",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childA5 = {
		name : "사용자권한설정",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	childA.child.push(childA1);
	childA.child.push(childA2);
	childA.child.push(childA3);
	childA.child.push(childA4);
	childA.child.push(childA5);

	var childB1 = {
		name : "호봉테이블등록",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childB2 = {
		name : "지급일등록",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};

	childB.child.push(childB1);
	childB.child.push(childB2);

	var childC1 = {
		name : "인사정보등록",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childC2 = {
		name : "인사기록카드",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childC3 = {
		name : "교육관리",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childC4 = {
		name : "교육평가",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childC5 = {
		name : "인사발령등록",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childC6 = {
		name : "인사발령",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childC7 = {
		name : "인사발령공고",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childC8 = {
		name : "인사발령리포트",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childC9 = {
		name : "사원정보현황",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childC10 = {
		name : "인사고과/상별현황",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childC11 = {
		name : "사원입퇴사현황",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childC12 = {
		name : "책정임금현황",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childC13 = {
		name : "근속년수현황",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childC14 = {
		name : "교육현황",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	childC.child.push(childC1);
	childC.child.push(childC2);
	childC.child.push(childC3);
	childC.child.push(childC4);
	childC.child.push(childC5);
	childC.child.push(childC6);
	childC.child.push(childC7);
	childC.child.push(childC8);
	childC.child.push(childC9);
	childC.child.push(childC10);
	childC.child.push(childC11);
	childC.child.push(childC12);
	childC.child.push(childC13);
	childC.child.push(childC14);

	var childD1 = {
		name : "급여입력및계산",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childD2 = {
		name : "급여대장",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childD3 = {
		name : "급여명세",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childD4 = {
		name : "급상여이체현황",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childD5 = {
		name : "월별지급현황",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childD6 = {
		name : "사원임금통계",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	childD.child.push(childD1);
	childD.child.push(childD2);
	childD.child.push(childD3);
	childD.child.push(childD4);
	childD.child.push(childD5);
	childD.child.push(childD6);

	var childE1 = {
		name : "근태입력",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childE2 = {
		name : "휴가관리",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childE3 = {
		name : "휴가내역",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childE4 = {
		name : "출장관리",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childE5 = {
		name : "출장조회",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};
	var childE6 = {
		name : "출장조회(사원별)",
		href : "http://w3.schools.com",
		target : "_blank",
		child : []
	};

	childE.child.push(childE1);
	childE.child.push(childE2);
	childE.child.push(childE3);
	childE.child.push(childE4);
	childE.child.push(childE5);
	childE.child.push(childE6);

	//트리에 메뉴객체를 연결
	tree.data_init(data);
	//트리메뉴를 화면에 보여준다

	$('.topVoidLevel>.menu>a').click(function() {

		var submenu = $(this).next("ul");
		// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
		if (submenu.is(":visible")) {
			$(this).children("i").attr("class", 'fa fa-plus');
			submenu.slideUp();
		} else {
			$(this).children("i").attr("class", 'fa fa-minus');
			submenu.slideDown();
		}
	});
	
	});
</script>
	<div class="logobox">
		<a href="${contextPath}/main.do"> <img class="logo"
			src="${contextPath}/resources/image/EIUM_banner.png" />
		</a>
		<div class="sideSearchBar">
			<input type="search" id="search" placeholder="찾을 메뉴 입력..." /> <span
				class="icon"><i class="fa fa-search"></i></span>
		</div>
	</div>
	
	<div id="sideMenu"></div>
</body>
</html>