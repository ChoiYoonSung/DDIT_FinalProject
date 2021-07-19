<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<style>
.app-sidebar {
	padding-top: 0px;
}

#sidebar {
	position: absolute;
}

#listTable {
	height: 460px;
}

.app-content {
	padding: 20px 10px 10px 10px;
}

.row {
	margin: 0px;
}
</style>
</head>
<div class="banner-img" style="width: 100%; height: 270px; background-size: cover; background-repeat: no-repeat; background-image: url('<%=request.getContextPath() %>/cop/getBannerByCode/${copInfo.copCode}');"></div>
<br>
<div class="row">
	<div class="col-xl-6" id="listTable">
		<div class="panel panel-inverse" data-sortable-id="table-basic-1"
			style="">
			<!-- BEGIN panel-heading -->
			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">토론방 리스트</h4>
				<div class="panel-heading-btn">
					<a href="javascript:;" class="btn btn-xs btn-icon btn-default"
						data-toggle="panel-expand" data-bs-original-title="" title=""
						data-tooltip-init="true"><i class="fa fa-expand"></i></a>
				</div>
			</div>
			<!-- END panel-heading -->

			<!-- BEGIN panel-body -->
			<div class="panel-body" style="height: 400px;">
				<!-- BEGIN table-responsive -->
				<div class="table-responsive">
					<table class="table mb-0">
						<thead>
							<tr>
								<th>#</th>
								<th>제목</th>
								<th>개설일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty discussionList }">
								<tr>
									<td></td>
									<td>개설된 토론방이 없습니다.</td>
									<td></td>
								</tr>
							</c:if>
							<c:forEach var="cfd" items="${discussionList }">
								<tr>
									<td>${cfd.fdisCode }</td>
									<td>${cfd.fdisName }</td>
									<td>${cfd.fdisRegdate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-6" id="listTable">
		<div class="panel panel-inverse" data-sortable-id="table-basic-2"
			style="">
			<!-- BEGIN panel-heading -->
			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">자료실 리스트</h4>
				<div class="panel-heading-btn">
					<a href="javascript:;" class="btn btn-xs btn-icon btn-default"
						data-toggle="panel-expand" data-bs-original-title="" title=""
						data-tooltip-init="true"><i class="fa fa-expand"></i></a>
				</div>
			</div>
			<!-- END panel-heading -->

			<!-- BEGIN panel-body -->
			<div class="panel-body" style="height: 400px;">
				<!-- BEGIN table-responsive -->
				<div class="table-responsive">
					<table class="table mb-0">
						<thead>
							<tr>
								<th>#</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty archiveList }">
								<tr>
									<td></td>
									<td>작성된 자료실 게시글이 없습니다.</td>
									<td></td>
									<td></td>
								</tr>
							</c:if>
							<c:forEach var="ca" items="${archiveList }">
								<tr>
									<td>${ca.caCode }</td>
									<td>${ca.caTitle }</td>
									<td>${ca.empId }</td>
									<td>${ca.caRegdate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
