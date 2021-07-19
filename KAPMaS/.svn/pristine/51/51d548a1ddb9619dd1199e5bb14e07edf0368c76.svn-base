<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>KAPMaS | sign in</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	
	<!-- ================== BEGIN core-css ================== -->
	<link href="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/css/vendor.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/css/transparent/app.min.css" rel="stylesheet" />
	<!-- ================== END core-css ================== -->
</head>
<body class='pace-top'>
	<!-- BEGIN page-cover -->
	<!-- END page-cover -->
	
	<!-- BEGIN #loader -->
	<div id="loader" class="app-loader">
		<span class="spinner"></span>
	</div>
	<!-- END #loader -->


	<!-- BEGIN #app -->
	<div id="app" class="app">
		<!-- BEGIN login -->
		<div class="login login-v1">
			<!-- BEGIN login-container -->
			<div class="login-container">
				<!-- BEGIN login-header -->
				<div class="login-header">
					<div class="brand">
						<div class="d-flex align-items-center">
							<img src="<%=request.getContextPath() %>/resources/images/logo-remove.png" alt="" style="width: 300px">
						</div>
					</div>
					<div class="icon">
						<i class="fa fa-lock"></i>
					</div>
				</div>
				<!-- END login-header -->
				
				<!-- BEGIN login-body -->
				<div class="login-body">
					<!-- BEGIN login-content -->
					<div class="login-content fs-13px">
						<form action="<%=request.getContextPath() %>/emp/find.do" method="post">
							
							<div class="form-floating mb-20px">
								<input type="id" class="form-control fs-13px h-45px" name="empId" id="empId" placeholder="ID" />
								<label for="empId" class="d-flex align-items-center py-0">ID|</label>
							</div>
							<div class="form-floating mb-20px">
								<input type="email" class="form-control fs-13px h-45px" name="empEmail" id="empEmail" placeholder="Email" />
								<label for="empEmail" class="d-flex align-items-center py-0">E-mail|</label>
							</div>
							
							<div class="login-buttons" style="float: left;">
								<button type="submit" class="btn h-45px btn-yellow d-block w-80 btn-lg"  style="float: left;">비밀번호 초기화</button>
								<a href="<%=request.getContextPath() %>/">
									<button type="button" class="btn h-45px btn-yellow d-block w-80 btn-rg"  style="float: left;">취소</button>
								</a>
							</div>
							
						</form>
					</div>
					<!-- END login-content -->
				</div>
				<!-- END login-body -->
			</div>
			<!-- END login-container -->
		</div>
		<!-- END login -->
		
		<!-- BEGIN scroll-top-btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top" data-toggle="scroll-to-top"><i class="fa fa-angle-up"></i></a>
		<!-- END scroll-top-btn -->
	</div>
	<!-- END #app -->
	
	<!-- ================== BEGIN core-js ================== -->
	<script src="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/js/vendor.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/js/app.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/js/theme/transparent.min.js"></script>
	<!-- ================== END core-js ================== -->
</body>
</html>