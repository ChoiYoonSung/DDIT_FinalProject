<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">
<c:set value="${archiveList }" var="cal"/>
<style>
#dom {
	box-shadow: 2px 2px 10px silver;
	border-radius: 10px;
	padding: 17px;
}
</style>

</head>
<body>
	<div class="row" style="margin: 0px;">
		<div class="col-xl-12 ui-sortable">
			<!-- <br> 
			<a onclick="javascript:history.go(-1)">
			<i class="ion ion-md-arrow-round-back fa-2x fa-fw float-start me-10px text-black-lighter"></i>
			</a>
			<h1 class="page-header">뒤로가기</h1> -->
			<div class="panel panel-inverse" data-sortable-id="ui-media-object-1"
				data-init="true">
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">자료 목록</h4>
					<button type="button" onclick="pdsRegist();" class="btn btn-primary">자료 등록</button>
				</div>
				<div class="panel-body">
					<div class="col-xl-12 ui-sortable">
						<div class="panel panel-inverse">
							<div class="panel-body">
								<div id="data-table-combine_wrapper"
									class="dataTables_wrapper dt-bootstrap4 no-footer">
									<div class="dataTables_wrapper dt-bootstrap">
										<div class="row">
											<table id="data-table-combine" style="text-align:center;"
												class="table table-hover mb-0 text-inverse">
												<thead>
													<tr role="row">
														<th width="12%">#</th>
														<th width="50%">제목</th>
														<th width="12%">작성자</th>
														<th width="12%">작성일</th>
														<th width="12%">조회수</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="cal" items="${archiveList}">
														<tr
															onclick="javascript:location.href='pdsDetail/${cal.caCode}';"
															style="cursor: pointer;">
															<td>${cal.caCode }</td>
															<td style="text-align:left">${cal.caTitle }</td>
															<td>${cal.empName }</td>
															<td>${cal.caRegdate}</td>
															<td>${cal.caViewcnt }</td>
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
	
	function pdsRegist(){
		location.href = "pdsRegistForm/" + "${copCode}";
	}
	
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