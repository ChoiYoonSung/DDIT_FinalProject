<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrator Page</title>
<tiles:insertAttribute name="style" />
</head>
<body>
<div id="app" class="app app-header-fixed app-without-sidebar">
	<tiles:insertAttribute name="header" />
	
	<tiles:insertAttribute name="body"/>
</div>
<tiles:insertAttribute name="js" />
</body>
</html>