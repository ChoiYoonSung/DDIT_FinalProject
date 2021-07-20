<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<!-- <script -->
<%-- 	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.html5.js"></script> --%>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.print.js"></script>

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/pdfmake/build/vfs_fonts.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jszip/dist/jszip.min.js"></script>
	
	
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/css/forum/app.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">

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
<body style="margin-top : 10px;">
	<div class="row" style="margin: 0px;">
			
		<div class="widget widget-stats bg-info">
			<div class="stats-icon">
				<i class="fa fa-users"></i>
			</div>
			<div class="stats-info">
				<p>Issue & Risk</p>
			</div>
			<div class="stats-link"></div>
		</div>
			
			<div class="col-12">
					<div class="panel panel-inverse" data-sortable-id="ui-media-object-1" data-init="true">
						<div class="panel-body">
						<div id="apex-radial-bar-chart"></div>
							<div class="col-xl-12 ui-sortable">
								<div class="panel panel-inverse">
									<div class="panel-body">
										<div id="data-table-combine_wrapper"
											class="dataTables_wrapper dt-bootstrap4 no-footer">
											<div class="dataTables_wrapper dt-bootstrap">
												<div class="row">
													<table id="data-table-combine" class="table table-striped table-bordered align-middle">
														<thead>
															<tr role="row">
																<th width="1%" class="sorting sorting_desc" tabindex="0"
																	aria-controls="data-table-combine" rowspan="1"
																	colspan="1" style="width: 6px;" data-column-index="0"
																	aria-label=": activate to sort column ascending"
																	aria-sort="descending">
																	이슈 코드
																</th>
																<th width="5%" data-orderable="false"
																	class="sorting_disabled" rowspan="1" colspan="1"
																	style="width: 22px;" data-column-index="1" aria-label="">
																	등록자
																</th>
																<th class="text-nowrap sorting sorting_desc" tabindex="0"
																	aria-controls="data-table-combine" rowspan="1"
																	colspan="1" style="width: 104px;" data-column-index="2"
																	aria-label=": activate to sort column ascending"
																	aria-sort="descending">
																	이슈 제목
																</th>
																<th class="text-nowrap sorting sorting_desc" tabindex="0"
																	aria-controls="data-table-combine" rowspan="1"
																	colspan="1" style="width: 104px;" data-column-index="3"
																	aria-label=": activate to sort column ascending"
																	aria-sort="descending">
																	등록일
																</th>
																<th class="text-nowrap sorting sorting_desc" tabindex="0"
																	aria-controls="data-table-combine" rowspan="1"
																	colspan="1" style="width: 104px;" data-column-index="3"
																	aria-label=": activate to sort column ascending"
																	aria-sort="descending">
																	마일스톤
																</th>
																<th class="text-nowrap sorting sorting_desc" tabindex="0"
																	aria-controls="data-table-combine" rowspan="1"
																	colspan="1" style="width: 104px;" data-column-index="3"
																	aria-label=": activate to sort column ascending"
																	aria-sort="descending">
																	상태
																</th>
															</tr>
														</thead>
														<tbody>
														<c:forEach var="pi" items="${piList }">
															<c:choose>
															<c:when test="${pi.piStatus == 1}">
																<tr onclick="javascript:OpenWindow('<%=request.getContextPath() %>/project/piDetail?piCode=${pi.piCode }', '이슈&리스크 상세보기', '1000', '800');" style="cursor: pointer;">
															</c:when>
															<c:when test="${pi.piStatus == 0}">
																<tr>
															</c:when>
															</c:choose>
																<td>${pi.piCode }</td>
																<td>${pi.empId }</td>
																<td>${pi.piTitle }</td>
																<td>${pi.piRegdate }</td>
																<td>${pi.piMilestone }</td>
																<td>${pi.piStatus eq 0 ? '완료' : '미완료' }</td>
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
	
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/apexcharts/dist/apexcharts.min.js"></script>
<script type="text/javascript">
var cnt = 0;

var color = [];
var percent = ${piMileStonePercent};
var milestone = '${piMileStone}'.split(',');
for(var i = 0; i < milestone.length; i++){
	var rnd = '#' + Math.round(Math.random() * 0xffffff).toString(16);
	color.push(rnd)
}

var options = {
	    chart: { height: 350, type: 'radialBar' },
	    plotOptions: {
	      radialBar: {
	        offsetY: -10,
	        startAngle: 0,
	        endAngle: 270,
	        hollow: { margin: 5, size: '30%', background: 'transparent', image: undefined},
	        dataLabels: { name: { show: false, }, value: { show: false, } }
	      }
	    },
	    colors: color,
	    series: percent,
	    labels: milestone,
	    legend: {
	      show: true,
	      floating: true,
	      position: 'left',
	      offsetX: 500,
	      offsetY: 0,
	      labels: { useSeriesColors: true },
	      markers: { size: 0 },
	      formatter: function(seriesName, opts) { 
	        return seriesName + " :  " + opts.w.globals.series[opts.seriesIndex] + "%"
	      },
	      itemMargin: { horizontal: 5 }
	    }
	  }

	  var chart = new ApexCharts(
	    document.querySelector('#apex-radial-bar-chart'),
	    options
	  );

	  chart.render();
	  
window.onload = function() {
	var el = document.getElementById('dom');
	el.setAttribute('hidden', '');
	
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
			select : true,
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

		$(document).ready(function() {
			$('#hiding01').attr('style', "display:none;"); //숨기기
			$('.fw-bold text-inverse dtr-control hide').attr('style',"display:none;"); //숨기기
		});
	</script>
</body>