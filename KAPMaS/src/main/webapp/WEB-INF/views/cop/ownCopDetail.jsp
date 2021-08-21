<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<head>

<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>

<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-colreorder-bs4/css/colReorder.bootstrap4.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-keytable-bs4/css/keyTable.bootstrap4.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-rowreorder-bs4/css/rowReorder.bootstrap4.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-select-bs4/css/select.bootstrap4.min.css"
	rel="stylesheet" />

<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net/js/jquery.dataTables.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-colreorder/js/dataTables.colReorder.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-colreorder-bs4/js/colReorder.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-keytable-bs4/js/keyTable.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-rowreorder/js/dataTables.rowReorder.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-rowreorder-bs4/js/rowReorder.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-select/js/dataTables.select.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-select-bs4/js/select.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/dataTables.buttons.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.colVis.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.flash.min.js"></script>
<!-- <script -->
<%-- 	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.html5.js"></script> --%>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.print.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/pdfmake/build/vfs_fonts.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jszip/dist/jszip.min.js"></script>

<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/css/forum/app.min.css"
	rel="stylesheet">

<style>
li {
	font-size: 17px;
}

#dom {
	box-shadow: 2px 2px 10px silver;
	border-radius: 10px;
	padding: 17px;
}
</style>

</head>
<body style="background-color: #dee2e6;">
	<div class="row" style="margin: 0px;">
		<div class="col-xl-12 ui-sortable">
					<br> <a onclick="javascript:history.go(-1)" style="cursor: pointer;"><i
				class="ion ion-md-arrow-round-back fa-2x fa-fw float-start me-10px text-black-lighter"></i></a>
			<h1 class="page-header">소유중 Cop</h1>
			<div class="panel panel-inverse" data-sortable-id="ui-media-object-1"
				data-init="true">
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">COP 목록</h4>
				</div>
				<div class="panel-body">
					<div class="col-xl-12 ui-sortable">
						<div class="panel panel-inverse">
							<div class="panel-body">
								<div id="data-table-combine_wrapper"
									class="dataTables_wrapper dt-bootstrap4 no-footer">
									<div class="dataTables_wrapper dt-bootstrap">
										<div class="row">
											<table id="data-table-combine"
												class="table table-striped table-bordered align-middle">
												<thead>
													<tr role="row">
														<th width="25%" class="sorting sorting_desc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="0"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">#</th>
														<th width="25%" data-orderable="false"
															class="sorting_disabled" rowspan="1" colspan="1"
															data-column-index="1" aria-label="">Cop명</th>
														<th width="25%" class="text-nowrap sorting sorting_desc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">참여자 수</th>
														<th width="25%" class="text-nowrap sorting sorting_desc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="3"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">소유자</th>
													</tr>
												</thead>
												<tbody>
													<c:set var="occ" value="${ownCopCnt}" />
													<c:set var="ocv" value="${ownCopVO}" />
													<c:forEach var="ocv" items="${ownCopVO}" begin="0" end="${fn:length(ownCopVO)}" varStatus="status">
														<tr onclick="OpenWindow('detail/${ocv.copCode}','${ocv.copName}','1130','700');" style="cursor: pointer;">
															<td>${ocv.copCode }</td>
															<td>${ocv.copName }</td>
															<td>${occ[status.index].copPersonnel}</td>
															<td>${ocv.copOwner }</td>
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
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	window.onload = function() {
		var el = document.getElementById('dom');
		el.setAttribute('hidden', '');
	}
		
	var options = {
			dom : '<"dataTables_wrapper dt-bootstrap"<"row"<"col-xl-12 d-xl-block justify-content-center"fr>>t<"row"<"col-md-5"i><"col-md-7"p>>>',
			buttons : [ {
				extend : 'copy',
				className : 'btn-sm'
			}, {
				extend : 'csv',
				className : 'btn-sm'
			}, {
				extend : 'excel',
				className : 'btn-sm'
			}, {
				extend : 'pdf',
				className : 'btn-sm'
			}, {
				extend : 'print',
				className : 'btn-sm'
			} ],
			keys : true,
			order : [ [ 0, 'desc' ] ],
			ordering : true,
			serverSide : false,
			lengthMenu : [10, 25, 50]
		};

	if ($(window).width() <= 767) {
		options.rowReorder = false;
		options.colReorder = false;
	}

	$('#data-table-combine').DataTable(options);
	</script>
</body>