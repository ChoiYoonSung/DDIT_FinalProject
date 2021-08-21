<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="sysdate" value="<%=new java.util.Date()%>" />
<c:set var="now"><fmt:formatDate value="${sysdate}" pattern="yyyy-MM-dd" /></c:set>
 
<script>
function copDate(copRegdate){
	var month = copRegdate.split("-")[1];
	var day = copRegdate.split("-")[2];
	if(month == '01'){
		month = "January";
	}else if(month == '02'){
		month = "February";
	}else if(month == '03'){
		month = "March";
	}else if(month == '04'){
		month = "April";
	}else if(month == '05'){
		month = "May";
	}else if(month == '06'){
		month = "June";
	}else if(month == '07'){
		month = "July";
	}else if(month == '08'){
		month = "August";
	}else if(month == '09'){
		month = "September";
	}else if(month == '10'){
		month = "October";
	}else if(month == '11'){
		month = "November";
	}else if(month == '12'){
		month = "December";
	}
	document.write(month + " " +day);
}
</script>
<head>
<style type="text/css">
.panel-body{
	min-height: 240px;
}
.project-item{
	float:left;
	box-shadow: 2px 2px 10px silver;
    width: 200px;
    height: 150px;
    background: white;
    padding: 17px;
    border-radius: 10px;
    margin: 20px 0px 20px 21px;
}

@media (min-width: 1280px) {
  .project-item{
	float:left;
	box-shadow: 2px 2px 10px silver;
    width: 270px;
    height: 150px;
    background: white;
    padding: 17px;
    border-radius: 10px;
    margin: 20px 0px 20px 30px;
}
}
.bg-white-transparent-1 {
    background-color: rgb(0 0 0 / 10%) !important;
}
 .project-container {
	padding:10px;
 	margin: 0 auto;
   	width: 100%;
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
<div class="app-content">
<h1 class="page-header">HOME</h1>

<div class="row">
	<!-- BEGIN col-6 -->
	<div class="col-6">
		<!-- BEGIN panel -->
		<div class="panel panel-inverse">
			<!-- BEGIN panel-heading -->
			<div class="panel-heading">
				<h4 class="panel-title">진행중인 프로젝트</h4>
				<div class="panel-heading-btn">
					<a href="javascript:location.href='/KAPMaS/project/main';" class="btn btn-xs btn-icon btn-default"><i class="fas fa-lg fa-fw fa-plus"></i></a>
				</div>
			</div>
			<!-- END panel-heading -->
			<!-- BEGIN panel-body -->
			<div class="panel-body" style="height: 600px;overflow: hidden;">
				<!-- BEGIN table-responsive -->
				<div class="table-responsive">
						<c:if test="${empty project }">
							<p>진행 중인 프로젝트가 없습니다.</p>
						</c:if>
						<c:forEach items="${project }" var="pro" begin="0" end="5" varStatus="status">
							<div class="project-item">
								<div style="height: 30px;">
									<h4 style="width: 160px; color: black; float: left; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
										<a href="javascript:goProMain('project/proMain.do?pCode=${pro.pCode }');" style="text-decoration: none;">${pro.pName }</a>
									</h4>
									<a href="#" onclick="OpenWindow('project/detail.do?pCode=${pro.pCode }','프로젝트 상세',825,745);" >
										<span class="badge bg-secondary" style="float: right; padding: 5px; width: 30px;">
										상세
										</span>
									</a>
									<span class="badge bg-primary" style="float: right; width: 90px;margin-right: 5px; padding: 5px; width: 35px;">
									${pro.pmAuthority }
									</span>
								</div>
								<p style="color: black; white-space: nowrap; height: 36px;overflow: hidden; text-overflow: ellipsis;">${pro.pTitle }</p>
								<div class="d-flex align-items-center mb-2px">
									<div class="flex-grow-1">
										<div class="progress h-5px rounded-pill bg-white-transparent-1">
											<div class="progress-bar progress-bar-striped bg-indigo" data-animation="width" data-value="${pro.totalPrograss }%" style="width: ${pro.totalPrograss }%;"></div>
										</div>
									</div>
									<div class="ms-2 fs-11px w-30px text-center"
										style="color: black;">
										<span data-animation="number" data-value="${pro.totalPrograss }">${pro.totalPrograss }</span>%
									</div>
								</div>
								<p style="color: black; text-align: center;font-size:13px;">${pro.pStartdate.split(' ')[0] }
									~ ${pro.pEnddate.split(' ')[0] }</p>
							</div>
						</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<div class="col-6 ui-sortable">

		<div class="panel panel-inverse">
			<!-- BEGIN panel-heading -->
			<div class="panel-heading">
				<h4 class="panel-title">CoP</h4>
				<div class="panel-heading-btn">
					<a href="javascript:location.href='/KAPMaS/cop/mycop';" class="btn btn-xs btn-icon btn-default"><i class="fas fa-lg fa-fw fa-plus"></i></a>
				</div>
			</div>
			<!-- END panel-heading -->
			<!-- BEGIN panel-body -->
			<div class="panel-body">
				<!-- BEGIN table-responsive -->
				<div class="table-responsive">
					<c:set var="jcv" value="${cop}"/>
					<c:set var="jcp" value="${copJoinCnt}"/>
						<c:if test="${empty jcv }">
							<p>참여 중인 CoP가 없습니다.</p>
						</c:if>
							<c:forEach var="jcv" items="${jcv}" begin="0" end="2" varStatus="status">
							<div onclick="OpenWindow('cop/detail/${jcv.copCode}','${jcv.copName}','1130','700');" style="display: inline-block;width: 100%;padding-bottom: 10px;margin-top:5px;margin-bottom: 5px;border-bottom: 1px solid #e8e8e8;cursor:pointer;">
								<div style="float:left;">
									<div style="float:left;">
										<img src="<%=request.getContextPath() %>/cop/getPictureByCode/${jcv.copCode}" alt="" class="mw-100 rounded-pill" style="width: 45px;height: 45px;">
									</div>
									<div style="float:left;margin-left:10px;">
										<p style="font-weight: 600;font-size: 15px;color:#6e6d6d;margin-bottom: 0px;">${jcv.copName } - ${jcv.copSubject }</p>
										<span style=" color:#959595;">Created by ${jcv.copOwner } · <script>copDate('${jcv.copRegdate}')</script>  · 
										<c:if test="${jcv.copType == 0 }">PRIVATE</c:if>
										<c:if test="${jcv.copType == 1 }">PUBLIC</c:if>
										</span>
									</div>
								</div>
								<div style="float:right;height:40px;">
									<img src="<%=request.getContextPath() %>/resources/images/people.png" style="width:30px; height:30px;">
									<span style="font-weight: 600; font-size:15px;color:#959595;line-height:40px;">${jcp[status.index].copPersonnel}</span>
								</div>
							</div>
						</c:forEach>
				</div>
			</div>
		</div>
		
		<div class="panel panel-inverse">
			<!-- BEGIN panel-heading -->
			<div class="panel-heading">
				<h4 class="panel-title">노하우</h4>
				<div class="panel-heading-btn">
					<a href="javascript:location.href='/KAPMaS/kms/knowhow';" class="btn btn-xs btn-icon btn-default"><i class="fas fa-lg fa-fw fa-plus"></i></a>
				</div>
			</div>
			<!-- END panel-heading -->
			<!-- BEGIN panel-body -->
			<div class="panel-body" style="height:300px;">
				<div class="table-responsive">
					<c:if test="${empty knowList }">
						<p>작성한 노하우가 없습니다.</p>
					</c:if>
					<c:forEach var="know" items="${knowList }" begin="0" end="3">
						<div onclick="OpenWindow('kms/knowDetail.do?khCode=${know.khCode}','상세보기',850,780);" style="display: inline-block;width: 100%;padding-bottom: 10px;margin-top:5px;margin-bottom: 5px;border-bottom: 1px solid #e8e8e8;cursor:pointer;">
							<div style="width:100%;height:25px;">
							<p style="float: left;font-weight: 600;font-size: 15px;color:#6e6d6d;margin-bottom: 0px;">${know.khTitle }</p>
							<c:if test="${know.khCategory eq '연구' }" >
							<span class="badge bg-info" style="float: right; padding: 5px; width: 35px;">
								${know.khCategory }
							</span>
							</c:if>
							<c:if test="${know.khCategory eq '기술' }" >
							<span class="badge bg-orange" style="float: right; padding: 5px; width: 35px;">
								${know.khCategory }
							</span>
							</c:if>
							<c:if test="${know.khCategory eq '법률' }" >
							<span class="badge bg-red" style="float: right; padding: 5px; width: 35px;">
								${know.khCategory }
							</span>
							</c:if>
							<c:if test="${know.khCategory eq '기타' }" >
							<span class="badge bg-primary" style="float: right; padding: 5px; width: 35px;">
								${know.khCategory }
							</span>
							</c:if>
							</div>
							<div style="width:100%;">
								<div style="float:right;color:#959595;">
									<script>copDate('${know.khRegdate }')</script>
								</div>
								<div>
									<img src="<%=request.getContextPath() %>/resources/images/idea.png"  style="width: 20px;height: 20px;"> ${know.answercnt } Answers &nbsp;
									<img src="<%=request.getContextPath() %>/resources/images/like.png"  style="width: 20px;height: 20px;"> ${know.khLikecnt } Likes &nbsp;
									<img src="<%=request.getContextPath() %>/resources/images/view.png"  style="width: 20px;height: 20px;"> ${know.khViewcnt } Views &nbsp;
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- END panel-body -->
		</div>


	</div>
	</div>
	<!-- END col-6 -->
<div class="row">
	<div class="col-8">
	<div class="panel panel-inverse">
			<!-- BEGIN panel-heading -->
			<div class="panel-heading">
				<h4 class="panel-title">업무</h4>
			</div>
			<!-- END panel-heading -->
			<!-- BEGIN panel-body -->
			<div class="panel-body" style="height:327px;">
				<!-- BEGIN table-responsive -->
				<div class="table-responsive">
					<table class="table table-hover mb-0 text-inverse">
						<thead>
							<tr>
								<th class="col-1">NO</th>
								<th class="col-3">업무 이름</th>
								<th class="col-4">프로젝트명</th>
								<th class="col-2">진척도</th>
								<th class="col-2">마감일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty job }">
							<tr>
								<td colspan="5">담당된 업무가 없습니다.</td>
							</tr>							

							</c:if>
							<c:forEach var="job" items="${job }" begin="0" end="4" varStatus="status">
							<tr>
								<td class="col-1">${status.index+1 }</td>
								<td class="col-3">
								<c:choose>
							        <c:when test="${fn:length(job.jobName) gt 20}">
							        	<c:out value="${fn:substring(job.jobName, 0, 20)}">...</c:out>
							        </c:when>
							        <c:otherwise>
							        	<c:out value="${job.jobName}"></c:out>
						        	</c:otherwise>
								</c:choose>
								<c:if test="${job.jobStartdate eq now }">
									<span class="badge bg-yellow ms-5px">NEW</span>
								</c:if>
								</td>
								<td class="col-4">${job.pName }</td>
								<td class="col-2">
								<div class="progress">
									<div class="progress-bar fs-10px fw-bold" style="width: ${job.jobPrograss }%">${job.jobPrograss }%</div>
								</div>
								</td>
								<td class="col-2">${job.jobEnddate }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- END table-responsive -->
			</div>
			<!-- END panel-body -->
		</div>
		
	</div>
	<div class="col-4">
	<div class="panel panel-inverse">
			<!-- BEGIN panel-heading -->
			<div class="panel-heading">
				<h4 class="panel-title">달력</h4>
			</div>
			<!-- END panel-heading -->
			<!-- BEGIN panel-body -->
			<div class="panel-body">
				<!-- BEGIN table-responsive -->
				<div id="datepicker-inline">
				<!-- END table-responsive -->
			</div>
			<!-- END panel-body -->
		</div>
	</div>
</div>
<%-- 	<div class="col-12">
	<div class="panel panel-inverse">
			<!-- BEGIN panel-heading -->
			<div class="panel-heading">
				<h4 class="panel-title">공지사항</h4>
			</div>
			<!-- END panel-heading -->
			<!-- BEGIN panel-body -->
			<div class="panel-body">
				<!-- BEGIN table-responsive -->
				<div class="table-responsive">
					<table class="table table-striped mb-0">
						<thead>
							<tr>
								<th width="1%">#</th>
								<th width="5%">제목</th>
								<th width="2%">등록일</th>
								<th width="1%">조회수</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${notice ne null } ">
						<c:forEach items="${notice }" var="notice" begin="0" end="4" varStatus="status">
							<tr>
								<td>${status.index+1 }</td>
								<td>${notice.noticeTitle }</td>
								<td>${notice.noticeRegdate }</td>
								<td>${notice.noticeViewcnt }</td>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${notice eq null }">
							<tr class="odd">
								<td colspan="5" class="dataTables_empty"><h3>공지사항이 없습니다.</h3></td>
							</tr>
						</c:if>
						</tbody>
					</table>
				</div>
				<!-- END table-responsive -->
			</div>
			<!-- END panel-body -->
		</div>
	</div> --%>

</div>
<!-- END row -->
</div>
<script>



/*  var chart = new ApexCharts(
  document.querySelector('#apex-bar-chart'), {
    chart: { height: 350, type: 'bar', stacked: false, stackType: '100%'},
    plotOptions: {
      bar: { horizontal: true,  dataLabels: { position: 'top' } }  
    },
    dataLabels: { enabled: true, offsetX: -6, style: { fontSize: '12px', colors: [COLOR_WHITE] } },
    colors: [COLOR_ORANGE, COLOR_DARK],
    stroke: { show: true, width: 1, colors: [COLOR_WHITE] },
    series: [
      { name: '진척도', data: ['${project[0].totalPrograss}', '${project[1].totalPrograss}','${project[2].totalPrograss}'
    	  ,'${project[3].totalPrograss}','${project[4].totalPrograss}'] }
    ],	
    xaxis: {
  	categories: ['${project[0].pName}','${project[1].pName}','${project[2].pName}','${project[3].pName}'
  		,'${project[4].pName}'],
      axisBorder: { show: true, color: COLOR_SILVER_TRANSPARENT_5, height: 1, width: '100%', offsetX: 0, offsetY: -1 },
      axisTicks: { show: true, borderType: 'solid', color: COLOR_SILVER, height: 6, offsetX: 0, offsetY: 0 }
    }
  }
);

chart.render();  */
	  
function goProMain(url){
	var loc = window.parent.location.href;
	loc = loc.substr(0,24) + "index.do?mCode=M010100";
	window.parent.location.href=loc;
	window.location.href=url;
}
</script>
</body>
