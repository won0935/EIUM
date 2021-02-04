<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <style>
#container {
	width: 100%;
	text-align: left;
}

#header {
	width: calc(100% - 190px);
	height: 30px;
	position: absolute;
	top: 5px;
	left: 190px;
}

#sidebar-left {
	width: 190px;
	height: 100%;
	background-color: #212121;
}

#footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	background: #ccc;
	padding: 0.5px;
	border: 0px solid #bcbcbc;
	color: white;
	background-color: #212121;
}
body {
	overflow-x: hidden;
	overflow-Y: hidden;
}
</style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body topmargin="0"  leftmargin="0" marginwidth="0" marginheight="0">
    <div id="container">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
      <div id="sidebar-left">
          <tiles:insertAttribute name="side"/> 
      </div>
    
      <div id="contents">
          <tiles:insertAttribute name="body"/>
      </div>
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>
  </body>
</html>