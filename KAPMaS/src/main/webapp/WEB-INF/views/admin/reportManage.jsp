<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>

<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" />

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net/js/jquery.dataTables.js"></script>

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
	
<link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">
	<div class="row" style="margin: 0px;">
		<div class="col-xl-12 ui-sortable">
			<!-- <br> <a onclick="javascript:history.go(-1)"> 
			<i	class="ion ion-md-arrow-round-back fa-2x fa-fw float-start me-10px text-black-lighter"></i>
			</a>
			<h1 class="page-header">뒤로가기</h1> -->
			<div class="panel panel-inverse"
				data-init="true">
				<div class="panel-heading">
					<h4 class="panel-title">신고된 게시글</h4>
					<a href="javascript:CloseWindow();" class="btn btn-gray">닫기</a>
				</div>
				<div class="panel-body">
					<div class="col-xl-12 ui-sortable">
						<div class="panel panel-inverse">
							<div class="panel-body" style="height: 670px;">
								<div id="data-table-combine_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
									<div class="dataTables_wrapper dt-bootstrap">
										<div class="row">
											<table id="data-table-combine" class="table table-striped table-bordered align-middle">
												<thead>
													<tr role="row">
														<th width="3%" class="sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="0"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															게시판 이름
														</th>
														<th width="3%" data-orderable="false"
															class="sorting_disabled" rowspan="1" colspan="1"
															data-column-index="1" aria-label="">
															게시글 코드
														</th>
														<th width="5%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															제목
														</th>
														<th width="1%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="3"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															작성자
														</th>
														<th width="1%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1"  data-column-index="3"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															신고수
														</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="report" items="${reportList }">
													<tr onclick="location.href='<%=request.getContextPath() %>/admin/reportDetail/${report.bdCode }'">
														<td>${report.rpBdName }</td>
														<td>${report.bdCode }</td>
														<td>${report.rpTitle }</td>
														<td>${report.empId }</td>
														<td>${report.rpCount }</td>
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
var options = {
	dom : '<"dataTables_wrapper dt-bootstrap"<"row"<"col-7 d-block justify-content-center"<"d-block d-lg-inline-flex me-0 me-md-3"l><"d-block d-lg-inline-flex"B>><"col-5 d-block justify-content-center"fr>>t<"row"<"col-5"i><"col-7"p>>>',
	buttons : [],
	responsive : true,
	colReorder : true,
	keys : true,
	rowReorder : true,
	select : true,
	order : [ [ 4, 'asc' ] ],
	ordering : true,
	serverSide : false,
	lengthMenu : [10, 25, 50]
};

$('#data-table-combine').DataTable(options);

function selectReport(){
	
}
</script>





