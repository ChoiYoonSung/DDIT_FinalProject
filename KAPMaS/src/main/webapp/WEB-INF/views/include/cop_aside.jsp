<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
	<div id="sidebar" class="app-sidebar" style="background: #fff;">
		<!-- BEGIN scrollbar -->
		<div class="app-sidebar-content ps ps--active-y" data-scrollbar="true" data-height="100%" data-init="true" style="height: 100%;">
			<!-- BEGIN menu -->
			<div class="menu">
				<div class="menu-profile">
					<div class="menu-profile-link" data-toggle="app-sidebar-profile" data-target="#appSidebarProfileMenu" style="background: #92b4f3;">
						<!-- <div class="menu-profile-cover with-shadow"></div> -->
						<div class="menu-profile-image" style=" height: 150px; width: 150px; margin:0 auto; background-image: url('<%=request.getContextPath() %>/cop/getPictureByCode/${copInfo.copCode}');">
							
						</div>
						<div class="menu-profile-info">
							<br>
							<h5>개설일 : <span>${copInfo.copRegdate }</span></h5>
							<h5>소유자 : <span>${copInfo.copOwner }</span></h5>
							<h5>공개 상태 :
								<c:choose>
									<c:when test="${copInfo.copType == '0'}"><span>비공개</span></c:when>
									<c:when test="${copInfo.copType == '1'}"><span>공개</span></c:when>
								</c:choose> 
							</h5>
							<c:if test="${loginUser.empName  ne copInfo.copOwner }">
							<h5>활동인원 : <span>${copPer.copPersonnel }</span></h5>
							</c:if>
							<c:if test="${loginUser.empName eq copInfo.copOwner }">
							<div class="d-flex align-items-center">
								<div class="flex-grow-1">
								<h5>활동인원 : <span>${copPer.copPersonnel }</span></h5>
								<h5>가입 신청 대기중 : <span>${copApReq}</span></h5>
								</div>
							</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="menu-header">Navigation</div>
				<div class="menu-item">
					<a href="javascript:goPageForCop('/KAPMaS/cop/detail/main/${copInfo.copCode }');" class="menu-link">
						<div class="menu-icon">
							<i class="fas fa-home fa-lg"></i>
						</div>
						<div class="menu-text">홈</div>
					</a>
				</div>
				<div class="menu-item">
					<a href="javascript:goPageForCop('/KAPMaS/cop/detail/discussion/${copInfo.copCode }');" class="menu-link">
						<div class="menu-icon">
							<i class="fas fa-users fa-lg"></i>
						</div>
						<div class="menu-text">토론방</div>
					</a>
				</div>
				<div class="menu-item">
					<a href="javascript:goPageForCop('/KAPMaS/cop/detail/coppds/${copInfo.copCode }');" class="menu-link">
						<div class="menu-icon">
							<i class="fas fa-file-archive fa-lg
"></i>
						</div>
						<div class="menu-text">자료실</div>
					</a>
				</div>
				<div class="menu-item">
					<a href="javascript:goPageForCop('/KAPMaS/cop/detail/shareProject/${copInfo.copCode }');" class="menu-link">
						<div class="menu-icon">
							<i class="fas fa-share-alt-square fa-lg"></i>
						</div>
						<div class="menu-text">프로젝트 공유</div>
					</a>
				</div>
				<c:if test="${loginUser.empName  eq copInfo.copOwner }">
				<div class="menu-item">
					<a href="javascript:goPageForCop('/KAPMaS/cop/detail/copManage/${copInfo.copCode }'); copManageFunc();" class="menu-link">
						<div class="menu-icon">
							<i class="fa fa-cog fa-lg"></i>
						</div>
						<div class="menu-text">CoP 관리</div>
					</a>
				</div>
				</c:if>
			</div>
		</div>
	</div>
	<script>
	function goPageForCop(url){
		$('iframe[name="ifr"]').attr("src",url);
	};
	</script>
</body>