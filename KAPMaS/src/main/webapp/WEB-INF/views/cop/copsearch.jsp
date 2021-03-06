<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>

<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" rel="stylesheet" />
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


<style>
#dom {
	box-shadow: 2px 2px 10px silver;
	border-radius: 10px;
	padding: 17px;
}
</style>

</head>
<body>
	<div class="app-content"> 
		<div class="row">
			<div class="col-xl-12 ui-sortable">
				<h1 class="page-header">COP ??????</h1>
				<div class="panel panel-inverse" data-sortable-id="ui-media-object-1"
					data-init="true">
					<div class="panel-heading ui-sortable-handle">
						<h4 class="panel-title">COP ??????</h4>
						<a onclick="javascript:OpenWindow('<%=request.getContextPath()%>/cop/makecop.do', 'makeCop', '900', '750')" class="btn btn-primary" data-bs-toggle="modal">COP ??????</a>
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
															<th width="1%" class="sorting sorting_desc" tabindex="0"
																aria-controls="data-table-combine" rowspan="1"
																colspan="1" data-column-index="0"
																aria-label=": activate to sort column ascending"
																aria-sort="descending">#</th>
															<th width="1%" data-orderable="false"
																class="sorting_disabled" rowspan="1" colspan="1"
																data-column-index="1" aria-label="">?????????
																??????</th>
															<th width="5%" class="text-nowrap sorting sorting_desc" tabindex="0"
																aria-controls="data-table-combine" rowspan="1"
																colspan="1" style="width: 60px;" data-column-index="2"
																aria-label=": activate to sort column ascending"
																aria-sort="descending">??????</th>
															<th width="10%" style="width: 70px;" class="text-nowrap sorting sorting_desc" tabindex="0"
																aria-controls="data-table-combine" rowspan="1"
																colspan="1" data-column-index="3"
																aria-label=": activate to sort column ascending"
																aria-sort="descending">??????</th>
															<th width="5%" class="text-nowrap sorting" tabindex="0"
																aria-controls="data-table-combine" rowspan="1"
																colspan="1" data-column-index="4"
																aria-label="Browser: activate to sort column ascending">?????????</th>
															<th width="5%" class="text-nowrap sorting" tabindex="0"
																aria-controls="data-table-combine" rowspan="1"
																colspan="1" data-column-index="5"
																aria-label="Platform(s): activate to sort column ascending">?????????</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${copList}" var="cl" varStatus="status">
															<tr onclick="OpenWindow('copInfo/${cl.copCode}','${cl.copName}','500','800');">
																<td>${status.index+1}</td>
																<td>
																	<div style="width: 95px; height: 95px; background-repeat: no-repeat; background-size: cover; background-image: url('<%=request.getContextPath() %>/cop/getPictureByCode/${cl.copCode}'); background-repeat: no-repeat;" ></div>
																</td>
																<td>${cl.copName }</td>
																<td>${cl.copDetail }</td>
																<td class="sorting_1">${cl.copOwner}</td>
																<td width="1%">${cl.copRegdate }</td>
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
	</div>
	<script type="text/javascript">
		window.onload = function() {
			var el = document.getElementById('dom');
			el.setAttribute('hidden', '');
		}
		
		var options = {
			dom : '<"dataTables_wrapper dt-bootstrap"<"row"<"col-xl-12 d-xl-block justify-content-center"fr>>t<"row"<"col-md-5"i><"col-md-7"p>>>',
			buttons : [],
			responsive : true,
			colReorder : true,
			rowReorder : true,
			pageLength : 4,
			keys : true,
			bLengthChange : false,
			order : [ [ 0, 'desc' ] ],
			ordering : true,
			serverSide : false,
			lengthMenu : false
		};
	
		if ($(window).width() <= 767) {
			options.rowReorder = false;
			options.colReorder = false;
		}
	
		$('#data-table-combine').DataTable(options);
	
		$(document).ready(function() {
			$('#hiding01').attr('style', "display:none;");  //?????????
			$('.fw-bold text-inverse dtr-control hide').attr('style', "display:none;");  //?????????
	
		});
	</script>
</body>