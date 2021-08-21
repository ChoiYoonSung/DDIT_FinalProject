<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
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

<%-- <link href="<%=request.getContextPath()%>/resources/bootstrap/assets/css/forum/app.min.css" rel="stylesheet"> --%>
<link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">

<c:set value="${archiveList }" var="cal" />
<style>
#dom {
	box-shadow: 2px 2px 10px silver;
	border-radius: 10px;
	padding: 17px;
}
</style>

</head>
<body>
	<div class="row" style="margin: 0px;">
		<div class="col-xl-12 ui-sortable">
			<div class="panel panel-inverse" data-sortable-id="ui-media-object-1"
				data-init="true">
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">프로젝트 공유</h4>
				</div>
				<div class="panel-body">
					<div class="col-xl-12 ui-sortable">
						<div class="panel panel-inverse">
							<div class="panel-body">
								<div id="data-table-combine_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
									<div class="dataTables_wrapper dt-bootstrap">
										<div class="row">
											<h4>참여중인 프로젝트</h4>
											<table id="data-table-combine1" class="table table-striped table-bordered align-middle">
												<thead>
													<tr role="row">
														<th width="40%" class="sorting sorting_desc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="0"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">프로젝트 명</th>
														<th width="20%" data-orderable="false"
															class="sorting_disabled" rowspan="1" colspan="1"
															data-column-index="1" aria-label="">시작일</th>
														<th width="20%" class="text-nowrap sorting sorting_desc"
															tabindex="0" aria-controls="data-table-combine"
															rowspan="1" colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">종료일</th>
														<th width="10%" class="text-nowrap sorting sorting_desc"
															tabindex="0" aria-controls="data-table-combine"
															rowspan="1" colspan="1" data-column-index="3"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">PL</th>
														<th width="10%" class="text-nowrap sorting sorting_desc"
															tabindex="0" aria-controls="data-table-combine"
															rowspan="1" colspan="1" data-column-index="4"
															aria-label=": activate to sort column ascending"
															aria-sort="descending"></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="pl" items="${projectList}">
														<tr>
															<td>${pl.pName }</td>
															<td>${pl.pStartdate }</td>
															<td>${pl.pEnddate}</td>
															<td>${pl.empName}</td>
															<td style="text-align: center;"><button class="btn btn-primary" onclick="addProject('${pl.pCode}','${pl.pName}', '${pl.empName}', '${pl.empId}')">선택</button></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<hr style="margin-top: 10px;">
											<h4>패밀리 목록</h4>
											<table id="data-table-combine2" class="table table-striped table-bordered align-middle">
												<thead>
													<tr role="row">
														<th width="30%" class="sorting sorting_desc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="0"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">이름</th>
														<th width="30%" data-orderable="false"
															class="sorting_disabled" rowspan="1" colspan="1"
															data-column-index="1" aria-label="">아이디</th>
														<th width="30%" class="text-nowrap sorting sorting_desc"
															tabindex="0" aria-controls="data-table-combine"
															rowspan="1" colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">이메일</th>
														<th width="10%" class="text-nowrap sorting sorting_desc"
															tabindex="0" aria-controls="data-table-combine"
															rowspan="1" colspan="1" data-column-index="3"
															aria-label=": activate to sort column ascending"
															aria-sort="descending"></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="fl" items="${familyList}">
														<c:if test="${fl.empId != loginUser}">
															<tr>
																<td>${fl.empName }</td>
																<td>${fl.empId}</td>
																<td>${fl.empEmail }</td>
																<td style="text-align: center;"><button class="btn btn-primary" onclick="addFamily('${fl.empName}', '${fl.empId}')">선택</button></td>
															</tr>
														</c:if>
													</c:forEach>
												</tbody>
											</table>
											<hr style="margin-top: 10px;">
											<form action="projectShare.do" method="post" role="form">
												<div class="row">
													<div class="col-1"></div>
													<div class="form-floating col-3" style="height: 100px;">
														<div class="form-group">
															<div class="card card-outline card-success">
																<div class="card-header">
																	<h5 style="display: inline; line-height: 40px;">선택한 프로젝트</h5>
																</div>
																<div class="card-footer projectInput">
																	<input type="text" id="projectName" name="projectName" class="form-control" placeholder="프로젝트를 선택하세요" value="" readonly="readonly"/>
																	<input type="hidden" id="projectNo" name="projectNo" value="">
																	<input type="hidden" id="projectPL" name="projectPL" value="">
																	<input type="hidden" id="projectPLID" name="projectPLID" value="">
																</div>
															</div>
														</div>
													</div>
													<div class="col-1"></div>
													<div class="form-floating col-3" style="height: 100px;">
														<div class="form-group">
															<div class="card card-outline card-success">
																<div class="card-header">
																	<h5 style="display: inline; line-height: 40px;">공유받을 패밀리</h5>
																</div>
																<div class="card-footer peopleInput">
																</div>
															</div>
														</div>
													</div>
													<div class="col-1"></div>
													<input type="hidden" id="copCode" name="copCode" class="form-control" value="${copCode }" readonly="readonly"/>
													<button type="button" class="btn btn-yellow me-1 mb-1 col-2" onclick="shareProject();" style="height: 100px;">공유</button>
													<div class="col-1"></div>
												</div>
											</form>
											<form action="projectShare.do" method="post" role="notPLForm">
												<input type="hidden" id="copCode" name="copCode" class="form-control" value="${copCode }" readonly="readonly"/>
												<input type="hidden" id="projectName" name="projectName" class="form-control" value="" readonly="readonly"/>
												<input type="hidden" id="projectNo" name="projectNo" value="">
												<input type="hidden" id="projectPL" name="projectPL" value="">
												<input type="hidden" id="projectPLID" name="projectPLID" value="">
												<textarea class="form-control"  hidden="" rows="15" name="content"></textarea>
											</form>
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
	 	$('div.peopleInput').on('click','div.inputRow > button',function(event){
	 		$(this).parent('div.inputRow').remove();
	 	});
	
	 	function shareProject(){
	 		var project = $('input[id="projectName"]').val();
	 		var selectFamily = $('div[class="card-footer peopleInput"]').children().length;
	 		
	 		if(project == ""){
	 			swal({
	 				title : '경고',
	 				text : '프로젝트를 선택해주세요',
	 				icon : 'warning', // primary success warning error
	 				buttons : {
	 					confirm : {
	 						text : '확인',
	 						value : true,
	 						visible : true,
	 						className : 'btn btn-warning',
	 						closeModal : true
	 					}
	 				}
	 			})
	 			return;
	 		}
	 		
	 		if(selectFamily == 0){
	 			swal({
	 				title : '경고',
	 				text : '공유할 패밀리를 선택해주세요',
	 				icon : 'warning', // primary success warning error
	 				buttons : {
	 					confirm : {
	 						text : '확인',
	 						value : true,
	 						visible : true,
	 						className : 'btn btn-warning',
	 						closeModal : true
	 					}
	 				}
	 			})
	 			return;
	 		}
	 		
			var projectName = $('input[name="projectName"]').val();
			var projectNo = $('input[name="projectNo"]').val();
			var projectPL = $('input[name="projectPL"]').val();
			var projectPLID = $('input[name="projectPLID"]').val();
			var selectedNames = "";
			var selectedFamily = "";
			
			for(var i=0; i<$('input[name="selectedName"]').length; i++){
				selectedNames += $('input[name="selectedName"]')[i].value + ","
				selectedFamily += $('input[name="selectedFamily"]')[i].value + ","
			}
			selectedNames = selectedNames.trim().slice(0, -1);
			selectedFamily = selectedFamily.trim().slice(0, -1);
			
			var ssivar = "<form action='shareApprove.do' method='post' role='form'>"
					   + "<div style='margin: 0 auto;width:30%;'>공유할 프로젝트" 
					   + "<input type='text' id='projectName' name='projectName' class='form-control'" 
					   + "placeholder='프로젝트를 선택하세요' value=" + projectName +" readonly='readonly'/>"
					   + "<input type='hidden' id='projectNo' name= 'projectNo' value=" + projectNo + ">"
					   + "<input type='hidden' id='projectPL' name='projectPL' value=" + projectPL + ">"
					   + "<input type='hidden' id='projectPLID' name='projectPLID' value=" + projectPLID + ">"
					   + "공유받는 패밀리<input type='text' class='form-control' id='selectedNames' name='selectedNames' value=" + selectedNames + " readonly='readonly'>"
					   + "<input type='hidden' id='selectedFamily' name='selectedFamily' value=" + selectedFamily + ">"
					   + "<button type='button' class='btn btn-gray me-1 mb-1' style='float: left;' onclick='Close();'>&nbsp;&nbsp;&nbsp;거 &nbsp;&nbsp;절&nbsp;&nbsp;&nbsp;</button>"
					   + "<button type='submit' class='btn btn-yellow me-1 mb-1' style='float: left;'>&nbsp;&nbsp;&nbsp;승&nbsp;&nbsp;인&nbsp;&nbsp;&nbsp;</button>"
					   + "</div></form>";
	 		
			$('textarea[name="content"]').html(ssivar);

	 		var form = $('form[role="form"]'); // loginUser == projectPL
	 		var notPLForm = $('form[role="notPLForm"]'); // loginUser != projectPL
			
			if("${loginUser}" != projectPLID){
	    		swal({
					title : '프로젝트 공유 승인 요청',
					text : '프로젝트 공유 승인 요청을 보내시겠습니까?',
					icon : 'info', // primary success warning danger
					buttons : {
						cancel : {
							text : '취소',
							value : false,
							visible : true,
							className : 'btn btn-default',
							closeModal : true,
						},
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-primary',
							closeModal : true
						}
					}
				}).then(function(val) {
					if (val == true) {
						notPLForm.submit();
					}
				});
			} else {
	    		swal({
					title : '프로젝트 공유',
					text : '프로젝트를 공유하시겠습니까?',
					icon : 'info', // primary success warning danger
					buttons : {
						cancel : {
							text : '취소',
							value : false,
							visible : true,
							className : 'btn btn-default',
							closeModal : true,
						},
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-primary',
							closeModal : true
						}
					}
				}).then(function(val) {
					if (val == true) {
				 		form.submit();		
					}
				});
			}
	 	}
	 	
		function addFamily(empName, empId){
			
			var selectedFamily = $("input[name='selectedFamily']");
			var projectPL = $('input[id="projectPL"]').val();
			
			if (empId == projectPLID)	{
	 			swal({
	 				title : '경고',
	 				text : '프로젝트의 PL에게는 초대를 보낼 수 없습니다.',
	 				icon : 'warning', // primary success warning error
	 				buttons : {
	 					confirm : {
	 						text : '확인',
	 						value : true,
	 						visible : true,
	 						className : 'btn btn-warning',
	 						closeModal : true
	 					}
	 				}
	 			})
				return;
			}
					
			for (var i = 0; i < selectedFamily.length; i++) {
				if (empId == selectedFamily[i].value) {
		 			swal({
		 				title : '경고',
		 				text : '이미 추가되어 있는 패밀리입니다.',
		 				icon : 'warning', // primary success warning error
		 				buttons : {
		 					confirm : {
		 						text : '확인',
		 						value : true,
		 						visible : true,
		 						className : 'btn btn-warning',
		 						closeModal : true
		 					}
		 				}
		 			})
					return;
				}
			}
			
			var input=$('<input>').attr({"type":"text", "name" : "selectedName","value" : empName, "readonly" : "readonly"}).css({"display" : "inline" , "width" : "50px"});
			var hiddenInput=$('<input>').attr({"type":"hidden","name":"selectedFamily", "value" : empId, "readonly" : "readonly"});
			var div=$('<div>').addClass("inputRow");
			div.append(hiddenInput)
			div.append(input).append("<button style='border:0;outline:0;' class='badge bg-red' type='button'>삭제</button");
			$('.peopleInput').append(div);
		}
		
		function addProject(pno, pname, plName, plID) {
			$('input[id="projectName"]').val(pname);
			$('input[id="projectNo"]').val(pno);
			$('input[id="projectPL"]').val(plName);
			$('input[id="projectPLID"]').val(plID);
		}

		var options = {
			dom : '<"dataTables_wrapper dt-bootstrap"<"row"<"col-xl-12 d-xl-block justify-content-center"fr>>t<"row"<"col-md-5"i><"col-md-7"p>>>',
			buttons : [],
			pageLength : 5,
			keys : true,
			bLengthChange : false,
			order : [ [ 0, 'desc' ] ],
			ordering : true,
			serverSide : false,
			lengthMenu : false
		};

		$('#data-table-combine1').DataTable(options);

		$('#data-table-combine2').DataTable(options);

		if ($(window).width() <= 767) {
			options.rowReorder = false;
			options.colReorder = false;
		}
	</script>
</body>