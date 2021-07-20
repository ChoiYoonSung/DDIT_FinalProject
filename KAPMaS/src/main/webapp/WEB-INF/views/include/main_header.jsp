<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="pace pace-inactive"><div class="pace-progress" data-progress-text="100%" data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
	  <div class="pace-progress-inner"></div>
	</div>
	<div class="pace-activity"></div></div>
	
	<div id="loader" class="app-loader">
		<span class="spinner"></span>
	</div>
	
	<!-- BEGIN #app -->
	<div id="app" class="app app-header-fixed app-sidebar-fixed app-gradient-enabled" style="background-color: #f0f4f7;">
		<!-- BEGIN #header -->
<div id="header" class="app-header app-header-inverse">
			<!-- BEGIN navbar-header -->
			<div class="navbar-header">
				<a href="index.do" class="navbar-brand"><img src="<%=request.getContextPath() %>/resources/images/logo/logo-remove(white).png" alt="" style="height: 100px;"></a>
				<button type="button" class="navbar-mobile-toggler" data-toggle="app-sidebar-mobile"> </button>
			</div>
			<!-- END navbar-header -->
			<!-- BEGIN header-nav -->
			<div class="navbar-nav">
				<div class="row">
					<!-- 마이 메뉴 -->
						<div class="header-nav-item col-auto">
							<a href="javascript:OpenWindow('<%=request.getContextPath() %>/mypage/myactive', '내 활동','1000', '800');"class="nav-link">
				    		내 활동
				    		</a>
						</div>
						<div class="header-nav-item col-auto">
							<a href="javascript:OpenWindow('<%=request.getContextPath() %>/mypage/receivemail', '쪽지', '1000', '800');"class="nav-link">
				    		쪽지
				    		</a>
						</div>
						<div class="header-nav-item col-auto">
							<a href="javascript:OpenWindow('<%=request.getContextPath() %>/mypage/myoffice', 'My Office', '900', '900');"class="nav-link">
				    		My Office
				    		</a>
						</div>
						<div class="header-nav-item col-auto">
							<a href="javascript:OpenWindow('<%=request.getContextPath() %>/mypage/mydocument', 'My Document', '900', '900');"class="nav-link">
				    		My Document
				    		</a>
						</div>
						<div class="header-nav-item col-auto">
							<a href="javascript:OpenWindow('<%=request.getContextPath() %>/mypage/trash', '휴지통', '1000', '800');"class="nav-link">
				    		휴지통
				    		</a>
						</div>
				</div>
				<div class="navbar-item navbar-form">
					<form action="" method="POST" name="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Enter keyword">
							<button type="submit" class="btn btn-search"><i class="fa fa-search"></i></button>
						</div>
					</form>
				</div>
				<div class="navbar-item dropdown">
					<a href="#" data-bs-toggle="dropdown" class="navbar-link dropdown-toggle icon">
						<i class="fa fa-bell"></i>
						<span class="badge">5</span>
					</a>
					<div class="dropdown-menu media-list dropdown-menu-end">
						<div class="dropdown-header">NOTIFICATIONS (5)</div>
						<a href="javascript:;" class="dropdown-item media">
							<div class="media-left">
								<i class="fa fa-bug media-object bg-gray-500"></i>
							</div>
							<div class="media-body">
								<h6 class="media-heading">Server Error Reports <i class="fa fa-exclamation-circle text-danger"></i></h6>
								<div class="text-muted fs-10px">3 minutes ago</div>
							</div>
						</a>
						<a href="javascript:;" class="dropdown-item media">
							<div class="media-left">
								<img src="../assets/img/user/user-1.jpg" class="media-object" alt="">
								<i class="fab fa-facebook-messenger text-blue media-object-icon"></i>
							</div>
							<div class="media-body">
								<h6 class="media-heading">John Smith</h6>
								<p>Quisque pulvinar tellus sit amet sem scelerisque tincidunt.</p>
								<div class="text-muted fs-10px">25 minutes ago</div>
							</div>
						</a>
						<a href="javascript:;" class="dropdown-item media">
							<div class="media-left">
								<img src="../assets/img/user/user-2.jpg" class="media-object" alt="">
								<i class="fab fa-facebook-messenger text-blue media-object-icon"></i>
							</div>
							<div class="media-body">
								<h6 class="media-heading">Olivia</h6>
								<p>Quisque pulvinar tellus sit amet sem scelerisque tincidunt.</p>
								<div class="text-muted fs-10px">35 minutes ago</div>
							</div>
						</a>
						<a href="javascript:;" class="dropdown-item media">
							<div class="media-left">
								<i class="fa fa-plus media-object bg-gray-500"></i>
							</div>
							<div class="media-body">
								<h6 class="media-heading"> New User Registered</h6>
								<div class="text-muted fs-10px">1 hour ago</div>
							</div>
						</a>
						<a href="javascript:;" class="dropdown-item media">
							<div class="media-left">
								<i class="fa fa-envelope media-object bg-gray-500"></i>
								<i class="fab fa-google text-warning media-object-icon fs-14px"></i>
							</div>
							<div class="media-body">
								<h6 class="media-heading"> New Email From John</h6>
								<div class="text-muted fs-10px">2 hour ago</div>
							</div>
						</a>
						<div class="dropdown-footer text-center">
							<a href="javascript:;" class="text-decoration-none">View more</a>
						</div>
					</div>
				</div>
				
			</div>
			<!-- END header-nav -->
		</div>
		
