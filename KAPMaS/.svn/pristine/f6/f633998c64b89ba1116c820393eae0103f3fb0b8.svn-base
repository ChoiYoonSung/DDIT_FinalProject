<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% int b = 0 ; %>

<head>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>

<link	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css"	rel="stylesheet" />
<link	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"	rel="stylesheet" />
<link	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css"	rel="stylesheet" />
<link	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-colreorder-bs4/css/colReorder.bootstrap4.min.css"	rel="stylesheet" />
<link	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-keytable-bs4/css/keyTable.bootstrap4.min.css"	rel="stylesheet" />
<link	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-rowreorder-bs4/css/rowReorder.bootstrap4.min.css"	rel="stylesheet" />
<link	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-select-bs4/css/select.bootstrap4.min.css"	rel="stylesheet" />

<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net/js/jquery.dataTables.js"></script>

<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-colreorder/js/dataTables.colReorder.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-colreorder-bs4/js/colReorder.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-keytable-bs4/js/keyTable.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-rowreorder/js/dataTables.rowReorder.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-rowreorder-bs4/js/rowReorder.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-select/js/dataTables.select.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-select-bs4/js/select.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/dataTables.buttons.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.colVis.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.flash.min.js"></script>
<!-- <script -->
<%-- 	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.html5.js"></script> --%>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.print.js"></script>

<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/pdfmake/build/vfs_fonts.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jszip/dist/jszip.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jstree/dist/themes/default/style.min.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jstree/dist/jstree.min.js"></script>


<style>
.project-wrapper{
	margin-top:20px; overflow:auto; 
	padding: 10px;
}

li {

	font-size: 17px;
}
#dom {
	box-shadow: 2px 2px 10px silver;
	border-radius: 10px;
	padding: 17px;
}
.project-item{
	box-shadow: 2px 2px 10px silver;
    margin-right: 30px;
    width: 270px;
    height: 150px;
    background: white;
    padding: 17px;
    border-radius: 10px;
    margin-top: 8px;
}
.bg-white-transparent-1 {
    background-color: rgb(0 0 0 / 10%) !important;
}
 .project-container {
    width: 95%;
    height: 200px;
    overflow: auto;
    white-space: nowrap;
  }
  .project-container li{
  display:inline-block;
  }
  .project-container::-webkit-scrollbar {
    width: 10px;
  }
  .project-container::-webkit-scrollbar-thumb {
    background-color: #2f3542;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
  .project-container::-webkit-scrollbar-track {
    background-color: grey;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }
  
</style>

</head>
<body>


<div class="row" style="margin: 0 auto;">
			<div class="project-wrapper" style="width: 48%;">
				<div class="panel panel-inverse" data-sortable-id="index-6">
					<div class="panel-heading ui-sortable-handle">
						<h4 class="panel-title">Analytics Details</h4>
						<div class="panel-heading-btn">
							<a href="javascript:;" class="btn btn-xs btn-icon btn-default"
								data-toggle="panel-expand"><i class="fa fa-expand"></i></a>
						</div>
					</div>
					<div class="table-responsive">
<!-- --------------------------------------------------------------------------------------------------------------- -->
			
			<div class="widget widget-stats bg-blue">
						<div class="stats-icon">
							<i class="fa fa-desktop"></i>
						</div>
						<div class="stats-info">
							<h4>${proi.pName }</h4>
							<p>전체 업무 리스트</p>
						</div>
						<div class="stats-link">
							<a href="<%=request.getContextPath() %>/project/jobmanage.do">View Detail <i
								class="fa fa-arrow-alt-circle-right"></i></a>
						</div>
					</div>
			
			
			<c:forEach items="${serviceList}" var="service">
			<% 
			int aa =((int)(Math.random()*5)+1); 
			String col="";
			switch(aa){
			case 1:
				col="blue";
				break;
			case 2:
				col="info";
				break;
			case 3:
				col="orange";
				break;
			case 4:
				col="red";
				break;
			case 5:
				col="black";
				break;
			}
			%>
					<div class="widget widget-stats bg-<%=col%>">
						<div class="stats-icon">
							<i class="fa fa-desktop"></i>
						</div>
						<div class="stats-info">
							<h4>${proi.pName }</h4>
							<p>${service }</p>
						</div>
						<div class="stats-link">
							<a href="<%=request.getContextPath() %>/project/jobSelectList.do?key=${service }">View Detail <i
								class="fa fa-arrow-alt-circle-right"></i></a>
						</div>
					</div>
			</c:forEach>
<!-- --------------------------------------------------------------------------------------------------------------- -->
				</div>
			</div>
		</div>


<!-- --------------------------------------------------------------------------------------------------------------- -->


		<div class="project-wrapper" style="width: 48%;">
	<div class="panel panel-inverse" data-sortable-id="index-6">
			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">Analytics Details</h4>
				<div class="panel-heading-btn">
					<a href="javascript:;" class="btn btn-xs btn-icon btn-default"
						data-toggle="panel-expand"><i class="fa fa-expand"></i></a>
				</div>
			</div>
			<div class="table-responsive">

<div class="panel panel-inverse" style="width: 95%;">
							<div class="panel-body">
								<div
									class="col-xl-12 d-block d-sm-flex d-xl-block justify-content-center"
									style="margin: 15px 25px 15px 0px;">
									<button class="btn btn-yellow me-1 mb-1" tabindex="0"
										aria-controls="data-table-combine" type="button"
										id="registBtn"
										onclick="OpenWindow('jobRegistForm.do','업무 등록',800,700);">
										<span>등록</span>
									</button>
								</div>
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
															colspan="1" style="width: 6px;" data-column-index="0"
															aria-label=": activate to sort column descending"
															aria-sort="ascending" id="hiding01"></th>	
														<th width="1%" class="sorting sorting_desc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" style="width: 15px;" data-column-index="0"
															aria-label=": activate to sort column descending"
															aria-sort="ascending">No</th>
														<!-- <th width="5%" data-orderable="false"
															class="sorting_disabled" rowspan="1" colspan="1"
															style="width: 22px;" data-column-index="1" aria-label=""></th> -->
														<th class="text-nowrap sorting sorting_desc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" style="width: 104px;" data-column-index="2"
															aria-label="Rendering engine: activate to sort column ascending"
															aria-sort="descending">업무 이름</th>
														<th class="text-nowrap sorting" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" style="width: 118px;" data-column-index="3"
															aria-label="Browser: activate to sort column ascending">담당자</th>
														<th class="text-nowrap sorting" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" style="width: 109px;" data-column-index="4"
															aria-label="Platform(s): activate to sort column ascending">시작일</th>
														<th class="text-nowrap sorting" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" style="width: 87px;" data-column-index="5"
															aria-label="Engine version: activate to sort column ascending">완료일</th>
														<th class="text-nowrap sorting" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" style="width: 58px;" data-column-index="6"
															aria-label="CSS grade: activate to sort column ascending">진척도</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach items="${jobList}" var="job">
													<tr onclick="OpenWindow('detail.do','상세보기',1000,1100);">
														<td width="1%" class="fw-bold text-inverse dtr-control hide"
															tabindex="0" id="hiding02">
															<div id="hiding03"
																style="position: absolute; height: 1px; width: 0px; overflow: hidden;">
																<input type="text" tabindex="0">
															</div><%=b++ %></td>
														<td width="1%" class="fw-bold text-inverse dtr-control"
															tabindex="0">
															<div
																style="position: absolute; height: 1px; width: 0px; overflow: hidden;">
																<input type="text" tabindex="0">
															</div>${job.jobCode}</td>
														<!-- <td width="1%"></td> -->
														<td class="sorting_1">${job.jobName}</td>
														<td>${job.empId}</td>
														<td>${job.jobStartdate}</td>
														<td>${job.jobEnddate}</td>
														<td>${job.jobPrograss}</td>
													</tr>
													
												</c:forEach>
												<c:if test="${empty jobList}" >
													없습니다.
												</c:if>
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



<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/js/vendor.min.js" type="6fa72fa030d19bea1f3dc6bb-text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/js/app.min.js" type="6fa72fa030d19bea1f3dc6bb-text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/js/theme/default.min.js" type="6fa72fa030d19bea1f3dc6bb-text/javascript"></script>


<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/@highlightjs/cdn-assets/highlight.min.js" type="6fa72fa030d19bea1f3dc6bb-text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/js/demo/render.highlight.js" type="6fa72fa030d19bea1f3dc6bb-text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jstree/dist/jstree.min.js" type="6fa72fa030d19bea1f3dc6bb-text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap./assets/js/demo/ui-tree.demo.js" type="6fa72fa030d19bea1f3dc6bb-text/javascript"></script>

<script type="6fa72fa030d19bea1f3dc6bb-text/javascript">
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-53034621-1', 'auto');
		ga('send', 'pageview');

	</script>
<script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js" data-cf-settings="6fa72fa030d19bea1f3dc6bb-|49" defer=""></script><script defer src="https://static.cloudflareinsights.com/beacon.min.js" data-cf-beacon='{"rayId":"670faf0938ea5647","version":"2021.6.0","r":1,"token":"4db8c6ef997743fda032d4f73cfeff63","si":10}'></script>


<script type="text/javascript">

window.onload=function(){
	
	  $("#jstree-default").jstree({
		    "plugins": ["types"],
		    "core": {
		      "themes": { "responsive": false  }            
		      },
		    "types": {
		      "default": { "icon": "fa fa-folder text-warning fa-lg" },
		      "file": { "icon": "fa fa-file text-inverse fa-lg" }
		    }
		  });
	  
}





var options = {
		dom : '<"dataTables_wrapper dt-bootstrap"<"row"<"col-xl-7 d-block d-sm-flex d-xl-block justify-content-center"<"d-block d-lg-inline-flex me-0 me-md-3"l><"d-block d-lg-inline-flex"B>><"col-xl-5 d-flex d-xl-block justify-content-center"fr>>t<"row"<"col-md-5"i><"col-md-7"p>>>',
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
		responsive : true,
		colReorder : true,
		keys : true,
		rowReorder : true,
		select : true
	};

	if ($(window).width() <= 767) {
		options.rowReorder = false;
		options.colReorder = false;
	}

	$('#data-table-combine').DataTable(options);

			$(document).ready(function() {
				$('#hiding01').attr('style', "display:none;");  //숨기기
				$('.fw-bold text-inverse dtr-control hide').attr('style', "display:none;");  //숨기기

			});

	
</script>





</body>

























