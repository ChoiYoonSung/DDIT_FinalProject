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
			<!-- <br> <a onclick="javascript:history.go(-1)"> 
			<i	class="ion ion-md-arrow-round-back fa-2x fa-fw float-start me-10px text-black-lighter"></i>
			</a>
			<h1 class="page-header">????????????</h1> -->
			<div class="panel panel-inverse" data-sortable-id="ui-media-object-1"
				data-init="true">
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">COP ??????</h4>
				</div>
				<div class="panel-body">
					<div class="col-xl-12 ui-sortable">
						<div class="panel panel-inverse">
							<div class="panel-body">
								<div id="data-table-combine_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
									<div class="dataTables_wrapper dt-bootstrap">
										<div class="row">
											<h4>COP ???????????? ??????</h4>
											<table id="data-table-combine1" class="table table-striped table-bordered align-middle">
												<thead>
													<tr role="row">
														<th width="25%" class="sorting sorting_desc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="0"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">??????</th>
														<th width="25%" data-orderable="false"
															class="sorting_disabled" rowspan="1" colspan="1"
															data-column-index="1" aria-label="">?????????</th>
														<th width="30%" class="text-nowrap sorting sorting_desc"
															tabindex="0" aria-controls="data-table-combine"
															rowspan="1" colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">?????????</th>
														<th width="10%" class="text-nowrap sorting sorting_desc"
															tabindex="0" aria-controls="data-table-combine"
															rowspan="1" colspan="1" data-column-index="3"
															aria-label=": activate to sort column ascending"
															aria-sort="descending"></th>
														<th width="10%" class="text-nowrap sorting sorting_desc"
															tabindex="0" aria-controls="data-table-combine"
															rowspan="1" colspan="1" data-column-index="4"
															aria-label=": activate to sort column ascending"
															aria-sort="descending"></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="rm" items="${requestMember}">
														<tr>
															<td>${rm.empName }</td>
															<td>${rm.empId }</td>
															<td>${rm.empEmail}</td>
															<td style="text-align: center;"><button class="btn btn-primary" onclick="approveRequest('${rm.empId}')">??????</button></td>
															<td style="text-align: center;"><button class="btn btn-danger" onclick="rejectRequest('${rm.empId}')">??????</button></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<hr style="margin-top: 10px;">
											<h4>????????? ?????? ??????</h4>
											<table id="data-table-combine2" class="table table-striped table-bordered align-middle">
												<thead>
													<tr role="row">
														<th width="25%" class="sorting sorting_desc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="0"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">??????</th>
														<th width="25%" data-orderable="false"
															class="sorting_disabled" rowspan="1" colspan="1"
															data-column-index="1" aria-label="">?????????</th>
														<th width="30%" class="text-nowrap sorting sorting_desc"
															tabindex="0" aria-controls="data-table-combine"
															rowspan="1" colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">?????????</th>
														<th width="10%" class="text-nowrap sorting sorting_desc"
															tabindex="0" aria-controls="data-table-combine"
															rowspan="1" colspan="1" data-column-index="3"
															aria-label=": activate to sort column ascending"
															aria-sort="descending"></th>
														<th width="10%" class="text-nowrap sorting sorting_desc"
															tabindex="0" aria-controls="data-table-combine"
															rowspan="1" colspan="1" data-column-index="4"
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
																<td style="text-align: center;"><button class="btn btn-primary" onclick="sendMail('${fl.empId}')">??????</button></td>
																<td style="text-align: center;"><button class="btn btn-danger" onclick="exileFamily('${fl.empId}')">??????</button></td>
															</tr>
														</c:if>
													</c:forEach>
												</tbody>
											</table>
											<hr style="margin-top: 10px;">
											<div class="row">
												<div class="col-3"></div>	
												<div class="col-3">
													<button class="btn btn-primary" type="button" style="padding: 20px;" onclick="readCopInfo();">COP ?????? ??????</button>
												</div>
												<div class="col-2"></div>		
												<div class="col-3">
													<button class="btn btn-primary" type="button" style="padding: 20px;" onclick="inviteFamily();">????????? ??????</button>
												</div>
												<div class="col-2"></div>	
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
	</div>
	<script type="text/javascript">
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
		
		var copCode = "${copCode}";
		
        // ?????? ??????
		function approveRequest(empId){
    		swal({
				title : '?????? ?????? ??????',
				text : '?????? ????????? ?????????????????????????',
				icon : 'info', // primary success warning danger
				buttons : {
					cancel : {
						text : '??????',
						value : false,
						visible : true,
						className : 'btn btn-default',
						closeModal : true,
					},
					confirm : {
						text : '??????',
						value : true,
						visible : true,
						className : 'btn btn-primary',
						closeModal : true
					}
				}
			}).then(function(val) {
				if (val == true) {
			        var form = {
			                "empId" : empId,
			                "copCode" : copCode
				        }
				        
				        $.ajax({
				            url: "approveRequest.do",
				            type: "POST",
				            data : form,
				            success: function(data){
				        		swal({
				    				title : '??????',
				    				text : '?????? ????????? ??????????????????.',
				    				icon : 'success', // primary success warning danger error
				    				buttons : {
				    					confirm : {
				    						text : '??????',
				    						value : true,
				    						visible : true,
				    						className : 'btn btn-success',
				    						closeModal : true
				    					}
				    				}
				    			}).then(function(val) {
					                history.go(0);
				    			});
				            },
				            error: function(){
				        		swal({
				    				title : '??????',
				    				text : '????????? ??????????????????. ??????????????? ???????????????.',
				    				icon : 'error', // primary success warning danger error
				    				buttons : {
				    					confirm : {
				    						text : '??????',
				    						value : true,
				    						visible : true,
				    						className : 'btn btn-danger',
				    						closeModal : true
				    					}
				    				}
				    			})
				            }
				        });
				}
			});
		}

        // ?????? ??????

		function rejectRequest(empId) {
			swal({
				title : '?????? ?????? ??????',
				text : '?????? ????????? ?????????????????????????',
				icon : 'info', // primary success warning danger
				buttons : {
					cancel : {
						text : '??????',
						value : false,
						visible : true,
						className : 'btn btn-default',
						closeModal : true,
					},
					confirm : {
						text : '??????',
						value : true,
						visible : true,
						className : 'btn btn-primary',
						closeModal : true
					}
				}
			}).then(function(val) {
				if (val == true) {
					var form = {
						"empId" : empId,
						"copCode" : copCode
					}

					$.ajax({
						url : "rejectRequest.do",
						type : "POST",
						data : form,
						success : function(data) {
							swal({
								title : '??????',
								text : '?????? ????????? ??????????????????.',
								icon : 'info', // primary success warning danger error
								buttons : {
									confirm : {
										text : '??????',
										value : true,
										visible : true,
										className : 'btn btn-primary',
										closeModal : true
									}
								}
							}).then(function(val) {
				                history.go(0);
			    			});
						},
						error : function() {
							swal({
								title : '??????',
								text : '????????? ??????????????????. ??????????????? ???????????????.',
								icon : 'error', // primary success warning danger error
								buttons : {
									confirm : {
										text : '??????',
										value : true,
										visible : true,
										className : 'btn btn-danger',
										closeModal : true
									}
								}
							})
						}
					});
				}
			});
		}

		function sendMail(empId) {
			location.href = "sendMailToFamily.do?empId=" + empId + "&copCode=" + copCode;
		}

		function exileFamily(empId) {
			location.href = "exileMemberForm.do?empId=" + empId + "&copCode=" + copCode;
		}

		function readCopInfo() {
			location.href = "getCopInfoForm.do?copCode=" + copCode;
		}

		function inviteFamily() {
			location.href = "copInviteForm.do?copCode=" + copCode;
		}
	</script>
</body>	