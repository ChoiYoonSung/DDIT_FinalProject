<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<% int i = 0 ; %>
<head>
<style>
.project-wrapper{
	margin-top:20px; overflow:auto; 
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
<body style="padding: 40px; background-color: #f0f4f7;" >
<button class="btn btn-yellow me-1 mb-1" onclick="OpenWindow('ProRegistForm.do','프로젝트 등록',900,900);" >프로젝트 등록</button>


<div class="btn-group" style="float:right;">
  <a href="#" class="btn btn-default">정렬순</a>
  <a href="#" class="btn btn-default dropdown-toggle" data-bs-toggle="dropdown">
    <i class="fa fa-caret-down"></i>
  </a>
  <ul class="dropdown-menu dropdown-menu-end">
	<a class="dropdown-item">생성순</a>
	<a class="dropdown-item">완료일순</a>
	<a class="dropdown-item">진척도순</a>
  </ul>
</div>
<div class="input-group mb-3" style="float:right;width: 300px;margin-right:20px;">
	<input type="text" class="form-control" placeholder="프로젝트명을 입력하세요">
	<div class="input-group-text"><i class="fa fa-search"></i></div>
</div>
	<div class="project-wrapper">
		<div class="widget widget-stats bg-info">
			<div class="stats-icon">
				<i class="fa fa-users"></i>
			</div>
			<div class="stats-info">
				<p>
					현재 등록 전체 프로젝트 수 : <u id="pc"></u>
				</p>
			</div>
			<div class="stats-link">
			</div>
		</div>
		<br>
		<br>
		<div class="panel panel-inverse" data-sortable-id="index-6">
			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">Analytics Details</h4>
				<div class="panel-heading-btn">
					<a href="javascript:;" class="btn btn-xs btn-icon btn-default"
						data-toggle="panel-expand"><i class="fa fa-expand"></i></a>
				</div>
			</div>
			<div class="table-responsive">
				<h2 style="padding: 10px;">Doing Project</h2>
				<hr>
				<ul class="project-container">
					<c:forEach items="${doPro}" var="pro">
						<% i++; %>
						<li>
							<div class="project-item">
								<div style="height: 30px;">
									<h4
										style="width: 150px; color: black; float: left; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${pro.pName }</h4>
									<a href="#" onclick="OpenWindow('detail.do?pCode=${pro.pCode }','프로젝트 상세',900,900);" ><span
										class="badge bg-secondary"
										style="float: right; padding: 5px; width: 30px;">상세</span></a> <span
										class="badge bg-primary"
										style="float: right; margin-right: 5px; padding: 5px; width: 50px;">${pro.pmAuthority }</span>
								</div>
								<p style="color: black; white-space: normal; height: 36px;">${pro.pTitle }</p>
								<div class="d-flex align-items-center mb-2px">
									<div class="flex-grow-1">
										<div
											class="progress h-5px rounded-pill bg-white-transparent-1">
											<div class="progress-bar progress-bar-striped bg-indigo"
												data-animation="width" data-value="80%" style="width: 80%;"></div>
										</div>
									</div>
									<div class="ms-2 fs-11px w-30px text-center"
										style="color: black;">
										<span data-animation="number" data-value="80">80</span>%
									</div>
								</div>
								<p style="color: black; text-align: center;">${pro.pStartdate.split(' ')[0] }
									~ ${pro.pEnddate.split(' ')[0] }</p>
							</div>
						</li>
					</c:forEach>
					<c:if test="${empty doPro}">
					<p class="text-danger">참여중인 프로젝트가 없습니다</p>
		</c:if>
				</ul>
			</div>
		</div>
	</div>
	<div class="project-wrapper">
	<div class="panel panel-inverse" data-sortable-id="index-6">
			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">Analytics Details</h4>
				<div class="panel-heading-btn">
					<a href="javascript:;" class="btn btn-xs btn-icon btn-default"
						data-toggle="panel-expand"><i class="fa fa-expand"></i></a>
				</div>
			</div>
			<div class="table-responsive">
	<h2 style="padding: 10px; ">Observing Project</h2>
	<hr>
	<ul class="project-container">
			<c:forEach items="${AopPro}" var="pro">
			<% i++; %>
		<li>
			<div class="project-item">
				<div style="height: 30px;" >
					<h4 style="width:150px;color:black; float:left;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${pro.pName }</h4>
					<a href="#" onclick="OpenWindow('detail.do?pCode=${pro.pCode }','프로젝트 상세',900,900);" ><span class="badge bg-secondary" style="float:right;padding: 5px; width: 30px;">상세</span></a>	
				</div>
				<p style="color:black;white-space: normal;height: 36px;">${pro.pTitle }</p>
				<div class="d-flex align-items-center mb-2px">
					<div class="flex-grow-1">
					<div class="progress h-5px rounded-pill bg-white-transparent-1">
					<div class="progress-bar progress-bar-striped bg-indigo" data-animation="width" data-value="80%" style="width: 80%;"></div>
					</div>
					</div>
					<div class="ms-2 fs-11px w-30px text-center" style="color: black;"><span data-animation="number" data-value="80">80</span>%</div>
				</div>	
				<p style="color:black;text-align: center;">${pro.pStartdate.split(' ')[0] } ~ ${pro.pEnddate.split(' ')[0] }</p>
			</div>
		</li>
		</c:forEach>
		<c:if test="${empty AopPro}" >
			<p class="text-danger">옵저버중인 프로젝트가 없습니다</p>
		</c:if>
	</ul>
		</div>
	</div>
</div>

<div class="project-wrapper">
	<div class="panel panel-inverse" data-sortable-id="index-6">
			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">Analytics Details</h4>
				<div class="panel-heading-btn">
					<a href="javascript:;" class="btn btn-xs btn-icon btn-default"
						data-toggle="panel-expand"><i class="fa fa-expand"></i></a>
				</div>
			</div>
			<div class="table-responsive">
			
			
			
	<h2 style="padding: 10px; ">Disableding Project</h2>
	<hr>
	<ul class="project-container">
			<c:forEach items="${notPro}" var="pro">
			<% i++; %>
		<li>
			<div class="project-item">
				<div style="height: 30px;" >
					<h4 style="width:150px;color:black; float:left;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${pro.pName }</h4>
						<a href="#" onclick="OpenWindow('detail.do?pCode=${pro.pCode }','프로젝트 상세',900,900);" ><span class="badge bg-secondary" style="float:right;padding: 5px; width: 30px;">상세</span></a>		
					<span class="badge bg-primary" style="float:right; margin-right:5px;padding: 5px; width: 30px;">${pro.pmAuthority }</span>
				</div>
				<p style="color:black;white-space: normal;height: 36px;">${pro.pTitle }</p>
				<div class="d-flex align-items-center mb-2px">
					<div class="flex-grow-1">
					<div class="progress h-5px rounded-pill bg-white-transparent-1">
					<div class="progress-bar progress-bar-striped bg-indigo" data-animation="width" data-value="80%" style="width: 80%;"></div>
					</div>
					</div>
					<div class="ms-2 fs-11px w-30px text-center" style="color: black;"><span data-animation="number" data-value="80">80</span>%</div>
				</div>	
				<p style="color:black;text-align: center;">${pro.pStartdate.split(' ')[0] } ~ ${pro.pEnddate.split(' ')[0] }</p>
			</div>
		</li>
		</c:forEach>
		<c:if test="${empty notPro}" >
			<p class="text-danger">비활성화중인 프로젝트가 없습니다</p>
		</c:if>
	</ul>





	
		</div>
	</div>
</div>



<input type="text" id="count" value="<%=i %>" hidden="">

<script type="text/javascript">
	
window.setTimeout(function(){
	
	var el = $("#count").val();
	$("#pc").text(el);
	
},100);


</script>

</body>
