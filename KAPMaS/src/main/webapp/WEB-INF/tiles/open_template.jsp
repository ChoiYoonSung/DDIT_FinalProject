<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<tiles:insertAttribute name="style" />
<style type="text/css">
.app-content{
margin : 0px;
}
.pace{
	visibility: hidden;
}
</style>
<tiles:insertAttribute name="js"  ignore="true"/>
</head>
<body>

<tiles:insertAttribute name="body" ignore="true"/>

</body>
</html>