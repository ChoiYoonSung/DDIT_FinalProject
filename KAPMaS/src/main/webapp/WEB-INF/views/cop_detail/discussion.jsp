<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<head>

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-colreorder-bs4/css/colReorder.bootstrap4.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-keytable-bs4/css/keyTable.bootstrap4.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-rowreorder-bs4/css/rowReorder.bootstrap4.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-select-bs4/css/select.bootstrap4.min.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net/js/jquery.dataTables.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-colreorder/js/dataTables.colReorder.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-colreorder-bs4/js/colReorder.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-keytable-bs4/js/keyTable.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-rowreorder/js/dataTables.rowReorder.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-rowreorder-bs4/js/rowReorder.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-select/js/dataTables.select.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-select-bs4/js/select.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/dataTables.buttons.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.colVis.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.print.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/pdfmake/build/vfs_fonts.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jszip/dist/jszip.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">

<style>
#dom {
	box-shadow: 2px 2px 10px silver;
	border-radius: 10px;
	padding: 17px;
}
</style>
<!-- #modal-dialog -->
</head>
<body>
	<div class="row" style="margin: 0px;">
		<div class="col-xl-12 ui-sortable">
			<!-- <br> <a onclick="javascript:history.go(-1)"> 
			<i	class="ion ion-md-arrow-round-back fa-2x fa-fw float-start me-10px text-black-lighter"></i>
			</a>
			<h1 class="page-header">뒤로가기</h1> -->
			<div class="panel panel-inverse" data-sortable-id="ui-media-object-1"
				data-init="true">
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">자료 목록</h4>
					<a href="#modal-dialog" class="btn btn-primary" data-bs-toggle="modal">토론방 개설</a>
				</div>
				<div class="panel-body">
					<div class="col-xl-12 ui-sortable">
						<div class="panel panel-inverse">
							<div class="panel-body">
								<div id="data-table-combine_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
									<div class="dataTables_wrapper dt-bootstrap">
										<div class="row">
											<h4>진행중인 토론방</h4>
											<table id="data-table-combine1" class="table table-striped table-bordered align-middle">
												<thead>
													<tr role="row">
														<th width="25%" class="sorting sorting_desc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="0"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">제목</th>
														<th width="25%" data-orderable="false"
															class="sorting_disabled" rowspan="1" colspan="1"
															data-column-index="1" aria-label="">주제</th>
														<th width="25%" class="text-nowrap sorting sorting_desc"
															tabindex="0" aria-controls="data-table-combine"
															rowspan="1" colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">개설자</th>
														<th width="25%" class="text-nowrap sorting sorting_desc"
															tabindex="0" aria-controls="data-table-combine"
															rowspan="1" colspan="1" data-column-index="3"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">개설일</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="cfl" items="${copFdisList}">
														<tr onclick="javascript:location.href='<%=request.getContextPath()%>/cop/detail/discussion/fdisDetail/${cfl.fdisCode}';" style="cursor: pointer;">
															<td>${cfl.fdisName }</td>
															<td>${cfl.fdisSubject }</td>
															<td>${cfl.fdisMaker}</td>
															<td>${cfl.fdisRegdate}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<hr style="margin-top: 10px;">
											<h4>내가 생성한 토론방</h4>
											<table id="data-table-combine2" class="table table-striped table-bordered align-middle">
												<thead>
													<tr role="row">
														<th width="30%" class="sorting sorting_desc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="0"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">제목</th>
														<th width="30%" data-orderable="false"
															class="sorting_disabled" rowspan="1" colspan="1"
															data-column-index="1" aria-label="">주제</th>
														<th width="30%" class="text-nowrap sorting sorting_desc"
															tabindex="0" aria-controls="data-table-combine"
															rowspan="1" colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">개설일</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="ocfl" items="${ownCopFdisList}">
														<tr onclick="javascript:location.href='<%=request.getContextPath()%>/cop/detail/discussion/fdisDetail/${ocfl.fdisCode}';"
															style="cursor: pointer;">
															<td>${ocfl.fdisName }</td>
															<td>${ocfl.fdisSubject}</td>
															<td>${ocfl.fdisRegdate}</td>
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
	<div class="modal fade" id="modal-dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">토론방 개설</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
				</div>
				<div class="modal-body">
					<form action="createFdis.do" role="form" method="post">
						<input type="hidden" id="copCode" name="copCode" value="${copCode}">
						<h5>토론방 제목</h5>
						<input type="text" class="form-control" placeholder="토론방 제목을 입력하세요." id="fdisName" name="fdisName">
						<br>						
						<h5>토론방 주제</h5> 
						<input type="text" class="form-control" placeholder="토론방 주제를 입력하세요." id="fdisSubject" name="fdisSubject">
					</form>
				</div>
				<div class="modal-footer">
					<a href="javascript:;" class="btn btn-white" data-bs-dismiss="modal">취소</a>
					<a href="javascript:;" class="btn btn-success" onclick="createFdis();">개설</a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		function createFdis() {
			var name = $('input[id="fdisName"]').val()
			var subject = $('input[id="fdisSubject"]').val()
			swal({
				title : '토론방 개설',
				text : '토론방을 개설하시겠습니까?',
				icon : 'info', // primary success warning danger
				buttons : {
					cancel : {
						text : '취소',
						value : false,
						visible : true,
						className : 'btn btn-default',
						closeModal : true,
					},
					confirm : {
						text : '확인',
						value : true,
						visible : true,
						className : 'btn btn-primary',
						closeModal : true
					}
				}
			}).then(function(val) {
				if (val == true) {
					if (name == "" || subject == "") {
						swal({
							title : '경고',
							text : '제목, 주제는 필수 입력란입니다.',
							icon : 'warning', // primary success warning error
							buttons : {
								confirm : {
									text : '확인',
									value : true,
									visible : true,
									className : 'btn btn-warning',
									closeModal : true
								}
							}
						});
						return;
					}
					$('form[role="form"]').submit();
				}
			});
		}

		var options = {
			dom : '<"dataTables_wrapper dt-bootstrap"<"row"<"col-xl-12 d-xl-block justify-content-center"fr>>t<"row"<"col-md-5"i><"col-md-7"p>>>',
			buttons : [],
			pageLength : 5,
			keys : true,
			bLengthChange : false,
			order : [ [ 0, 'desc' ] ],
			ordering : true,
			serverSide : false,
			lengthMenu : false
		};

		$('#data-table-combine1').DataTable(options);

		$('#data-table-combine2').DataTable(options);

		if ($(window).width() <= 767) {
			options.rowReorder = false;
			options.colReorder = false;
		}
	</script>
</body>