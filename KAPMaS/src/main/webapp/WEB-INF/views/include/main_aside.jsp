<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   
		<!-- BEGIN #sidebar -->
		<div id="sidebar" class="app-sidebar app-sidebar-grid ">
			<!-- BEGIN scrollbar -->
			<div class="app-sidebar-content" data-scrollbar="true" data-height="100%" data-init="true" style="height: 100%; overflow-x: scroll;">
				<!-- BEGIN menu -->
				<div class="menu">
					<div class="menu-profile">
						<a href="javascript:;" class="menu-profile-link" data-toggle="app-sidebar-profile" data-target="#appSidebarProfileMenu">
							<div class="menu-profile-cover with-shadow"></div>
							<div class="menu-profile-image">
								<c:choose>
									<c:when test="${loginUser.empImg ne null }">
										<img src="<%=request.getContextPath() %>/emp/getPicture.do?empImg=${loginUser.empImg}" alt="User Profile Image">
									</c:when>
									<c:when test="${loginUser.empImg eq null || loginUser.empImg eq ''}">
										<img src="<%=request.getContextPath() %>/resources/images/default_user_image.png" alt="User Profile Image">
									</c:when>
								</c:choose>
							</div>
							<div class="menu-profile-info">
								<div class="d-flex align-items-center">
									<div class="flex-grow-1">
									${loginUser.empName} | (${loginUser.empId })
									</div>
									<div class="menu-caret ms-auto"></div>
								</div>
								<small>${loginUser.empAuth}</small>
							</div>
						</a>
					</div>
					<div id="appSidebarProfileMenu" class="collapse">
						<div class="menu-item pt-5px">
							<a href="javascript:OpenWindow('emp/detail/${loginUser.empId}','Detail','700','600');" class="menu-link">
								<div class="menu-icon"><i class="fa fa-pencil-alt"></i></div>
								<div class="menu-text">내정보</div>
							</a>
						</div>
						<div class="menu-item">
							<a href="<%=request.getContextPath() %>/common/logout" class="menu-link">
								<div class="menu-icon"><i class="fa fa-cog"></i></div>
								<div class="menu-text">로그아웃</div>
							</a>
						</div>
					</div>
					<div class="menu-header">Navigation</div>
					
					<c:forEach items="${menuList }" var="menu" varStatus="status">
					<c:if test="${menu.mcode ne 'M040000' }">
						<c:if test="${menu.mcode eq 'M000000' }">
							<div class="menu-item kapmas-menu-${menu.mcode }">
						</c:if>
						<c:if test="${menu.mcode ne 'M000000' }">
							<div class="menu-item has-sub kapmas-menu-${menu.mcode }">
						</c:if>
							<a href="javascript:subMenu('${menu.mcode }');goPage('${menu.murl}','${menu.mcode }');menuSelect('${menu.mcode }', '${fn:length(menuList) }');" class="menu-link">
								<div class="menu-icon">
									<i class="${menu.micon }"></i>
								</div>
								<div class="menu-text">${menu.mname }</div>
							<c:if test="${menu.mcode ne 'M000000' }">
								<div class="menu-caret"></div>
							</c:if>
							</a>
							<c:if test="${menu.mcode ne 'M000000' }">
								<div class="menu-submenu subMenuList">
								</div>
							</c:if>
						</div>
					</c:if>
					</c:forEach>
					
				<!-- BEGIN minify-button -->
					<div class="menu-item d-flex">
						<a href="javascript:;" class="app-sidebar-minify-btn ms-auto" data-toggle="app-sidebar-minify"><i class="fa fa-angle-double-left"></i></a>
					</div>
					<!-- END minify-button -->
				</div>
				<!-- END menu -->
			</div>
			<!-- END scrollbar -->
		</div>
		<div class="app-sidebar-bg"></div>
		<div class="app-sidebar-mobile-backdrop"><a href="#" data-dismiss="app-sidebar-mobile" class="stretched-link"></a></div>
		<!-- END #sidebar -->
		