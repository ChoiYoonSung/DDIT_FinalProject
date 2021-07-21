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
	<link href="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/css/default/app.min.css" rel="stylesheet" />
	<!-- ================== END core-css ================== -->
</head>
<body class='pace-top'>
	<!-- BEGIN page-cover -->
	<!-- END page-cover -->
	
	<!-- BEGIN #loader -->
	<!-- END #loader -->


	<!-- BEGIN #app -->
	<%-- <div id="app" class="app">
		<!-- BEGIN login -->
		<div class="login login-v1">
			<!-- BEGIN login-container -->
			<div class="login-container">
				BEGIN login-header
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
				END login-header
				
				BEGIN login-body
				<div class="login-body">
					BEGIN login-content
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
					END login-content
				</div>
				END login-body
			</div>
			<!-- END login-container -->
		</div>
		<!-- END login -->
		
		<!-- BEGIN scroll-top-btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top" data-toggle="scroll-to-top"><i class="fa fa-angle-up"></i></a>
		<!-- END scroll-top-btn -->
	</div> --%>
	<!-- END #app -->
	
	


	<!-- BEGIN #app -->
	<div id="app" class="app">
		<!-- BEGIN register -->
		<div class="register register-with-news-feed">
			<!-- BEGIN news-feed -->
			<div class="news-feed">
				<div class="news-image" style="background-image: url(<%=request.getContextPath() %>/resources/bootstrap/assets/img/login-bg/login-bg-11.jpg)"></div>
				<div class="news-caption">
					<h4 class="caption-title">
						<b>KAPMaS</b>란?
					</h4>
					<p>Knoledge And Project Management System의 약어로 프로젝트를 사용함과 동시에 지식관리를 할 수 있도록 만들어진 통합프로젝트지식관리시스템 입니다.
					</p>
				</div>
			</div>
			<!-- END news-feed -->
			
			<!-- BEGIN register-container -->
			<div class="register-container">
				<!-- BEGIN register-header -->
				<div class="register-header mb-25px h1">
					<div class="mb-1">Sign Up</div>
					<small class="d-block fs-15px lh-16">Create your Color Admin Account. It’s free and always will be.</small>
				</div>
				<!-- END register-header -->
				
				<!-- BEGIN register-content -->
				<div class="register-content">
					<form action="index.html" method="GET" class="fs-13px">
						<div class="mb-3">
							<label class="mb-2">ID<span class="text-danger">*</span></label>
							<input type="id" class="form-control fs-13px" name="empId" id="empId" placeholder="ID"/>
						</div>
						<div class="mb-3">
							<label class="mb-2">Email <span class="text-danger">*</span></label>
							<input type="email" class="form-control fs-13px" name="empEmail" id="empEmail" placeholder="Email"/>
						</div>
						<div class="mb-4">
							<button type="submit" class="btn btn-inverse d-block w-100 btn-lg h-45px fs-13px">Send Password to Email</button>
						</div>
						<div class="mb-40px pb-40px text-inverse row">
							<div class="col-6 text-center">
								<a href="<%=request.getContextPath() %>/" class="text-inverse">Sign In</a>
							</div>
							<div class="col-6 text-center">
								<a href="<%=request.getContextPath() %>/emp/registForm.do" class="text-inverse">Sign Up</a>
							</div>
						</div>
						<hr class="bg-gray-600 opacity-2" />
						<p class="text-center text-gray-600">
							&copy; Color Admin All Right Reserved 2021
						</p>
					</form>
				</div>
				<!-- END register-content -->
			</div>
			<!-- END register-container -->
		</div>
		<!-- END register -->
		
		<!-- END scroll-top-btn -->
	</div>
	
	<!-- ================== BEGIN core-js ================== -->
	<script src="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/js/vendor.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/js/app.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/js/theme/transparent.min.js"></script>
	<!-- ================== END core-js ================== -->
</body>
</html>