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
	<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/css/vendor.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/css/default/app.min.css" rel="stylesheet" />
	<!-- ================== END core-css ================== -->
		<link href="<%=request.getContextPath() %>/resources/css/css.css" rel="stylesheet">
</head>
<body class='pace-top'>

	<!-- BEGIN #app -->
	<div id="app" class="app">
		<!-- BEGIN register -->
		<div class="register register-with-news-feed">
			<!-- BEGIN news-feed -->
			<div class="news-feed">
				<div class="news-image" style="background-image: url(<%=request.getContextPath() %>/resources/images/wallpaper/login-wallpaper.jpg)"></div>
				<div class="news-caption">
					<h4 class="caption-title">
						<b>KAPMaS</b>
					</h4>
					<p>Knoledge And Project Management System</p>
					<p>프로젝트 지식 통합 관리 시스템
				</div>
			</div>
			<!-- END news-feed -->
			
			<!-- BEGIN register-container -->
			<div class="register-container">
				<!-- BEGIN register-header -->
				<div class="register-header mb-25px h1">
					<img src="<%=request.getContextPath() %>/resources/images/logo-remove.png" alt="" style="width: 300px">
					<div class="mb-1">Find Password</div>
					<small class="d-block fs-15px lh-16">아이디와 이메일을 입력하여 이메일로 임시 비밀번호를 발급받으세요.</small>
				</div>
				<!-- END register-header -->
				
				<!-- BEGIN register-content -->
				<div class="register-content">
					<form action="<%=request.getContextPath() %>/emp/find.do" method="GET" class="fs-13px" name="sendForm">
						<div class="mb-3">
							<label class="mb-2">ID<span class="text-danger">*</span></label>
							<input type="id" class="form-control fs-13px" name="empId" id="empId" placeholder="ID"/>
						</div>
						<div class="mb-3">
							<label class="mb-2">Email <span class="text-danger">*</span></label>
							<input type="email" class="form-control fs-13px" name="empEmail" id="empEmail" placeholder="Email"/>
						</div>
						<div class="mb-4">
							<button type="button" onclick="send()" class="btn btn-inverse d-block w-100 btn-lg h-45px fs-13px">Send Password to Email</button>
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
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/vendor.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/app.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/theme/transparent.min.js"></script>
	<!-- ================== END core-js ================== -->
	
		<script>
	function send(){

		var empId = $("#empId").val();
		if(empId == "") {
			/* alert("아이디를 입력해주세요");
			return; */
			
			
			swal({
				title: '실패',
				text: '아이디를 입력해주세요',
				icon: 'danger', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-danger',
			                closeModal: true
			              }
			        }
			}).then(function(e){
				return;
			});
		}
		
		var empEmail=$("#empEmail").val()
		if(empEmail == "") {
			/* alert("이메일을 입력해주세요");
			return; */
			
			swal({
				title: '실패',
				text: '이메일을 입력해주세요',
				icon: 'danger', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-danger',
			                closeModal: true
			              }
			        }
			}).then(function(e){
				return;
			});
		}
		
		document.sendForm.submit();
		
	}
	
	</script>
</body>
</html>