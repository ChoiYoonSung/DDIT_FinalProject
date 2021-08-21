<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<title></title>
<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/countdown/jquery.countdown.css" rel="stylesheet">
<style>
.bg-white-transparent-1 {
    background-color: rgb(0 0 0 / 10%) !important;
}
.countdown-section {
    font-size: 120%;
}
.ht{
	height: 30px;
}
.countdown-show4 .countdown-section {
    width: 23.5%;
}
body .apexcharts-canvas .apexcharts-legend.position-bottom .apexcharts-legend-series+.apexcharts-legend-series, body .apexcharts-canvas .apexcharts-legend.position-top .apexcharts-legend-series+.apexcharts-legend-series {
    margin-left: 0.3rem!important;
}
</style>
</head>
<body>
<div class="app-content" style="padding-bottom: 0px;">
	<div class="row" style="padding:20px">
		<div class="page-title has-bg col-md-10" style="padding: 0px">
			<h1 style="color: black;">${pro.pName } - 대시보드</h1>
		</div>
	</div>
	<div class="row">
		<div style="width:25%;">
			<div class="panel panel-inverse">
				<div class="panel-heading">
					<div class="panel-title" style="height: 20px;">프로젝트 현황</div>
				</div>
				<div class="panel-body">
					<div class="project-item">
						<div style="height: 50px;">
							<h4
								style="width: 80%; color: black; float: left; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"><a href="#" style="text-decoration: none;">${pro.pName }</a></h4>
							<a href="#" onclick="OpenWindow('detail.do?pCode=${pro.pCode }','프로젝트 상세',825,900);" ><span
								class="badge bg-secondary"
								style="float: right; padding: 5px; width: 30px;">상세</span></a> <span
								class="badge bg-primary"
								style="float: right; margin-right: 5px; padding: 5px; width: 50px;">${pro.pmAuthority }</span>
						</div>
						<p style="color: black; white-space: normal; height: 15px;">주제 : ${pro.pTitle }</p>
						<p style="color: black; white-space: normal; height: 74px;">개요 : ${pro.pSummary }</p>
						<div class="d-flex align-items-center mb-2px">
							<div class="flex-grow-1">
								<div
									class="progress h-5px rounded-pill bg-white-transparent-1">
									<div class="progress-bar progress-bar-striped bg-indigo"
										data-animation="width" data-value="${tp }%" style="width: ${tp }%;"></div>
								</div>
							</div>
							<div class="ms-2 fs-11px w-30px text-center"
								style="color: black;">
								<span data-animation="number" data-value="${tp }">${tp }</span>%
							</div>
						</div>
						<p style="color: black; text-align: center;">${pro.pStartdate.split(' ')[0] }
							~ ${pro.pEnddate.split(' ')[0] }</p>
						<input type="hidden" id="end" value="${pro.pEnddate }">
						<div class="timer">
							<div id="timer">	
								<span class="countdown-row countdown-show4">
									<span class="countdown-section">
										<span class="countdown-amount" id="Days"></span>
										<span class="countdown-period">D</span>
									</span>
									<span class="countdown-section">
										<span class="countdown-amount" id="Hours"></span>
										<span class="countdown-period">H</span>
									</span>
									<span class="countdown-section">
										<span class="countdown-amount" id="Minutes"></span>
										<span class="countdown-period">M</span>
									</span>
									<span class="countdown-section">
										<span class="countdown-amount" id="Seconds"></span>
										<span class="countdown-period">S</span>
									</span>
								</span>
							</div>
						</div>
					</div>						
				</div>
			</div>
		</div>
		<div style="width:33%;">
			<div class="panel panel-inverse">
				<div class="panel-heading">
					<div class="panel-title" style="height: 20px;">기능별 업무현황</div>
				</div>
				<div class="panel-body" style="min-height: 335px;">
					<div id="apex-pie-chart"></div>
				</div>
			</div>
		</div>
		<div style="width:42%;">
			<div class="panel panel-inverse">
				<div class="panel-heading">
					<div class="panel-title" style="height: 20px;">담당자별 업무현황</div>
					<div class="panel-heading-btn">
						<a href="javascript:OpenWindow('getWindowWorkByManager.do','상세',700,700);" class="btn btn-xs btn-icon btn-default"><i class="fas fa-lg fa-fw fa-plus"></i></a>
					</div>
				</div>
				<div class="panel-body">
					<div id="apex-bar-chart"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row" style="height:357px">
	<div style="height:350px;width:40%;">
		<div class="panel panel-inverse">
			<div class="panel-heading">
				<div class="panel-title" style="height: 20px;">프로젝트 히스토리</div>
			</div>
			<div class="panel-body" style="padding-bottom: 0px; padding-top: 0px;">
				<div id="data-table-combine_wrapper"
					class="dataTables_wrapper dt-bootstrap4 no-footer">
					<div class="dataTables_wrapper dt-bootstrap">
						<div class="row" style="padding: 10px;min-height:310px;">
							<table id="data-table-combine" class="table table-hover" style="width:100%;">
								<thead>
									<tr role="row">
										<th width="5%">로그</th>
										<th width="1%" class="text-nowrap">등록일</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="log" items="${logList }" >
									<tr>
										<td>${log.plContent }</td>
										<td>20${log.plRegdate }</td>
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
	<div style="height:350px; width:60%;">
		<div class="panel panel-inverse">
			<div class="panel-heading">
				<div class="panel-title" style="height: 20px;">프로젝트 리스크&이슈</div>
				<div class="panel-heading-btn">
					<a href="javascript:location.href='/KAPMaS/project/issue';" class="btn btn-xs btn-icon btn-default"><i class="fas fa-lg fa-fw fa-plus"></i></a>
				</div>
			</div>
			<div class="panel-body" style="min-height:311px;">
					<div class="panel panel-inverse">
						<div class="panel-body" style="padding: 0;">
							<div id="data-table-combine_wrapper"
								class="dataTables_wrapper dt-bootstrap4 no-footer">
								<div class="dataTables_wrapper dt-bootstrap">
									<div class="row" style="padding: 10px;padding-top: 25px;">
										<table class="table table-hover">
											<thead>
												<tr role="row">
													<th width="3%" class="sorting sorting_desc" tabindex="0"
														aria-controls="data-table-combine" rowspan="1"
														colspan="1" data-column-index="0"
														aria-label=": activate to sort column ascending"
														aria-sort="descending">
														이슈 코드
													</th>
													<th width="3%" data-orderable="false"
														class="sorting_disabled" rowspan="1" colspan="1"
														data-column-index="1" aria-label="">
														등록자
													</th>
													<th width="5%" class="text-nowrap sorting sorting_desc" tabindex="0"
														aria-controls="data-table-combine" rowspan="1"
														colspan="1" data-column-index="2"
														aria-label=": activate to sort column ascending"
														aria-sort="descending">
														이슈 제목
													</th>
													<th width="1%" class="text-nowrap sorting sorting_desc" tabindex="0"
														aria-controls="data-table-combine" rowspan="1"
														colspan="1" data-column-index="3"
														aria-label=": activate to sort column ascending"
														aria-sort="descending">
														등록일
													</th>
													<th width="1%" class="text-nowrap sorting sorting_desc" tabindex="0"
														aria-controls="data-table-combine" rowspan="1"
														colspan="1"  data-column-index="3"
														aria-label=": activate to sort column ascending"
														aria-sort="descending">
														마일스톤
													</th>
													<th width="1%" class="text-nowrap sorting sorting_desc" tabindex="0"
														aria-controls="data-table-combine" rowspan="1"
														colspan="1" data-column-index="3"
														aria-label=": activate to sort column ascending"
														aria-sort="descending">
														상태
													</th>
												</tr>
											</thead>
											<tbody>
											<c:set var="i" value="0"/>
											<c:forEach var="pi" items="${piList }" >
												<c:if test="${pi.piStatus != 0 and i < 5}">
													<tr onclick="javascript:OpenWindow('<%=request.getContextPath() %>/project/piDetail/${pi.piCode }', '이슈&리스크 상세보기', '1000', '800');" style="cursor: pointer;">
														<td>${pi.piCode }</td>
														<td>${pi.empName }</td>
														<td>${pi.piTitle }</td>
														<td>${pi.piRegDate }</td>
														<td>${pi.piMileStone }</td>
														<td>${pi.piStatus eq 0 ? '완료' : '미완료' }</td>
													</tr>
													<c:set var="i" value="${i+1 }"/>
												</c:if>
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
<script>
function counter(){
	
	var end = $('#end').val();
	var date = end.split("-");
	
	var year =  date[0];
	var month =  date[1];
	var day =  date[2].split(" ")[0];
	
	if(month == 1){
		month = "Jan";
	}else if(month == 2){
		month = "Feb";
	}else if(month == 3){
		month = "Mar";
	}else if(month == 4){
		month = "Apr";
	}else if(month == 5){
		month = "May";
	}else if(month == 6){
		month = "Jun";
	}else if(month == 7){
		month = "Jul";
	}else if(month == 8){
		month = "Aug";
	}else if(month == 9){
		month = "Sep";
	}else if(month == 10){
		month = "Oct";
	}else if(month == 11){
		month = "Nov";
	}else if(month == 12){
		month = "Dec";
	}
	
	var dday = new Date(""+month+" "+day+","+year+",09:00:00").getTime(); //디데이
	setInterval(function(){
		var now = new Date(); //현재 날짜 가져오기
		var distance = dday - now;
		var d = Math.floor(distance / (1000 * 60 * 60 * 24));
		var h = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		var m = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		var s = Math.floor((distance % (1000 * 60)) / 1000);
		if(s < 10){
			s = '0'+s;
		}
		if(d<0){
			d = "기";
			h = "간";
			m = "종";
			s = "료";
			$('#Days').html(d)
			$('#Hours').html(h)
			$('#Minutes').html(m)
			$('#Seconds').html(s)
		}else{
		$('#Days').html(d)
		$('#Hours').html(h)
		$('#Minutes').html(m)
		$('#Seconds').html(s)
		}
	}, 1000);
}
window.setTimeout(function(){
	var jobCountArr = [];
	var jobCateArr = [];
	 $.ajax({
		url: "getMainWorkByCate.do",
		type: "get",
		dataType: "json",
		async:false,
		success: function(data){
			for(var i in data){
				jobCountArr.push(data[i].JOBCOUNT);
				jobCateArr.push(data[i].JOBCATE);
			}		
		},
		error: function (request, status, error){
		
		}
	});
  var options = {
    chart: {
      height: 300,	
      type: 'pie',
    },
    dataLabels: {
      dropShadow: {
        enabled: false,
        top: 1,
        left: 1,
        blur: 1,
        opacity: 0.45
      }
    },
    colors: [COLOR_PINK, COLOR_ORANGE, COLOR_BLUE, COLOR_TEAL, COLOR_INDIGO, COLOR_LIME],
    labels: jobCateArr,
    series: jobCountArr,
    title: {
      text: '기능 카테고리별 분류'
    },
    legend: {
        show: true,
        position: 'bottom'
    }
  };

  var pieCharts = new ApexCharts(
    document.querySelector('#apex-pie-chart'),
    options
  );

  pieCharts.render();
  $(".apexcharts-legend").css("padding","0px");
	var empNameArr = [];
	var empAvgArr = [];
	 $.ajax({
		url: "getMainWorkByManager.do",
		type: "get",
		dataType: "json",
		async:false,
		success: function(data){
			console.log(data)
			for(var i=0; i<10; i++){
				empNameArr.push(data[i].EMPNAME);
				empAvgArr.push(data[i].EMPAVG);
			}
		},
		error: function (request, status, error){
		
		}
	});
  var barChart = new ApexCharts(
    document.querySelector('#apex-bar-chart'), {
      chart: { height: 290, type: 'bar', stacked: false, stackType: '100%'},
      plotOptions: {
        bar: { horizontal: true,  dataLabels: { position: 'top' } }  
      },
      dataLabels: { enabled: true, offsetX: -6, style: { fontSize: '12px', colors: [COLOR_WHITE] } },
      colors: [COLOR_ORANGE, COLOR_DARK],
      stroke: { show: true, width: 1, colors: [COLOR_WHITE] },
      series: [
        { name: '진척도', data: empAvgArr }
      ],	
      xaxis: {
		max : 100,
    	categories: empNameArr,
        axisBorder: { show: true, color: COLOR_SILVER_TRANSPARENT_5, height: 1, width: '100%', offsetX: 0, offsetY: -1 },
        axisTicks: { show: true, borderType: 'solid', color: COLOR_SILVER, height: 6, offsetX: 0, offsetY: 0 }
      }
    }
  );
  
  barChart.render();
  
  counter();
  
  var options2 = {
      	dom : '<"dataTables_wrapper dt-bootstrap"<"row ht"<"col-xl-7 d-block d-sm-flex d-xl-block justify-content-center"<"d-block d-lg-inline-flex"B>><"col-xl-5 d-flex d-xl-block justify-content-center"fr>>t<"row"<""p>>>',
		buttons : [],
		responsive : true,
		colReorder : true,
		keys : true,
		rowReorder : true,
		select : false,
		ordering : false,
		serverSide : false,
		lengthMenu : [5],
		pageLength: 5
	};
	
	if ($(window).width() <= 767) {
		options.rowReorder = false;
		options.colReorder = false;
	}

	$('#data-table-combine').DataTable(options2);
}, 200);


</script>

</body>
