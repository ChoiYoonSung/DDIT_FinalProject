<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.col-2-4{
width: 20%;
}
.admin-table{
height: 250px;
}
.widget-stats{
height: 128px;
}
</style>

<div id="content" class="app-content">
	<!-- BEGIN page-header -->
	<h1 class="page-header text-center"><b>시스템 관리</b></h1>
	<!-- END page-header -->
	<!-- BEGIN row -->
	<div class="row">
		<!-- BEGIN col-3 -->
		<div class="col-2-4" onclick="OpenWindow('admin/empManage','전체 회원','1200','800');">
			<div class="widget widget-stats bg-gradient-cyan-blue">
				<div class="stats-icon stats-icon-lg"><i class="fa fa-globe fa-fw"></i></div>
				<div class="stats-content">
					<div class="stats-title">회원 목록</div>
					<div class="stats-number">총 회원 : <c:out value="${boardCnt['empCnt']}"/></div>
				</div>
			</div>
		</div>
		<div class="col-2-4" onclick="OpenWindow('admin/reportManage','신고 게시글','1000','800');">
			<div class="widget widget-stats bg-gradient-cyan-blue">
				<div class="stats-icon stats-icon-lg"><i class="fa fa-globe fa-fw"></i></div>
				<div class="stats-content">
					<div class="stats-title">신고 게시글 관리</div>
					<div class="stats-number">신고된 게시글 : <c:out value="${boardCnt['reportCnt']}"/></div>
				</div>
			</div>
		</div>
		<div class="col-2-4" onclick="OpenWindow('admin/qnaManage','Q&A','1000','800');">
			<div class="widget widget-stats bg-gradient-cyan-blue">
				<div class="stats-icon stats-icon-lg"><i class="fa fa-globe fa-fw"></i></div>
				<div class="stats-content">
					<div class="stats-title">Q&A</div>
					<div class="stats-number">미답변 Q&A : <c:out value="${boardCnt['qnaCnt']}"/></div>
				</div>
			</div>
		</div>
		
		<div class="col-2-4" onclick="OpenWindow('admin/guideManage','이용가이드','1000','800');">
			<div class="widget widget-stats bg-gradient-cyan-blue">
				<div class="stats-icon stats-icon-lg"><i class="fa fa-globe fa-fw"></i></div>
				<div class="stats-content">
					<div class="stats-title">이용가이드</div>
					<div class="stats-number">이용가이드 : <c:out value="${boardCnt['guideCnt']}"/></div>
				</div>
			</div>
		</div>
		<div class="col-2-4" onclick="OpenWindow('admin/noticeManage','공지사항','1000','800');">
			<div class="widget widget-stats bg-gradient-cyan-blue">
				<div class="stats-icon stats-icon-lg"><i class="fa fa-globe fa-fw"></i></div>
				<div class="stats-content">
					<div class="stats-title">공지사항</div>
					<div class="stats-number">공지사항 : <c:out value="${boardCnt['noticeCnt']}"/></div>
				</div>
			</div>
		</div>
		
		<div class="col-4">
			<div class="panel panel-inverse" data-sortable-id="chart-js-10">
				<div class="panel-heading">
					<div class="panel-title" style="height: 20px;">프로젝트 현황</div>
				</div>
				<div class="panel-body p-0" style="height: 300px;">
					<div id="apex-pie-chart"></div>
				</div>
			</div>
		</div>
		<div class="col-4">
			<div class="panel panel-inverse" data-sortable-id="chart-js-10">
				<div class="panel-heading">
					<div class="panel-title" style="height: 20px;">프로젝트 등록 월별 현황</div>
				</div>
				<div class="panel-body p-0" style="height: 300px;">
					<div id="apex-area-chart"></div>
				</div>
			</div>
		</div>
		<div class="col-4">
			<div class="panel panel-inverse" data-sortable-id="chart-js-10">
				<div class="panel-heading">
					<div class="panel-title" style="height: 20px;">지식관리 글 등록 월별 현황</div>
				</div>
				<div class="panel-body p-0" style="height: 300px;">
					<div id="apex-line-chart"></div>
				</div>
			</div>
		</div>
		<div class="col-6" style="padding-bottom: 0; margin-bottom: 0;">
			<div class="panel panel-inverse" data-sortable-id="chart-js-10">
				<div class="panel-body p-0">
					<div class="panel panel-inverse" data-sortable-id="table-basic-1">
						<!-- BEGIN panel-heading -->
						<div class="panel-heading">
							<h4 class="panel-title">신고가 많은 게시글</h4>
						</div>
						<!-- END panel-heading -->
						<!-- BEGIN panel-body -->
						<div class="panel-body admin-table">
							<!-- BEGIN table-responsive -->
							<div class="table-responsive">
								<table class="table mb-0">
									<thead>
										<tr>
											<th>분류</th>
											<th>게시글 번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>신고수</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="report" items="${reportList }">
										<tr>
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
		<div class="col-6" style="padding-bottom: 0;">
			<div class="panel panel-inverse" data-sortable-id="chart-js-10">
				<div class="panel-body p-0">
					<div class="panel panel-inverse" data-sortable-id="table-basic-1">
						<!-- BEGIN panel-heading -->
						<div class="panel-heading">
							<h4 class="panel-title">최근 등록된 게시글</h4>
						</div>
						<!-- END panel-heading -->
						<!-- BEGIN panel-body -->
						<div class="panel-body admin-table">
							<!-- BEGIN table-responsive -->
							<div class="table-responsive">
								<table class="table mb-0">
									<thead>
										<tr>
											<th>분류</th>
											<th>게시글 번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="board" items="${boardList }" begin="0" end="4">
										<tr>
											<td>${board.bdName }</td>
											<td>${board.bdCode }</td>
											<td>${board.bdTitle }</td>
											<td>${board.empId }</td>
											<td>${board.bdRegDate }</td>
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
	<!-- BEGIN row -->
</div>


<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/vendor.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/app.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/theme/transparent.min.js"></script>
<!-- ================== END core-js ================== -->

<!-- ================== BEGIN page-js ================== -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/apexcharts/dist/apexcharts.min.js"></script>
<script>
window.addEventListener('load',function(){
	$('.apexcharts-text').css('fill','#FFFFFF');
	$('.apexcharts-legend-text').css('color','#FFFFFF');
	$('.apexcharts-title-text').css('fill','#FFFFFF');
})

function goAdminManage(url){
	window.parent.location.href='<%=request.getContextPath() %>/admin/'+url;
}

var psArr = [];
var psNameArr = [];
$.ajax({
	url: "<%=request.getContextPath() %>/admin/getProjectStatistics.do",
	type: "get",
	dataType: "json",
	async:false,
	success: function(data){
		for(var i in data){
			psArr.push(data[i].PERCENT);
			if(data[i].P_ENABLED == 0){
				psNameArr.push("비활성화");
			}else{
				psNameArr.push("활성화");
			}
		}		
	},
	error: function (request, status, error){
	
	}
});

var chart1 = new ApexCharts(
  document.querySelector('#apex-pie-chart'),
  options = {
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
	  legend: {
		position:'bottom'  
	  },
	  colors: [COLOR_BLUE, COLOR_TEAL],
	  labels: psNameArr,
	  series: psArr,
	}
);

var psMonthArr = [];
$.ajax({
	url: "<%=request.getContextPath() %>/admin/getProjectByMonth.do",
	type: "get",
	dataType: "json",
	async:false,
	success: function(data){
		for(var i in data){
			psMonthArr.push(data[i].CNT);
		}
	},
	error: function (request, status, error){
	
	}
});


var chart2 = new ApexCharts(
  document.querySelector('#apex-area-chart'), {
    chart: {
        toolbar: {
            show: false
        },
    	height: 300,
    	type: 'area',
    	},
    dataLabels: { enabled:	 false },
    stroke: { curve: 'smooth', width: 3 },
    colors: [COLOR_PINK, COLOR_DARK],
    series: [
      { name: '프로젝트 등록', data: psMonthArr }
    ],
    xaxis: {
      categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      axisBorder: { show: true, color: COLOR_SILVER_TRANSPARENT_5, height: 1, width: '100%', offsetX: 0, offsetY: -1 },
      axisTicks: { show: true,  borderType: 'solid', color: COLOR_SILVER, height: 6, offsetX: 0, offsetY: 0 }             
    },
    tooltip: {
      x: { format: 'dd/MM/yy HH:mm' }
    }
  }
);

var kmsPcntArr = [];
var kmsKcntArr = [];
var kmsTcntArr = [];

$.ajax({
	url: "<%=request.getContextPath() %>/admin/getKMSByMonth.do",
	type: "get",
	dataType: "json",
	async:false,
	success: function(data){
		console.log(data)
		for(var i in data){
			kmsPcntArr.push(data[i].PCNT);
			kmsKcntArr.push(data[i].KCNT);
			kmsTcntArr.push(data[i].TCNT);
		}
	},
	error: function (request, status, error){
	
	}
});

var chart3 = new ApexCharts(
  document.querySelector('#apex-line-chart'), {
    chart: {
      height: 300,
      type: 'line',
      shadow: { enabled: true, color: COLOR_DARK, top: 18, left: 7, blur: 10, opacity: 1 },
      toolbar: { show: false }
    },
    colors: [COLOR_PINK ,COLOR_BLUE, COLOR_TEAL],
    dataLabels: { enabled: true },
    stroke: { curve: 'smooth', width: 3 },
    series: [
  	  { name: '프로젝트 보고서', data: kmsPcntArr }, 
      { name: '노하우', data: kmsKcntArr }, 
      { name: '기타 자료 게시판', data: kmsTcntArr },
/*       { name: 'High - 2021', data: [28, 29, 33, 36, 32, 32, 33] }, 
      { name: 'Low - 2021', data: [12, 11, 14, 18, 17, 13, 13] } */
    ],
    grid: {
      row: { colors: [COLOR_SILVER_TRANSPARENT_1, 'transparent'],  opacity: 0.5 },
    },
    markers: { size: 4 },
    xaxis: {
      categories: ['1월', '2월', '3월	', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      axisBorder: { show: true, color: COLOR_SILVER_TRANSPARENT_5, height: 1, width: '100%', offsetX: 0, offsetY: -1 },
      axisTicks: { show: true, borderType: 'solid', color: COLOR_SILVER, height: 6, offsetX: 0, offsetY: 0 }
    },
    yaxis: { min: 0, max: 30 },
    /* legend: { show: true, position: 'top', offsetY: -10, horizontalAlign: 'right', floating: true } */
  }
);


chart1.render();
chart2.render();
chart3.render();
</script>