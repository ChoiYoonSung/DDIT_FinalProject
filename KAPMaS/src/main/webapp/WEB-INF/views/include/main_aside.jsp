<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   
		<!-- BEGIN #sidebar -->
		<div id="sidebar" class="app-sidebar app-sidebar-grid " style="width: 200px; padding: 0; background: #fff;">
			<!-- BEGIN scrollbar -->
			<div class="app-sidebar-content" data-scrollbar="true" data-height="100%" data-init="true" style="height: 100%; overflow-x: scroll;">
				<!-- BEGIN menu -->
				<div class="menu">
				<div class="" style="width: 200px; margin: 10px 20px; ">
					<a href="index.do" class="navbar-brand"><img src="/KAPMaS/resources/images/logo.png" alt="" style="height: 100%; width: 160px;"></a>
				</div>
					<div class="menu-profile" style="background-color: #fff; color: #000;">
						<a href="javascript:;" class="menu-profile-link" data-toggle="app-sidebar-profile" data-target="#appSidebarProfileMenu">
								<c:choose>
									<c:when test="${loginUser.empImg ne null }">
										<div class="menu-profile-image"
											style="height: 70px; width: 70px; display: block; margin: 0px auto; margin-right: 56px; margin-bottom: 10px;
											background-image: url('<%=request.getContextPath() %>/emp/getPicture.do?empImg=${loginUser.empImg}'); border: 0.5px solid black; border-radius: 25px;">
										</div>
									</c:when>
									<c:when test="${loginUser.empImg eq null || loginUser.empImg eq ''}">
										<div class="menu-profile-image"
											style="height: 70px; width: 70px; display: block; margin: 0px auto; margin-right: 56px; margin-bottom: 10px;
											background-image: url('<%=request.getContextPath() %>/resources/images/default_user_image.png'); border: 0.5px solid black; border-radius: 25px;">
										</div>
									</c:when>
								</c:choose>
							<div class="menu-profile-info">
								<div class="d-flex align-items-center">
									<div class="flex-grow-1" style="text-align: center;">
									<h3 style=" font-weight: 500; background-color: #fff; color: #000;">${loginUser.empName}</h3>
									<h5 style="background-color: #fff; color: #000;">${loginUser.empId }</h5>
									</div>
									<div class="menu-caret ms-auto" style="color: #000;"></div>
								</div>
							</div>
						</a>
					</div>
					<div id="appSidebarProfileMenu" class="collapse">
						<div class="menu-item pt-5px">
							<a href="javascript:OpenWindow('emp/detail/${loginUser.empId}','Detail','700','700');" class="menu-link">
								<div class="menu-icon"><i class="fa fa-pencil-alt"></i></div>
								<div class="menu-text">내정보</div>
							</a>
						</div>
						<div class="menu-item">
							<a href="<%=request.getContextPath() %>/common/logout" class="menu-link">
								<div class="menu-icon"><i class="ion ion-md-power"></i></div>
								<div class="menu-text">로그아웃</div>
							</a>
						</div>
					</div>
					
					<c:forEach items="${menuList }" var="menu" varStatus="status">
					<c:if test="${menu.mcode ne 'M040000' }">
						<c:if test="${menu.mcode eq 'M000000' }">
							<div class="menu-item kapmas-menu-${menu.mcode }">
						</c:if>
						<c:if test="${menu.mcode ne 'M000000' }">
							<div class="menu-item has-sub kapmas-menu-${menu.mcode }">
						</c:if>
							<a href="javascript:subMenu('${menu.mcode }');goPage('${menu.murl}','${menu.mcode }');menuSelect('${menu.mcode }', '${fn:length(menuList) }');" class="menu-link fst" style="padding: 13px 20px;">
								<div class="menu-icon">
									<i class="${menu.micon }"></i>
								</div>
								<div class="menu-text" style="font-size: 17px;">${menu.mname }</div>
							<c:if test="${menu.mcode ne 'M000000' && menu.mcode ne 'M010000'}">
									<div class="menu-caret"></div>
							</c:if>
							<c:if test="${menu.mcode eq 'M010000' && not empty pCode}">
									<div class="menu-caret"></div>
							</c:if>
							</a>
							<c:if test="${menu.mcode ne 'M000000' && menu.mcode ne 'M010000'}">
								<div class="menu-submenu subMenuList">
								</div>
							</c:if>
							<c:if test="${menu.mcode eq 'M010000' && not empty pCode}">
								<div class="menu-submenu subMenuList">
								</div>
							</c:if>
						</div>
					</c:if>
					</c:forEach>
					
				<!-- BEGIN minify-button -->
					<!-- END minify-button -->
				</div>
				<!-- END menu -->
			</div>
			<!-- END scrollbar -->
		</div>
		<!-- END #sidebar -->
		