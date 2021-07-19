<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
.row {
	margin: 0px;
}

</style>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="row">
		<div class="imgArea"
			style="background-image: url('https://p0.pikist.com/photos/924/218/friends-landscape-color-nature-colorful-travel-friendly-light-sky.jpg');">
		</div>
		<div class="col-xl-6">
			<div class="panel panel-inverse" data-sortable-id="table-basic-1"
				style="">
				<!-- BEGIN panel-heading -->
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">참여자 수가 많은 CoP</h4>
					<div class="panel-heading-btn">
						<a href="javascript:;" class="btn btn-xs btn-icon btn-default"
							data-toggle="panel-expand" data-bs-original-title="" title=""
							data-tooltip-init="true"><i class="fa fa-expand"></i></a> <a
							href="javascript:;" class="btn btn-xs btn-icon btn-success"
							data-toggle="panel-reload" data-bs-original-title="" title=""
							data-tooltip-init="true"><i class="fa fa-redo"></i></a> <a
							href="javascript:;" class="btn btn-xs btn-icon btn-warning"
							data-toggle="panel-collapse" data-bs-original-title="" title=""
							data-tooltip-init="true"><i class="fa fa-minus"></i></a> <a
							href="javascript:;" class="btn btn-xs btn-icon btn-danger"
							data-toggle="panel-remove" data-bs-original-title="" title=""
							data-tooltip-init="true"><i class="fa fa-times"></i></a>
					</div>
				</div>
				<!-- END panel-heading -->

				<!-- BEGIN panel-body -->
				<div class="panel-body">
					<!-- BEGIN table-responsive -->
					<div class="table-responsive">
						<table class="table table-hover mb-0 text-inverse">
							<thead>
								<tr>
									<th>#</th>
									<th>COP명</th>
									<th>참여자 수</th>
									<th>소유자</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="lc" items="${largestCopList }">
									<tr>
										<td>${lc.copCode }</td>
										<td>${lc.copName }</a></td>
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
		<div class="col-xl-6">

			<div class="panel panel-inverse" data-sortable-id="table-basic-2"
				style="">
				<!-- BEGIN panel-heading -->
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">활성화된 토론방이 많은 CoP</h4>
					<div class="panel-heading-btn">
						<a href="javascript:;" class="btn btn-xs btn-icon btn-default"
							data-toggle="panel-expand" data-bs-original-title="" title=""
							data-tooltip-init="true"><i class="fa fa-expand"></i></a> <a
							href="javascript:;" class="btn btn-xs btn-icon btn-success"
							data-toggle="panel-reload" data-bs-original-title="" title=""
							data-tooltip-init="true"><i class="fa fa-redo"></i></a> <a
							href="javascript:;" class="btn btn-xs btn-icon btn-warning"
							data-toggle="panel-collapse" data-bs-original-title="" title=""
							data-tooltip-init="true"><i class="fa fa-minus"></i></a> <a
							href="javascript:;" class="btn btn-xs btn-icon btn-danger"
							data-toggle="panel-remove" data-bs-original-title="" title=""
							data-tooltip-init="true"><i class="fa fa-times"></i></a>
					</div>
				</div>
				<!-- END panel-heading -->

				<!-- BEGIN panel-body -->
				<div class="panel-body">
					<!-- BEGIN table-responsive -->
					<div class="table-responsive">
						<table class="table table-hover mb-0 text-inverse">
							<thead>
								<tr>
									<th>#</th>
									<th>COP명</th>
									<th>토론방 수</th>
									<th>소유자</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="lcf" items="${largestCopFdList }">
									<tr>
										<td>${lcf.copCode }</td>
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
</body>

<script src="<%=request.getContextPath()%>/resources/js/index.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
<%-- <%@ include file="/WEB-INF/views/include/js.jsp"%> --%>
</html>