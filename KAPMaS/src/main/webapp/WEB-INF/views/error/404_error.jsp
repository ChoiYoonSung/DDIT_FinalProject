<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>Error Page</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	
	<!-- ================== BEGIN core-css ================== -->
	<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/css/vendor.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/css/default/app.min.css" rel="stylesheet" />
	<!-- ================== END core-css ================== -->
</head>
<body class='pace-top' style="background-color: #f0f4f7;">
	<!-- BEGIN page-cover -->
	<div class="app-cover"></div>
	<!-- END page-cover -->
	
	<!-- BEGIN #loader -->
	<div id="loader" class="app-loader">
		<span class="spinner"></span>
	</div>
	<!-- END #loader -->

	<!-- BEGIN #app -->
	<div id="app" class="app">
		<!-- BEGIN error -->
		<div class="error">
			<div class="error-code">404</div>
			<div class="error-content">
				<div class="error-message">페이지를 찾을 수 없습니다. 관리자에게 문의하세요.</div>
				<div>
					<a href="javascript:history.go(-1);" class="btn btn-success px-3">돌아가기</a>
				</div>
			</div>
		</div>
		<!-- END error -->
		
		<!-- BEGIN scroll-top-btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top" data-toggle="scroll-to-top"><i class="fa fa-angle-up"></i></a>
		<!-- END scroll-top-btn -->
	</div>
	<!-- END #app -->
	
	<!-- ================== BEGIN core-js ================== -->
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/vendor.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/app.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/theme/transparent.min.js"></script>
	<!-- ================== END core-js ================== -->
</body>
</html>