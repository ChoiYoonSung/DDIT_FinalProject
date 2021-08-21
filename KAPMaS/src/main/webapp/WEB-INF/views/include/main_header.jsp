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
	<div id="header" class="app-header app-header-inverse" style="margin-left: 200px;background-color: #f0f4f7;">
			<!-- BEGIN navbar-header -->
			<!-- END navbar-header -->
			<!-- BEGIN header-nav -->
			<div class="navbar-nav">
				<div class="row">
					<!-- 마이 메뉴 -->
						<div class="header-nav-item col-auto">
							<a href="javascript:OpenWindow('<%=request.getContextPath() %>/mypage/myactive', '내 활동','1200', '900');"class="nav-link" style="color: #000; font-weight: 500;">
				    		내 활동
				    		</a>
						</div>
						<div class="header-nav-item col-auto">
							<a href="javascript:OpenWindow('<%=request.getContextPath() %>/mypage/receivemail', '쪽지', '1000', '800');"class="nav-link" style="color: #000; font-weight: 500;">
				    		쪽지
				    		</a>
						</div>
						<div class="header-nav-item col-auto">
							<a href="javascript:OpenWindow('<%=request.getContextPath() %>/mypage/myoffice', 'My Office', '1000', '905');"class="nav-link" style="color: #000; font-weight: 500;">
				    		My Office
				    		</a>
						</div>
						<div class="header-nav-item col-auto">
							<a href="javascript:OpenWindow('<%=request.getContextPath() %>/mypage/mydocument', 'My Document', '450', '500');"class="nav-link" style="color: #000; font-weight: 500;">
				    		My Document
				    		</a>
						</div>
						<div class="header-nav-item col-auto">
							<a href="javascript:OpenWindow('<%=request.getContextPath() %>/mypage/trash', '휴지통', '1000', '800');"class="nav-link" style="color: #000; font-weight: 500;">
				    		휴지통
				    		</a>
						</div>
				</div>
			</div>
			<div style="width: 50px;"></div>
			<!-- END header-nav -->
		</div>
		
