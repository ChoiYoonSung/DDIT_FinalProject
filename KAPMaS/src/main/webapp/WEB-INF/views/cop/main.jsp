<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<body>
	<div class="app-content">
		<div class="row">
			<h1 class="page-header">&nbsp;COP DashBoard</h1>
			<div class="col-6">
				<div class="panel panel-inverse" data-sortable-id="table-basic-1"
					style="">
					<!-- BEGIN panel-heading -->
					<div class="panel-heading ui-sortable-handle">
						<h4 class="panel-title">참여자 수가 많은 CoP</h4>
						<div class="panel-heading-btn">
						</div>
					</div>
					<!-- END panel-heading -->

					<!-- BEGIN panel-body -->
					<div class="panel-body" style="height: 590px;">
						<!-- BEGIN table-responsive -->
						<div class="table-responsive">
							<table class="table table-hover mb-0 text-inverse">
								<thead>
									<tr>
										<th>COP명</th>
										<th>참여자 수</th>
										<th>소유자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="lc" items="${largestCopList }" begin="0" end="14">
										<tr onclick="OpenWindow('copInfo/${lc.copCode}','${lc.copName}','500','800');" style="cursor: pointer;">
											<td>${lc.copName }</td>
											<td>${lc.copPersonnel }</td>
											<td>${lc.copOwner }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="panel panel-inverse" data-sortable-id="table-basic-2" style="">
					<!-- BEGIN panel-heading -->
					<div class="panel-heading ui-sortable-handle">
						<h4 class="panel-title">활성화된 토론방이 많은 CoP</h4>
						<div class="panel-heading-btn">
						</div>
					</div>
					<!-- END panel-heading -->

					<!-- BEGIN panel-body -->
					<div class="panel-body" style="height: 590px;">
						<!-- BEGIN table-responsive -->
						<div class="table-responsive">
							<table class="table table-hover mb-0 text-inverse">
								<thead>
									<tr>
										<th>COP명</th>
										<th>토론방 수</th>
										<th>소유자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="lcf" items="${largestCopFdList }" begin="0" end="14">
										<tr onclick="OpenWindow('copInfo/${lcf.copCode}','${lcf.copName}','500','800');" style="cursor: pointer;">
											<td>${lcf.copName }</td>
											<td>${lcf.fdisCode }</td>
											<td>${lcf.copOwner }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/resources/js/index.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
</body>
