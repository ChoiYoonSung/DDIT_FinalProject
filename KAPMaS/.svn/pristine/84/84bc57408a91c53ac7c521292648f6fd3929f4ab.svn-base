<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/style.jsp" %>		
<head>
<style>
	body{
		background-color: white;
	}
	
	h1 {
		text-align: center;
	}
  	h3 {
		text-align: center;
	}
	
	h5 {
		text-align: center;
		
	}
	
	.step2{
	 	margin: 0 auto;
	}
 .nav.nav-wizards-1 .nav-item .nav-link.active:after,
  .nav.nav-wizards-1 .nav-item .nav-link.active:before, .nav.nav-wizards-1 .nav-item .nav-link.completed:after,
   .nav.nav-wizards-1 .nav-item .nav-link.completed:before{
  	border-color: #ffd900;
  	background: #ffd900;
  }
	
</style>
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/FullCalendar/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/FullCalendar/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='<%=request.getContextPath() %>/resources/FullCalendar/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='<%=request.getContextPath() %>/resources/FullCalendar/vendor/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/FullCalendar/css/main.css">

</head>


<body>
<br>
<br>
<h1><img src="<%=request.getContextPath() %>/resources/images/logo-remove.png" 
		alt="" style="width: 100px;">프로젝트 수정 화면</h1>

		<form id="sub" style="padding-left: 100px; padding-top: 25px; padding-right: 100px;" action="modify.do" method="post">
			<input type="text" hidden="" name="pCode" value="${pro.pCode }">
			
			<div id="step1">
			<div class="row mb-15px">
			<span class="badge bg-yellow text-black" style="width: 100px; height: 30px;">
			<h6>프로젝트 이름</h6>
			</span>
				<div class="col-md-9">
					<input type="text" name="pName" class="form-control mb-5px" placeholder="${pro.pName }">
				</div>
			</div>
			
			<div class="row mb-15px">
				<span class="badge bg-yellow text-black" style="width: 100px; height: 30px;">
				<h6>프로젝트 주제</h6>
				</span>
				<div class="col-md-9">
					<input type="text" name="pTitle" class="form-control mb-5px" placeholder="${pro.pTitle }">
				</div>
			</div>
			
			<div class="row mb-15px">
				<span class="badge bg-yellow text-black" style="width: 100px; height: 30px;">
				<h6>프로젝트 개요</h6>
				</span>
				<div class="col-md-9">
					<input type="text" name="pSummary" class="form-control mb-5px" placeholder="${pro.pSummary }">
				</div>
			</div>
			
			<div class="row mb-15px">
				<span class="badge bg-yellow text-black" style="width: 100px; height: 30px;">
				<h6>프로젝트 내용</h6>
				</span>
				<div class="col-md-9">
					<textarea class="form-control" rows="5" name="pContent" placeholder="${pro.pContent }"></textarea>
				</div>
			</div>
			</div>
			
			<br>
			
			<button type="button" class="btn btn-gray me-1 mb-1" id="bone1" 
			style="float: left;"  onclick="Close();">&nbsp;&nbsp;&nbsp;취 &nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;</button>
			
			<button type="submit"  class="btn btn-yellow me-1 mb-1" id="bthree"
			style="float: right;">&nbsp;&nbsp;&nbsp;완 &nbsp;&nbsp;료&nbsp;&nbsp;&nbsp;</button>
			
		</form>

<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>


<script>

function Close(){
	window.close();
}

</script>



</body>





















