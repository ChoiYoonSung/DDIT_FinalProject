<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body style="background-color: #f0f4f7;">
	<div class="app-content">
		<div class="row">
			<div class="page-title has-bg" style="padding: 0px">
				<h1 style="color: black;">&nbsp;Q & A</h1>
			</div>
			<div class="col-12 ui-sortable">
				<div class="panel panel-inverse"
					data-sortable-id="ui-media-object-1" data-init="true">
					<div class="panel-heading ui-sortable-handle">
						<h4 class="panel-title">Q & A 목록</h4>
						<button class="btn btn-primary" onclick="javascript:OpenWindow('<%=request.getContextPath()%>/center/qna/RegistForm.do', 'test', '1000', '800')">QNA 등록</button>
					</div>
					<div class="panel-body" style="height: 725px;">
						<div class="col-xl-12 ui-sortable">
							<div class="panel panel-inverse">
								<div class="panel-body">
									<div id="data-table-combine_wrapper"
										class="dataTables_wrapper dt-bootstrap4 no-footer">
										<div class="dataTables_wrapper dt-bootstrap">
											<div class="row">
												<table id="data-table-combine1"
													class="table table-hover mb-0 text-inverse">
													<thead>
														<tr role="row" style="text-align:center;">
															<th width="15%">순번</th>
															<th width="40%">제목</th>
															<th width="15%">작성자</th>
															<th width="15%">작성일</th>
															<th width="15%">조회수</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="qna" items="${qnaList}">
															<tr  style="text-align:center;" onclick="javascript:OpenWindow('<%=request.getContextPath()%>/center/qna/${qna.qnaNo}','dd','1000', '800');">
																<td>${qna.qnaNo }</td>
																<td  style="text-align:left;">${qna.qnaTitle}</td>
																<td>${qna.empName}</td>
																<td>${qna.qnaRegdate}</td>
																<td>${qna.qnaViewcnt}</td>
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
	<script>
		var options = {
			dom : '<"dataTables_wrapper dt-bootstrap"<"row"<"col-xl-12 d-xl-block justify-content-center"fr>>t<"row"<"col-md-5"i><"col-md-7"p>>>',
			buttons : [],
			pageLength : 10,
			keys : true,
			bLengthChange : false,
			order : [ [ 0, 'desc' ] ],
			ordering : true,
			serverSide : false,
			lengthMenu : false
		};

		$('#data-table-combine1').DataTable(options);
	</script>
</body>
