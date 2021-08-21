<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<% int d = 0 ; 
 int o = 0 ;
 int n = 0 ; %>
<head>
<style>
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
<body style="background-color: #f0f4f7;" >
<div class="app-content">
		<div class="row" style="padding:20px">
			<div class="page-title has-bg col-md-10" style="padding: 0px">
				<h1 style="color: black;">${loginUser.empName }님의 프로젝트 리스트</h1>
			</div>
		</div>
<button class="btn btn-primary me-1 mb-1" onclick="OpenWindow('ProRegistForm.do','프로젝트 등록',900,900);" >프로젝트 등록</button>

<div class="input-group mb-3" style="float:right;width: 300px;">
	<input type="text" class="form-control" placeholder="프로젝트명을 입력하세요" name="keyword" value="${keyword }">
	<div class="input-group-text" style="cursor:pointer;"><i class="fa fa-search" onclick="main_go(1);"></i></div>
</div>
<div class="btn-group" style="float:right;margin-right:10px;">
  <select class="form-select" name="orderType">
	<option value="s" ${orderType eq 's' ? 'selected':'' }>생성일자순</option>
	<option value="e" ${orderType eq 'e' ? 'selected':'' }>완료일자순</option>
	<option value="p" ${orderType eq 'p' ? 'selected':'' }>진척도순</option>
  </select>
</div>
	<div class="project-wrapper">
		<br>
		<br>
		<div class="panel panel-inverse" data-sortable-id="index-6">
			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">진행중인 프로젝트 : <span id="do"></span></h4>
			</div>
			<div class="table-responsive">
				<ul class="project-container">
					<c:forEach items="${doPro}" var="pro">
						<% d++; %>
						<li style="padding-bottom: 10px;">
							<div class="project-item">
								<div style="height: 30px;">
									<h4 style="width: 150px; color: black; float: left; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
										<a href="javascript:goProMain('proMain.do?pCode=${pro.pCode }');" style="text-decoration: none;">${pro.pName }</a>
									</h4>
									<a href="#" onclick="OpenWindow('detail.do?pCode=${pro.pCode }','프로젝트 상세',825,745);" >
										<span class="badge bg-secondary" style="float: right; padding: 5px; width: 30px;">
										상세
										</span>
									</a>
									<span class="badge bg-primary" style="float: right; margin-right: 5px; padding: 5px; width: 50px;">
									${pro.pmAuthority }
									</span>
								</div>
								<p style="color: black; white-space: normal; height: 36px;">${pro.pTitle }</p>
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
								<p style="color: black; text-align: center;">${pro.pStartdate.split(' ')[0] }
									~ ${pro.pEnddate.split(' ')[0] }</p>
							</div>
						</li>
					</c:forEach>
					<c:if test="${empty doPro}">
					<br>
					<p >참여중인 프로젝트가 없습니다</p>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<div class="project-wrapper">
	<div class="panel panel-inverse" data-sortable-id="index-6">
			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">옵저버중인 프로젝트 : <span id="op"></span></h4>
			</div>
			<div class="table-responsive">
	<ul class="project-container">
			<c:forEach items="${AopPro}" var="pro">
			<% o++; %>
		<li style="padding-bottom: 10px;">
			<div class="project-item">
				<div style="height: 30px;" >
					<h4 style="width:150px;color:black; float:left;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;" style="text-decoration: none;"><a href="javascript:goProMain('proMain.do?pCode=${pro.pCode }');" style="text-decoration: none;">${pro.pName }</a></h4>
					<a href="#" onclick="OpenWindow('detail.do?pCode=${pro.pCode }','프로젝트 상세',825,745);" ><span class="badge bg-secondary" style="float:right;padding: 5px; width: 30px;">상세</span></a>	
				</div>
				<p style="color:black;white-space: normal;height: 36px;">${pro.pTitle }</p>
				<div class="d-flex align-items-center mb-2px">
					<div class="flex-grow-1">
					<div class="progress h-5px rounded-pill bg-white-transparent-1">
					<div class="progress-bar progress-bar-striped bg-indigo" data-animation="width" data-value="${pro.totalPrograss }%" style="width: ${pro.totalPrograss }%;"></div>
					</div>
					</div>
					<div class="ms-2 fs-11px w-30px text-center" style="color: black;"><span data-animation="number" data-value="${pro.totalPrograss }">${pro.totalPrograss }</span>%</div>
				</div>	
				<p style="color:black;text-align: center;">${pro.pStartdate.split(' ')[0] } ~ ${pro.pEnddate.split(' ')[0] }</p>
			</div>
		</li>
		</c:forEach>
		<c:if test="${empty AopPro}" >
			<br>
			<p >옵저버중인 프로젝트가 없습니다</p>
		</c:if>
	</ul>
		</div>
	</div>
</div>
<div class="project-wrapper">
	<div class="panel panel-inverse" data-sortable-id="index-6">
			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">비활성화중인 프로젝트 : <span id="notDo"></span></h4>
			</div>
			<div class="table-responsive">
	<ul class="project-container">
			<c:forEach items="${notPro}" var="pro">
			<% n++; %>
		<li style="padding-bottom: 10px;">
			<div class="project-item">
				<div style="height: 30px;" >
					<h4 style="width:150px;color:black; float:left;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"><a href="javascript:goProMain('proMain.do?pCode=${pro.pCode }');" style="text-decoration: none;">${pro.pName }</a></h4>
						<a href="#" onclick="OpenWindow('detail.do?pCode=${pro.pCode }','프로젝트 상세',825,745);" ><span class="badge bg-secondary" style="float:right;padding: 5px; width: 30px;">상세</span></a>		
					<span class="badge bg-primary" style="float:right; margin-right:5px;padding: 5px; width: 30px;">${pro.pmAuthority }</span>
				</div>
				<p style="color:black;white-space: normal;height: 36px;">${pro.pTitle }</p>
				<div class="d-flex align-items-center mb-2px">
					<div class="flex-grow-1">
					<div class="progress h-5px rounded-pill bg-white-transparent-1">
					<div class="progress-bar progress-bar-striped bg-indigo" data-animation="width" data-value="${pro.totalPrograss }%" style="width: ${pro.totalPrograss }%;"></div>
					</div>
					</div>
					<div class="ms-2 fs-11px w-30px text-center" style="color: black;"><span data-animation="number" data-value="${pro.totalPrograss }">${pro.totalPrograss }</span>%</div>
				</div>	
				<p style="color:black;text-align: center;">${pro.pStartdate.split(' ')[0] } ~ ${pro.pEnddate.split(' ')[0] }</p>
			</div>
		</li>
		</c:forEach>
		<c:if test="${empty notPro}" >
			<br>
			<p >비활성화중인 프로젝트가 없습니다</p>
		</c:if>
	</ul>
		</div>
	</div>
</div>
</div>


<input type="text" id="doing" value="<%=d %>" hidden="">
<input type="text" id="oping" value="<%=o %>" hidden="">
<input type="text" id="notDoing" value="<%=n %>" hidden="">

<form id="jobForm">
	<input type='hidden' name="orderType" />
	<input type='hidden' name="keyword" />
</form>

<script type="text/javascript">
	
window.setTimeout(function(){
	
	var el1 = $("#doing").val();
	$("#do").text(el1);
	
	var el2 = $("#oping").val();
	$("#op").text(el2);
	
	var el3 = $("#notDoing").val();
	$("#notDo").text(el3);
	
	
},100);

function goProMain(url){
	var loc = window.parent.location.href;
	loc = loc.substr(0,24) + "index.do?mCode=M010100";
	window.parent.location.href=loc;
	window.location.href=url;
}

function main_go(page, url) {

	if (!url)
		url = "main.do";

	var jobForm = $('#jobForm');
	jobForm.find("[name='orderType']").val(
			$('select[name="orderType"]').val());
	jobForm.find("[name='keyword']").val(
			$('div.input-group>input[name="keyword"]').val());

	$('form#jobForm').attr({
		action : url,
		method : 'get'
	}).submit();

}

</script>

</body>






