<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>

<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" />

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net/js/jquery.dataTables.js"></script>

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
	
<link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">

<body>

<div class="app-content">
		<div class="row" style="padding:20px">
			<div class="page-title has-bg col-md-10" style="padding: 0px">
				<h1 style="color: black;">${pro.pName } - 업무보고</h1>
			</div>
		</div>
			<div class="row">
				<div class="col-12">
					<div class="panel panel-inverse">
						<div class="panel-heading">
							<div class="panel-title" style="height: 20px;"></div>
						</div>
						<div class="panel-body">
							<div class="panel panel-inverse">
								<div class="panel-body" style="padding: 0;">
									<div id="data-table-combine_wrapper"
										class="dataTables_wrapper dt-bootstrap4 no-footer">
										<div class="dataTables_wrapper dt-bootstrap">
											<div class="row">
												<div class="col-12">
												<c:if test="${auth ne 'OB'}">
													<c:if test="${pro.pEnabled eq '1'}">
													<button type="button" class="btn btn-primary me-1 mb-1" style="float: right;" onclick="OpenWindow('wrRegistForm.do','주간 업무 보고서 작성',800,640);">주간 업무 보고서 작성</button>
													</c:if>
												</c:if>
												</div>
												<div class="col-12">
											</div>
											<table id="data-table-combine1" class="table table-hover mb-0 text-inverse">
												<thead>
													<tr role="row">
														<th width="2%" class="sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="0"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															보고서 코드
														</th>
														<th width="5%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															제목
														</th>
														<th width="2%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="3"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															작성자
														</th>
														<th width="2%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="3"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															작성일
														</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="wr" items="${wrList }">
													<tr onclick="OpenWindow('wrDetail.do?wrCode=${wr.wrCode}','주간 업무 보고서','800','700');">
														<td>${wr.wrCode }</td>
														<td>${wr.wrTitle }</td>
														<td>${wr.empName }</td>
														<td>${wr.wrRegDate }</td>
													</tr>
												</c:forEach>
<%-- 												<c:if test="${empty wrList }"> --%>
<!-- 													<tr> -->
<!-- 														<td></td> -->
<!-- 														<td>등록된 보고서가 없습니다.</td> -->
<!-- 														<td></td> -->
<!-- 														<td></td> -->
<!-- 													</tr> -->
<%-- 												</c:if> --%>
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
				<div class="col-12">
					<div class="panel panel-inverse">
						<div class="panel-heading">
							<div class="panel-title" style="height: 16px;"></div>
						</div>
						<div class="panel-body">
							<div class="panel panel-inverse">
								<div class="panel-body" style="padding: 0;">
									<div id="data-table-combine_wrapper"
										class="dataTables_wrapper dt-bootstrap4 no-footer">
										<div class="dataTables_wrapper dt-bootstrap">
											<div class="row">
												<div class="col-12">
												<c:if test="${auth ne 'OB' }">
													<c:if test="${pro.pEnabled eq '1'}">
														<button type="button" class="btn btn-primary me-1 mb-1" style="float: right;" onclick="OpenWindow('drRegistForm.do','일일 업무 보고서 작성',800,450);">일일 업무 보고서 작성</button>
													</c:if>
												</c:if>
												</div>
												<div class="col-12">
											</div>
											<table id="data-table-combine2" class="table table-hover mb-0 text-inverse">
												<thead>
													<tr role="row">
														<th width="3%" class="sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="0"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															보고서 코드
														</th>
														<th width="5%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															제목
														</th>
														<th width="3%" data-orderable="false"
															class="sorting_disabled" rowspan="1" colspan="1"
															data-column-index="1" aria-label="">
															작성자
														</th>
														<th width="1%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="3"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															작성일
														</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="dr" items="${drList }">
													<tr  onclick="OpenWindow('drDetail.do?drCode=${dr.drCode}','일일 업무 보고서','800','430');">
														<td>${dr.drCode }</td>
														<td>${dr.drTitle }</td>
														<td>${dr.empName }</td>
														<td>${dr.drRegDate }</td>
													</tr>
												</c:forEach>
												<%-- <c:if test="${empty drList }">
													<tr>
														<td></td>
														<td>등록된 보고서가 없습니다.</td>
														<td></td>
														<td></td>
													</tr>
												</c:if> --%>
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
	dom : '<"dataTables_wrapper dt-bootstrap"<"row">t<"row"<"col-5"i><"col-7"p>>>',
	buttons : [],
	responsive : true,
	colReorder : true,
	keys : true,
	rowReorder : true,
	select : true,
	order : [ [ 0, 'asc' ] ],
	ordering : true,
	serverSide : false,
	lengthMenu : [10, 25, 50]
};

if ($(window).width() <= 767) {
	options.rowReorder = false;
	options.colReorder = false;
}

$('#data-table-combine1').DataTable(options);
$('#data-table-combine2').DataTable(options);
</script>
