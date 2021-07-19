<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>

<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-colreorder-bs4/css/colReorder.bootstrap4.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-keytable-bs4/css/keyTable.bootstrap4.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-rowreorder-bs4/css/rowReorder.bootstrap4.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-select-bs4/css/select.bootstrap4.min.css"
	rel="stylesheet" />

<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net/js/jquery.dataTables.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-colreorder/js/dataTables.colReorder.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-colreorder-bs4/js/colReorder.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-keytable-bs4/js/keyTable.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-rowreorder/js/dataTables.rowReorder.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-rowreorder-bs4/js/rowReorder.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-select/js/dataTables.select.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-select-bs4/js/select.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/dataTables.buttons.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.colVis.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.flash.min.js"></script>
<!-- <script -->
<%-- 	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.html5.js"></script> --%>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.print.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/pdfmake/build/vfs_fonts.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jszip/dist/jszip.min.js"></script>

<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/css/forum/app.min.css"
	rel="stylesheet">

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
<body style="background-color: #dee2e6;">
	<div class="row" style="margin: 0px;">
		<div class="col-xl-12 ui-sortable">
			<h1 class="page-header">COP 조회</h1>
			<div class="panel panel-inverse" data-sortable-id="ui-media-object-1"
				data-init="true">
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">COP 목록</h4>
				</div>
				<div class="panel-body">
					<div class="col-xl-12 ui-sortable">
						<div class="panel panel-inverse">
							<div class="panel-body">
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
															aria-label=": activate to sort column ascending"
															aria-sort="descending">#</th>
														<th width="1%" data-orderable="false"
															class="sorting_disabled" rowspan="1" colspan="1"
															data-column-index="1" aria-label="">프로필
															사진</th>
														<th width="1%" class="text-nowrap sorting sorting_desc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">배너 사진</th>
														<th width="10%" class="text-nowrap sorting sorting_desc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="3"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">제목</th>
														<th class="text-nowrap sorting" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" style="width: 118px;" data-column-index="4"
															aria-label="Browser: activate to sort column ascending">설명</th>
														<th width="5%" class="text-nowrap sorting" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="5"
															aria-label="Platform(s): activate to sort column ascending">소유자</th>
														<th width="5%" class="text-nowrap sorting" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="6"
															aria-label="Engine version: activate to sort column ascending">등록일</th>
<!-- 														<th class="text-nowrap sorting" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" style="width: 58px;" data-column-index="6"
															aria-label="CSS grade: activate to sort column ascending">추천수</th> -->
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${copList}" var="cl">
														<tr
															onclick="OpenWindow('copInfo/${cl.copCode}','${cl.copName}','500','800');">
															<%-- <td width="1%"                                                                 				
																class="fw-bold text-inverse dtr-control hide"                              				
																tabindex="0" id="hiding02">                                                				
																<div id="hiding03"                                                         				
																	style="position: absolute; height: 1px; width: 0px; overflow: hidden;">				
																	<input type="text" tabindex="0">                                       				
																</div>                                                                     				
															</td>                         --%>                                                  				
															<td width="1%" class="fw-bold text-inverse dtr-control"                        				
																tabindex="0">                                                              				
																<div                                                                       				
																	style="position: absolute; height: 1px; width: 0px; overflow: hidden;">				
																	<input type="text" tabindex="0">
																</div>${cl.copCode}</td>
															<td>
																<div style="width: 95px; height: 95px; background-repeat: no-repeat; background-size: cover; background-image: url('<%=request.getContextPath() %>/cop/getPictureByCode/${cl.copCode}'); background-repeat: no-repeat;" ></div>
															</td>
															<td>
																<div class="banner-img" style="width: 500px; height: 95px; background-size: cover; background-image: url('<%=request.getContextPath() %>/cop/getBannerByCode/${cl.copCode}'); background-repeat: no-repeat;"></div>
															</td>
															<td>${cl.copName }</td>
															<td>${cl.copDetail }</td>
															<td class="sorting_1">${cl.copOwner}</td>
															<td width="1%">${cl.copRegdate }</td>
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
window.onload = function() {
	var el = document.getElementById('dom');
	el.setAttribute('hidden', '');
	
}

function page(name,img,authority,depCode,rnkCode,email,phone,add,pCode){
	var el = document.getElementById('dom');
	el.removeAttribute('hidden');
	page_go(name,img,authority,depCode,rnkCode,email,phone,add,pCode)
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
		contentType:"application/json",
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
	img.setAttribute('src', '<%=request.getContextPath() %>/resources/images/logo-remove.png');
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
		select : true,
	  	order: [[0, 'desc']],
	  	ordering: true,
	 	serverSide: false,
	 	lengthMenu: [4, 10]
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