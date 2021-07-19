<%@page import="com.spring.dto.JobVO"%>
<%@page import="java.util.List"%>
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

<body style="background-color: #f0f4f7; padding: 10px;">
<div class="row">
		<div class="widget widget-stats bg-info">
			<div class="stats-icon">
				<i class="fa fa-users"></i>
			</div>
			<div class="stats-info">
				<p>
					${proi.pName }의 프로젝트 참여자
				</p>
			</div>
			<div class="stats-link">
			</div>
		</div>
	<br><br><br><br>
	<div class="col-xl-3 ui-sortable" style=" padding-left: 40px;">
	<button type="button" class="btn btn-yellow me-1 mb-1" style="float: left: ;" onclick="OpenWindow('projecterCome.do','쪽지보내기',800,600);" >참여자 초대</button>
	</div>
</div>
	<br>
	<div class="row" style="margin-top: 20px; padding-left: 30px;">
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


					<div style="margin: 20px auto; width: 95%; height: 295px;">

						<div class="panel panel-inverse"
							style="width: 99%; padding-left: 10px;">
							<div class="panel-body">

								<div id="data-table-combine_wrapper"
									class="dataTables_wrapper dt-bootstrap4 no-footer">


									<div class="dataTables_wrapper dt-bootstrap">
										<div class="row">
											<table id="data-table-combine"
												class="table table-striped table-bordered align-middle"
												style="width: 100%;">
												<thead>
													<tr role="row">
														<th width="1%" class="sorting sorting_desc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" style="width: 6px;" data-column-index="0"
															aria-label=": activate to sort column descending"
															aria-sort="ascending" id="hiding01"></th>
														<th width="1%" class="sorting sorting_desc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" style="width: 6px;" data-column-index="0"
															aria-label=": activate to sort column descending"
															aria-sort="ascending"></th>
														<th width="5%" data-orderable="false"
															class="sorting_disabled" rowspan="1" colspan="1"
															style="width: 22px;" data-column-index="1" aria-label=""></th>
														<th class="text-nowrap sorting sorting_desc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" style="width: 104px;" data-column-index="2"
															aria-label="Rendering engine: activate to sort column ascending"
															aria-sort="descending">번호</th>
														<th class="text-nowrap sorting" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" style="width: 118px;" data-column-index="3"
															aria-label="Browser: activate to sort column ascending">이름</th>
														<th class="text-nowrap sorting" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" style="width: 109px;" data-column-index="4"
															aria-label="Platform(s): activate to sort column ascending">Authority</th>
														<th class="text-nowrap sorting" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" style="width: 87px;" data-column-index="5"
															aria-label="Engine version: activate to sort column ascending">진척도</th>
														<th class="text-nowrap sorting" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" style="width: 58px;" data-column-index="6"
															aria-label="CSS grade: activate to sort column ascending">추천수</th>
													</tr>
												</thead>





												<tbody>
													<c:forEach items="${pjmList}" var="proEmp">
														<% b++; %>
														<tr
															onclick="page('${proEmp.empName}','${proEmp.empImg}','${proEmp.pmAuthority}'
															,'${proEmp.depCode}','${proEmp.rnkCode}','${proEmp.empEmail}','${proEmp.empPhone}','${proEmp.empAdd}',
															'${proEmp.pCode}')">
															<td width="1%"
																class="fw-bold text-inverse dtr-control hide"
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
																</div>1
															</td>
															<td width="1%"></td>
															<td class="sorting_1">${proEmp.empName}</td>
															<td><select style="width: 90px; float: left;"
																name="AU" id="AU<%=b %>" class="form-select"
																onchange="changeAu('${proEmp.pCode}','${proEmp.empId}','AU<%=b %>');"
																onclick="event.cancelBubble = true;">
																	<option value="">-${proEmp.pmAuthority}-</option>
																	<option value="AA">AA</option>
																	<option value="DA">DA</option>
																	<option value="UA">UA</option>
																	<option value="BA">BA</option>
																	<option value="TA">TA</option>
															</select></td>
															<td><div class="progress mb-2">
																	<div class="progress-bar fs-10px fw-bold"
																		style="width: 80%">Basic</div>
																</div></td>
															<td>${proEmp.empName}</td>
															<td>${proEmp.empName}</td>
														</tr>
													</c:forEach>
													<c:if test="${empty pjmList}">
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

		<div class="project-wrapper" style="width: 48%; height: 95%;">
			<div class="panel panel-inverse" data-sortable-id="index-6">
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">Analytics Details</h4>
					<div class="panel-heading-btn">
						<a href="javascript:;" class="btn btn-xs btn-icon btn-default"
							data-toggle="panel-expand"><i class="fa fa-expand"></i></a>
					</div>
				</div>
				<div class="table-responsive">

					<div class="note note-warning note-with-end-icon mb-2" id="start"
						style="margin: 20px;">
						<div class="note-content text-end">
							<h4>
								<b>회원을 선택하시오!</b>
							</h4>
							<p>회원을 선택하면 회원의 상세정보를 확인할수있습니다</p>
						</div>
						<div class="note-icon">
							<i class="fa fa-lightbulb"></i>
						</div>
					</div>

					<div style="margin: 20px auto;">
						<div class="result-list">
							<div class="result-item" id="dom" style="margin: 20px;">
								<a href="#" class="result-image" id="image"
									style="background-image: url(<%=request.getContextPath() %>/resources/images/logo-remove.png)"></a>
								<div class="result-info" style="padding-left: 50px;">
									<h4 class="title">
										<a href="#" id="name">이름</a> <span class="badge bg-primary"
											style="margin-left: 5px; padding: 5px; width: 100px;"
											id="authority">Authority</span>
									</h4>
									<p class="desc">
									<ul class="list-unstyled">
										<li>부서 : <span id="dep"></span></li>
										<li>직급 : <span id="rnk"></span></li>
										<li>이메일 : <span id="mail"></span></li>
										<li>전화번호 : <span id="ph"></span></li>
										<li>주소 : <span id="ad"></span></li>
									</ul>
									</p>
									<div class="btn-row">
										<a href="javascript:;" data-toggle="tooltip"
											data-container="body" data-title="Configuration"> 프로젝트 제명<i
											class="fa fa-fw fa-cog"></i>
										</a>
										<a href="javascript:;" data-toggle="tooltip"
											data-container="body" data-title="Users"> 쪽지 보내기<i
											class="fa fa-fw fa-user"></i>
										</a>
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

window.onload = function() {
	var el = document.getElementById('dom');
	el.setAttribute('hidden', '');
	
}

function page(name,img,authority,depCode,rnkCode,email,phone,add,pCode){
	var e2 = document.getElementById('start');
	e2.setAttribute('hidden', '');
	
	var el = document.getElementById('dom');
	el.removeAttribute('hidden');
	
	page_go(name,img,authority,depCode,rnkCode,email,phone,add,pCode);
}



function page_go(name,img,authority,depCode,rnkCode,email,phone,add,pCode){
	
	
	var data={
			"depCode":depCode,
			"rnkCode":rnkCode
	}
	
	$.ajax({
		url : "<%=request.getContextPath() %>/project/getMemberInfo",
		type : "post",
		data : JSON.stringify(data),
		contentType:"application/text;charset=utf-8",
		success:function(data){
			var result=data.split(',');
			
			document.getElementById('dep').innerHTML=result[0];
			document.getElementById('rnk').innerHTML=result[1];
			
		},
		error:function(error){
			
			alert("시스템오류로입니다.관리자에게 문의해주세요.");
		}
		
	});
	
	document.getElementById('name').innerHTML=name ;
	document.getElementById('authority').innerHTML=authority ;
	var img = document.getElementById('image');
	img.setAttribute('style', 'background-image: url(<%=request.getContextPath() %>/resources/images/logo-remove.png)');
	document.getElementById('mail').innerHTML=email ;
	document.getElementById('ph').innerHTML=phone ;
	document.getElementById('ad').innerHTML=add ;
	
	
	
}

function changeAu(code,id,AU){
	
	var au = $("#"+AU+" option:selected").val();
	
	var data = {
			"au":au
		   ,"code":code
		   ,"id": id
			
	} 
	
	$.ajax({
		url : "<%=request.getContextPath() %>/project/updateAu",
		type : "post",
		data : JSON.stringify(data),
		contentType:"application/json;charset=utf-8",
		success:function(data){
			
			alert("역할을 부여하였습니다");
			
			history.go(0);
		},
		
		error:function(error){
			alert(error.status);
		}
		
	})
	
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

































