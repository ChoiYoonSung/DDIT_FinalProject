<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<body>
	<div id="sidebar" class="app-sidebar">
		<!-- BEGIN scrollbar -->
		<div class="app-sidebar-content ps ps--active-y" data-scrollbar="true"
			data-height="100%" data-init="true" style="height: 100%;">
			<!-- BEGIN menu -->
			<div class="menu">
				<div class="menu-profile">
					<a href="javascript:;" class="menu-profile-link"
						data-toggle="app-sidebar-profile"
						data-target="#appSidebarProfileMenu">
						<!-- <div class="menu-profile-cover with-shadow"></div> -->
						<div class="menu-profile-image" style=" height: 150px; width: 150px; border: 1px solid black; margin:0 auto; background-image: url('<%=request.getContextPath() %>/cop/getPictureByCode/${copInfo.copCode}');">
							
						</div>
						<div class="menu-profile-info">
							<br>
							<h5>개설일 : <span>${copInfo.copRegdate }</span></h5>
							<h5>소유자 : <span>${copInfo.copOwner }</span></h5>
							<h5>활동인원 : <span>${copPer.copPersonnel }</span></h5>
							<div class="d-flex align-items-center">
								<div class="flex-grow-1"></div>
								<div class="menu-caret ms-auto"></div>
							</div>
						</div>
					</a>
				</div>
				<div id="appSidebarProfileMenu" class="collapse">
					<div class="menu-item pt-5px">
						<a href="javascript:;" class="menu-link">
							<div class="menu-icon">
								<i class="fa fa-cog"></i>
							</div>
							<div class="menu-text">Settings</div>
						</a>
					</div>
					<div class="menu-item">
						<a href="javascript:;" class="menu-link">
							<div class="menu-icon">
								<i class="fa fa-pencil-alt"></i>
							</div>
							<div class="menu-text">Send Feedback</div>
						</a>
					</div>
					<div class="menu-item pb-5px">
						<a href="javascript:;" class="menu-link">
							<div class="menu-icon">
								<i class="fa fa-question-circle"></i>
							</div>
							<div class="menu-text">Helps</div>
						</a>
					</div>	
					<div class="menu-divider m-0"></div>
				</div>
				<div class="menu-header">Navigation</div>
				<div class="menu-item">
					<a href="javascript:goPageForCop('/KAPMaS/cop/detail/main/${copInfo.copCode }');" class="menu-link">
						<div class="menu-icon">
							<i class="fa fa-th-large"></i>
						</div>
						<div class="menu-text">홈</div>
					</a>
				</div>
				<div class="menu-item">
					<a href="javascript:goPageForCop('/KAPMaS/cop/detail/discussion/${copInfo.copCode }');" class="menu-link">
						<div class="menu-icon">
							<i class="fa fa-th-large"></i>
						</div>
						<div class="menu-text">토론방</div>
					</a>
				</div>
				<div class="menu-item">
					<a href="javascript:goPageForCop('/KAPMaS/cop/detail/coppds/${copInfo.copCode }');" class="menu-link">
						<div class="menu-icon">
							<i class="fa fa-th-large"></i>
						</div>
						<div class="menu-text">자료실</div>
					</a>
				</div>
				<div class="menu-item">
					<a href="javascript:goPageForCop('/KAPMaS/cop/detail/shareProject/${copInfo.copCode }');" class="menu-link">
						<div class="menu-icon">
							<i class="fa fa-th-large"></i>
						</div>
						<div class="menu-text">프로젝트 공유</div>
					</a>
				</div>
				<div class="menu-item">
					<a href="javascript:goPageForCop('/KAPMaS/cop/detail/copManage/${copInfo.copCode }');" class="menu-link">
						<div class="menu-icon">
							<i class="fa fa-th-large"></i>
						</div>
						<div class="menu-text">CoP 관리</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<script>
	function goPageForCop(url){
		$('iframe[name="ifr"]').attr("src",url);
	};
	</script>
</body>