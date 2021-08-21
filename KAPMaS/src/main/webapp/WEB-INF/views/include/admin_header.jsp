<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
	<div id="header" class="app-header">
		<!-- BEGIN navbar-header -->
		<div class="navbar-header">
			<a href="index.do" class="navbar-brand"><img src="<%=request.getContextPath() %>/resources/images/logo-remove(white).png" alt="" style="height: 100px;"></a>
			<button type="button" class="navbar-mobile-toggler" data-toggle="app-sidebar-mobile"> </button>
		</div>
		<!-- END navbar-header -->
		<!-- BEGIN header-nav -->
		<div class="navbar-nav">
			<div class="navbar-item">
				<a href="<%=request.getContextPath() %>/common/logout" class="navbar-link d-flex align-items-center">
					<span>
						<span class="d-none d-md-inline"><i class="fas fa-sign-out-alt"></i>Log Out</span>
					</span>
				</a>
			</div>
		</div>
		<!-- END header-nav -->
	</div>
	<!-- END #header -->