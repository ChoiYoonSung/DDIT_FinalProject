<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.app-sidebar {
		padding-top: 0px;
	}
	
	#sidebar {
		position: absolute;
	}
	
	#listTable {
		height: 460px;
	}
	
	.app-content {
		padding: 20px 10px 10px 10px;
		margin-left: 220px;
	}
	
	.row {
		margin: 0px;
	}
</style>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="app-content">
		<iframe class="content-wrapper" name="ifr" src="<%=request.getContextPath()%>/cop/detail/main/${copInfo.copCode}" frameborder="0" style="width: 100%; height: 95vh;"></iframe>
	</div>
</body>
</html>