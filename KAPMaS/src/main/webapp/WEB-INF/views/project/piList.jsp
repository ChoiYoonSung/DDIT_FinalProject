<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>

<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" />

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net/js/jquery.dataTables.js"></script>

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
	
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
<body>
<div class="app-content">
		<div class="row" style="padding:20px">
			<div class="page-title has-bg col-md-10" style="padding: 0px">
				<h1 style="color: black;">${pro.pName } - 리스크&이슈</h1>
			</div>
		</div>
			<div class="panel panel-inverse">
				<div class="panel-heading">
					<div class="panel-title" style="height: 16px;"></div>
				</div>
				<div class="panel-body">
					<div class="col-12">
						<div class="panel panel-inverse">
							<div class="panel-body" style="padding: 0;">
								<div id="data-table-combine_wrapper"
									class="dataTables_wrapper dt-bootstrap4 no-footer">
									<div class="dataTables_wrapper dt-bootstrap">
										<div class="row">
											<div class="col-4">
											<c:if test="${fn:length(piList) eq 0 }">
											<br><br>
											<div class="note mb-2" id="start" style="margin: 20px; border: 0;">
												<div class="note-content text-end">
													<h4>
														<b>리스크가 없습니다.</b>
													</h4>
													<p>리스크를 등록하면 차트를 확인할 수 있습니다.</p>
												</div>
												<div class="note-icon">
													<i class="fa fa-lightbulb"></i>
												</div>
											</div>
											</c:if>
											<c:if test="${fn:length(piList) ne 0 }">
												<div id="apex-radial-bar-chart"></div>
											</c:if>
											</div>
											<div class="col-8 row">
												<c:if test="${auth ne 'OB' }">
													<c:if test="${pro.pEnabled eq '1'}">
														<div class="col-12">
															<button type="button" class="btn btn-primary me-1 mb-1" style="float: right;" onclick="OpenWindow('piRegistForm.do','이슈 등록',800,600);">이슈 등록</button>
														</div>
													</c:if>
												</c:if>
											<table id="data-table-combine2" class="table table-hover mb-0 text-inverse">
												<thead>
													<tr role="row">
														<th width="1%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1"  data-column-index="3"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															마일스톤
														</th>
														<th width="2%" class="sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="0"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															코드
														</th>
														<th width="3%" class="sorting_disabled" rowspan="1" colspan="1"
															data-column-index="1" aria-label="">
															등록자
														</th>
														<th width="5%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															이슈 제목
														</th>
														<th width="2%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="3"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															등록일
														</th>
														<th width="1%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="3"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															상태
														</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="pi" items="${piList }">
													<tr onclick="javascript:OpenWindow('<%=request.getContextPath() %>/project/piDetail/${pi.piCode }', '이슈&리스크 상세보기', '1000', '800');" style="cursor: pointer;">
														<td>${pi.piMileStone }</td>
														<td>${pi.piCode }</td>
														<td>${pi.empName }</td>
														<td>
															<c:if test="${fn:length(pi.piTitle) ge 10}">
																<c:out value="${fn:substring(pi.piTitle, 0, 10)}..."></c:out>
															</c:if>
															<c:if test="${fn:length(pi.piTitle) lt 10}">
																${pi.piTitle }
															</c:if>
														</td>
														<td>${pi.piRegDate }</td>
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
<script type="text/javascript">
var color = [];
var percent = ${piMileStonePercent};
var milestone = '${piMileStone}'.split(',');
var rndColor = ['#EE2737', '#06038D', '#DC3513', '#8E51A8', '#6B4C4C', '#483698', '#00C1D4', '#0857C3', '#AF272F', '#000000'];
for(var i = 0; i < milestone.length; i++){
	color.push(rndColor.pop());
}
var options1 = {
	    chart: { height: 300, type: 'radialBar' },
	    plotOptions: {
	      radialBar: {
	        offsetY: 100,
	        offsetX: 0,
	        startAngle: 0,
	        endAngle: 360,
	        hollow: { margin: 5, size: '50%', background: 'transparent', image: undefined},
	        dataLabels: { name: { show: false, }, value: { show: false, } }
	      }
	    },
	    colors: rndColor,
	    series: percent,
	    labels: milestone,
	    legend: {
	      show: true,
	      floating: true,
	      position: 'left',
	      offsetX: 0,
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
  options1
);

chart.render();

window.onload = function() {
	var el = document.getElementById('dom');
	el.setAttribute('hidden', '');
	
}

var options2 = {
	dom : '<"dataTables_wrapper dt-bootstrap"<"row"<"col-7 d-block justify-content-center"<"d-block d-lg-inline-flex me-0 me-md-3"l><"d-block d-lg-inline-flex"B>><"col-5 d-block justify-content-center"fr>>t<"row"<"col-5"i><"col-7"p>>>',
	buttons : [],
	responsive : true,
	colReorder : true,
	keys : true,
	rowReorder : true,
	select : true,
	order : [ [ 5, 'asc' ] ],
	ordering : true,
	serverSide : false,
	lengthMenu : [10, 25, 50]
};

if ($(window).width() <= 767) {
	options.rowReorder = false;
	options.colReorder = false;
}

$('#data-table-combine2').DataTable(options2);
</script>
</body>