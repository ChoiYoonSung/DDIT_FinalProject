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
				<div class="register-header mb-25px h1">
					<img src="<%=request.getContextPath() %>/resources/images/logo-remove.png" alt="" style="width: 300px">
					<div class="mb-1">Sign Up</div>
					<small class="d-block fs-15px lh-16">계정을 생성하여 KAPMaS를 이용해보세요.</small>
				</div>
				
				<div class="register-content">
					<form action="<%=request.getContextPath() %>/emp/regist.do" method="post"  name="sendForm">
						<div class="mb-3">
							<label class="mb-2" onclick="fillArea();">이름 <span class="text-danger">*</span></label>
							<input type="text" class="form-control fs-13px" name="empName" id="empName"placeholder="이름" />
						</div>
						<div class="mb-3">
							<label class="mb-2">ID <span class="text-danger">*</span></label>
							<input type="text" class="form-control fs-13px" name="empId" id="empId" placeholder="ID" />
						</div>
						<div class="mb-3">
							<label class="mb-2">Email <span class="text-danger">*</span></label>
							<input type="email" class="form-control fs-13px" name="empEmail" id="empEmail" placeholder="Email" />
						</div>
						<div class="mb-3">
							<label class="mb-2">부서 <span class="text-danger">*</span></label>
								<select class="form-select" name="dep" id="dep" >
										<option value="">-부서 선택-</option>
										<c:forEach items="${depList }" var="dep" >
											<option value="${dep.depCode }">${dep.depName }</option>
										</c:forEach>
								</select>		
						</div>
						<div class="mb-3">
							<label class="mb-2">직급 <span class="text-danger">*</span></label>
								<select class="form-select" name="rank" id="rank" >
										<option value="">-직급 선택-</option>
										<c:forEach items="${rankList }" var="rnk" >
											<option value="${rnk.rnkCode }">${rnk.rnkName }</option>
										</c:forEach>
								</select>
						</div>
						<div class="mb-4">
							<button type="button" onclick="send()" class="btn btn-inverse d-block w-100 btn-lg h-45px fs-13px">Sign Up</button>
						</div>
						<div class="mb-40px pb-40px text-inverse row">
							<div class="col-6 text-center">
								<a href="<%=request.getContextPath() %>/" class="text-inverse">Sign In</a>
							</div>
							<div class="col-6 text-center">
								<a href="<%=request.getContextPath() %>/emp/findForm.do" class="text-inverse">Find Password</a>
							</div>
						</div>
						<hr class="bg-gray-600 opacity-2" />
						<p class="text-center text-gray-600">
							&copy; Color Admin All Right Reserved 2021
						</p>
					</form>
				</div>
			</div>
			<!-- END register-container -->
		</div>
		<!-- END register -->
		
		<!-- END scroll-top-btn -->
	</div>
	<!-- END #app -->

	
	<!-- ================== BEGIN core-js ================== -->
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/vendor.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/app.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/theme/transparent.min.js"></script>
	<!-- ================== END core-js ================== -->
	
	
	<script>
	function fillArea(){
		$("#empName").val("김승환");
		$("#empId").val("kshz0726");
		$("#empEmail").val("kdhz1001@naver.com");
	}
	
	function send(){
		var empName = $("#empName").val();
		if(empName == "") {
			/* alert("이름을 입력해주세요");
			return;
			 */

			swal({
				title: '실패',
				text: '이름을 입력해주세요',
				icon: 'error', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-danger',
			                closeModal: true
			              }
			        }
			});
			return;
		}
		

		var empId = $("#empId").val();
		if(empId == "") {
			/* alert("아이디를 입력해주세요");
			return; */
			
			swal({
				title: '실패',
				text: '아이디를 입력해주세요',
				icon: 'error', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-danger',
			                closeModal: true
			              }
			        }
			});
			return;
		}
		
		var empEmail=$("#empEmail").val()
		var emailTest = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(empEmail == "") {
			/* alert("이메일을 입력해주세요");
			return; */
			
			swal({
				title: '실패',
				text: '이메일을 입력해주세요',
				icon: 'error', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-danger',
			                closeModal: true
			              }
			        }
			});
			return;
		}
		if(!emailTest.test(empEmail)){
			swal({
				title: '실패',
				text: '이메일 형식에 맞지 않습니다.',
				icon: 'error', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-danger',
			                closeModal: true
			              }
			        }
			});
			return;
		}
		var dep=$("#dep").val()
		if(dep == "") {
		/* 	alert("부서를 선택해주세요");
			return; */
			
			swal({
				title: '실패',
				text: '부서를 선택해주세요',
				icon: 'error', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-danger',
			                closeModal: true
			              }
			        }
			});
				return;
		}
		
		var rank=$("#rank").val()
		if(rank == "") {
			/* alert("직급을 선택해 주세요");
			return; */
			
			swal({
				title: '실패',
				text: '직급을 선택해 주세요',
				icon: 'error', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-danger',
			                closeModal: true
			              }
			        }
			});
			return;
		}
		
		document.sendForm.submit();
		
		
	}
	
	</script>
	
</body>

</html>