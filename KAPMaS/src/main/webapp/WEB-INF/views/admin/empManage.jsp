<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<% 
int i = 0 ;
int b = 0;
%>
<head>


<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/0.6.5/js/min/perfect-scrollbar.jquery.min.js"></script>

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>

<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" />

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net/js/jquery.dataTables.js"></script>

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
	
<link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">

<style>
.pds-wrapper{
	margin: 0 auto;
	width:70%;
}
.pds-wrapper h2{
	text-align: center;
}
tr{
	border-color: #ffd900;
}
th:nth-child(n+3), td:nth-child(n+3){
	text-align: center;
}
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: #348fe2;
    border-color: #348fe2;
}
</style>
</head>
<body style=" background: white;">
	<div class="mailbox">

		<div class="mailbox-sidebar">
			<div class="mailbox-sidebar-header d-flex justify-content-center">
				<a href="#emailNav" data-bs-toggle="collapse"
					class="btn btn-inverse btn-sm me-auto d-block d-lg-none"> <i
					class="fa fa-cog"></i>
				</a> <a href="<%=request.getContextPath() %>/admin/SmailRegistForm.do"
					class="btn btn-inverse ps-40px pe-40px btn-sm">전사원 쪽지</a>
			</div>
			<div class="mailbox-sidebar-content collapse d-lg-block"
				id="emailNav">

				<div data-scrollbar="true" data-height="100%"
					data-skip-mobile="true" class="ps" data-init="true"
					style="height: 100%;">
					<div class="nav-title">
						<b>FOLDERS</b>
					</div>
					<ul class="nav nav-inbox">
						<li class="active"><a href="#"><i class="fa fa-hdd fa-lg fa-fw me-2"></i> 
						전체 사원 목록 <span class="badge bg-gray-600 fs-10px rounded-pill ms-auto fw-bolder pt-4px pb-5px px-8px"></span></a></li>
						<li><a href="<%=request.getContextPath() %>/admin/sendmail.do"><i class="fa fa-envelope fa-lg fa-fw me-2"></i> 발신함</a></li>
					</ul>
				</div>
			</div>
		</div>


		<div class="mailbox-content">
			<div class="mailbox-content-header">

				<div class="btn-toolbar align-items-center">
					<div class="form-check me-2">
					</div>
					<div class="btn-group">
						&nbsp;&nbsp;&nbsp;
						<button class="btn btn-sm btn-white" onclick="CloseWindow();">
							<span class="hidden-xs" >닫기</span>
						</button>
					</div>
				</div>

			</div>
			
			<div class="mailbox-content-body" style="padding: 10px;">
			<div data-scrollbar="true" data-height="100%" data-skip-mobile="true">
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
															사원 아이디
														</th>
														<th width="3%" data-orderable="false"
															class="sorting_disabled" rowspan="1" colspan="1"
															data-column-index="1" aria-label="">
															사원 이름
														</th>
														<th width="5%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															사원 이메일
														</th>
														<th width="5%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															사원 전화번호
														</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${empList }" var="emp" >
													<tr>
														<td>${emp.empId}</td>
														<td>${emp.empName}</td>
														<td>${emp.empEmail}</td>
														<td>${emp.empPhone}</td>
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
<% i=0; %>	
<% b=0; %>	
<input id="hobbyList" hidden="" name="hobbyList" value="">

	<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/vendor.min.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/app.min.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/theme/default.min.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/demo/email-inbox.demo.js" type="b2d3d270220a6d87af2689e5-text/javascript"></script>


<script type="bb927df14e4b0356ad5b69fe-text/javascript">
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-53034621-1', 'auto');
		ga('send', 'pageview');

	</script>
<script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js" data-cf-settings="bb927df14e4b0356ad5b69fe-|49" defer=""></script><script defer src="https://static.cloudflareinsights.com/beacon.min.js" data-cf-beacon='{"rayId":"66f2ccb658aadd8f","version":"2021.6.0","r":1,"token":"4db8c6ef997743fda032d4f73cfeff63","si":10}'></script>

<ul id="ui-id-1" tabindex="0" class="ui-menu ui-widget ui-widget-content ui-autocomplete ui-front tagit-autocomplete" style="display: none;"></ul>
<div role="status" aria-live="assertive" aria-relevant="additions" class="ui-helper-hidden-accessible"></div>
<div class="note-modal-backdrop" style="display: none;"></div>
	
	
	
	<script>
	
	var options = {
			dom : '<"dataTables_wrapper dt-bootstrap"<"row"<"col-7 d-block justify-content-center"<"d-block d-lg-inline-flex me-0 me-md-3"l><"d-block d-lg-inline-flex"B>><"col-5 d-block justify-content-center"fr>>t<"row"<"col-5"i><"col-7"p>>>',
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

		$('#data-table-combine').DataTable(options);

	
	function palist_go(page, url) {

		if (!url)
			url = "receivemail.do";

		var jobForm = $('#jobForm');
		jobForm.find("[name='page']").val(page);
		jobForm.find("[name='keyword']").val(
				$('div.input-group>input[name="keyword"]').val());

		$('form#jobForm').attr({
			action : url,
			method : 'get'
		}).submit();

	}
	</script>
	
</body>


