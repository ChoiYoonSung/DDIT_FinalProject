<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>


<body>

<div class="row" style="padding: 20px;">
			<div class="project-wrapper" style="width: 48%;  height: 700px;">
				<div class="panel panel-inverse" data-sortable-id="index-6">
					<div class="panel-heading ui-sortable-handle">
						<h4 class="panel-title">Analytics Details</h4>
						<div class="panel-heading-btn">
							<a href="javascript:;" class="btn btn-xs btn-icon btn-default"
								data-toggle="panel-expand"><i class="fa fa-expand"></i></a>
						</div>
					</div>
					<div class="table-responsive">

<div id="content" class="app-content">
			<!-- BEGIN breadcrumb -->
			<ol class="breadcrumb float-xl-end">
				<li class="breadcrumb-item"><a href="#" onclick="OpenWindow('<%=request.getContextPath() %>/project/chatting.do','프로젝트 회의방',400,400);">회의방 참여</a></li>
			</ol>
			<!-- END breadcrumb -->
			<!-- BEGIN page-header -->
			<h1 class="page-header">회의 일지<small>&nbsp;&nbsp;&nbsp;회의 일지를 등록하시오</small></h1>
			<!-- END page-header -->
			<!-- BEGIN timeline -->
			<div class="timeline">
				<!-- BEGIN timeline-item -->
				<div class="timeline-item">
					<!-- BEGIN timeline-time -->
				
				<div class="timeline-item">
					<!-- BEGIN timeline-time -->
					<div class="timeline-time">
						<span class="date">21일 7월 2021년</span>
						<span class="time">14:05</span>
					</div>
					<!-- END timeline-time -->
					<!-- BEGIN timeline-icon -->
					<div class="timeline-icon">
						<a href="javascript:;">&nbsp;</a>
					</div>
					<!-- END timeline-icon -->
					<!-- BEGIN timeline-content -->
					<div class="timeline-content" style="width: 20%;background-color: #E0F2F7">
						<!-- BEGIN timeline-header -->
						<div class="timeline-header">
							<div class="userimage"><img src="../assets/img/user/user-4.jpg" alt="" /></div>
							<div class="username">
								<a href="javascript:;">PMS회의 <i class="fa fa-check-circle text-blue ms-1"></i></a>
								<div class="text-muted fs-12px">1 days ago <i class="fa fa-globe-americas opacity-5 ms-1"></i></div>
							</div>
						</div>
						<!-- END timeline-header -->
						<!-- BEGIN timeline-body -->
						<div class="timeline-body">
							<!-- timeline-post -->
							<div class="mb-3">
								<h4 class="mb-1">
								</h4>
								<div class="mb-2">첨부파일</div>
								<div class="row gx-1">
									<div class="col-6">
										<img src="../assets/img/gallery/gallery-4.jpg" alt="" class="mw-100 d-block" />
									</div>
									<div class="col-6">
										<img src="../assets/img/gallery/gallery-5.jpg" alt="" class="mw-100 d-block" />
									</div>
								</div>
							</div>
						</div>
						<!-- END timeline-body -->
					</div>
					<!-- END timeline-content -->
				</div>
				<!-- END timeline-item -->
				
				<!-- BEGIN timeline-item -->
				<div class="timeline-item">
					<!-- BEGIN timeline-icon -->
					<div class="timeline-icon">
						<a href="javascript:;">&nbsp;</a>
					</div>
					<!-- END timeline-icon -->
					<!-- BEGIN timeline-content -->
					<div class="timeline-content" style="width: 20%;">
						<!-- BEGIN timeline-body -->
						<div class="timeline-body" style="background-color: #E0F2F7">
							<div class="d-flex align-items-center">
								<div class="spinner-border spinner-border-sm me-3" role="status">
									<span class="visually-hidden">Loading...</span>
								</div>
								다음회의를 등록하시오
							</div>
						</div>
						<!-- END timeline-body -->
					</div>
					<!-- BEGIN timeline-content -->
				</div>
				<!-- END timeline-item -->
			</div>
			<!-- END timeline -->
		</div>
	</div>
			</div>
			</div>
		</div>
		
		
		
			<div class="project-wrapper" style="width: 35%;  height: 700px;">
				<div class="panel panel-inverse" data-sortable-id="index-6">
					<div class="panel-heading ui-sortable-handle">
						<h4 class="panel-title">Analytics Details</h4>
						<div class="panel-heading-btn">
							<a href="javascript:;" class="btn btn-xs btn-icon btn-default"
								data-toggle="panel-expand"><i class="fa fa-expand"></i></a>
						</div>
					</div>
					
					<div class="table-responsive">
						<div id="datepicker-inline">
							<div></div>
						</div>
		
				</div>
			</div>
		</div>
		
		
</div>



</body>

<script type="text/javascript">
		
window.onload = function() {
	  $('tbody').attr("onclick","find()")
}
		
		
function find(){
	setTimeout(function() {
		
		var storm=prompt("쓰실오");
		
		alert($(".active").html());
		alert($(".datepicker-switch").html());
		
	
	
	
	}, 100);
}


</script>

