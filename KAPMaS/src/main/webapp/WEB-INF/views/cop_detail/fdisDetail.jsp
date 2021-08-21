<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<head>

<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css"
	rel="stylesheet" />
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
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.print.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/pdfmake/build/vfs_fonts.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jszip/dist/jszip.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/css.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/css/vendor.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/css/default/app.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/0.6.5/js/min/perfect-scrollbar.jquery.min.js"></script>


<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/tag-it/css/jquery.tagit.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/summernote/dist/summernote-lite.css"
	rel="stylesheet" />


<script data-cfasync="false"
	src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/js/vendor.min.js"
	type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/js/app.min.js"
	type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/js/theme/default.min.js"
	type="bb927df14e4b0356ad5b69fe-text/javascript"></script>


<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery-migrate/dist/jquery-migrate.min.js"
	type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/tag-it/js/tag-it.min.js"
	type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/summernote/dist/summernote-lite.min.js"
	type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/js/demo/email-compose.demo.js"
	type="bb927df14e4b0356ad5b69fe-text/javascript"></script>

<script type="bb927df14e4b0356ad5b69fe-text/javascript">
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-53034621-1', 'auto');
		ga('send', 'pageview');

	</script>
<script
	src="https://ajax.cloudflare.com/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js"
	data-cf-settings="bb927df14e4b0356ad5b69fe-|49" defer=""></script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js"
	data-cf-beacon='{"rayId":"66f2ccb658aadd8f","version":"2021.6.0","r":1,"token":"4db8c6ef997743fda032d4f73cfeff63","si":10}'></script>
<link href="<%=request.getContextPath()%>/resources/css/css.css"
	rel="stylesheet">
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
			<br> <a onclick="javascript:location.href = '<%=request.getContextPath()%>/cop/detail/discussion/${fdisInfo.copCode}'" style="cursor: pointer;"> 
			<i	class="ion ion-md-arrow-round-back fa-2x fa-fw float-start me-10px text-black-lighter"></i>
			</a>
			<h1 class="page-header">뒤로가기</h1>
			<div class="panel panel-inverse" data-sortable-id="ui-media-object-1"
				data-init="true">
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">${fdisInfo.fdisName}</h4>
					<c:if test="${empid eq loginUser || loginUser eq copOwnerid}">
						<a href="#modal-dialog" class="btn btn-primary" data-bs-toggle="modal">토론방 정보 수정</a>
						&nbsp;
						<a href="#modal-delete" class="btn btn-danger" data-bs-toggle="modal">토론방 삭제</a>
					</c:if>
				</div>
				<div class="panel-body" style="height: 460px; overflow: auto;">
				
					<div class="panel-body p-0">
						<div data-scrollbar="true" data-height="100%" data-skip-mobile="true">
							<c:if test="${empty fdisList}">
									<div class="d-flex">
									<div class="flex-1 ps-3">
										<h5>
										</h5>
										<p>작성된 내용이 없습니다.</p>
									</div>
								</div>
							</c:if>
							<c:forEach var="fl" items="${fdisList }">
								<div class="d-flex">
									<a href="javascript:;" class="w-60px"> <img
										src="../assets/img/user/user-7.jpg" alt=""
										class="mw-100 rounded-pill">
									</a>
									<div class="flex-1 ps-3">
										<h5>
											${fl.fdisCtWriterName}&nbsp;${fl.fdisCtWriter eq loginUser ? '<span class="badge bg-blue">ME</span>' : ''}&nbsp;${fl.fdisCtRegdate}
										</h5>
										<p>${fl.fdisCtContent}</p>
									</div>
								</div>
								<hr class="bg-gray-500">
							</c:forEach>
							<div class="ps__rail-x" style="left: 0px; bottom: -100px;">
								<div class="ps__thumb-x" tabindex="0"
									style="left: 0px; width: 0px;"></div>
							</div>
							<div class="ps__rail-y"
								style="top: 100px; height: 300px; right: 0px;">
								<div class="ps__thumb-y" tabindex="0"
									style="top: 67px; height: 201px;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<form>
						<div class="input-group">
							<input type="hidden" name="fdisCode" value="${fdisCode}">
							<input type="text" class="form-control bg-light" placeholder="내용을 입력하세요" name="fdisCtContent">
							<button class="btn btn-primary" type="button" onclick="registContent();">
								<i class="fa fa-pencil-alt"></i>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">토론방 정보 수정</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
				</div>
				<div class="modal-body">
					<form action="createFdis.do" role="form" method="post">
						<input type="hidden" id="copCode" name="copCode" value="${copCode}">
						<h5>토론방 제목</h5>
						<input type="text" class="form-control" id="fdisName" name="fdisName" value="${fdisInfo.fdisName}">
						<br>						
						<h5>토론방 주제</h5> 
						<input type="text" class="form-control" id="fdisSubject" name="fdisSubject" value="${fdisInfo.fdisSubject}">
					</form>
				</div>
				<div class="modal-footer">
					<a href="javascript:;" class="btn btn-white" data-bs-dismiss="modal">취소</a>
					<a href="javascript:;" class="btn btn-success" onclick="modifyFdis();">수정</a>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-delete">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">토론방 삭제</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
				</div>
				<div class="modal-body">
					<form action="createFdis.do" role="form" method="post">
						<h5>토론방 제목</h5>
						<input type="text" class="form-control" id="deleteConfirmInput" name="deleteConfirmInput" placeholder="삭제하시려면&nbsp;'${fdisInfo.fdisName}/삭제'를 입력해주세요.">
					</form>
				</div>
				<div class="modal-footer">
					<a href="javascript:;" class="btn btn-white" data-bs-dismiss="modal">취소</a>
					<a href="javascript:;" class="btn btn-success" onclick="deleteFdis();">삭제</a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		window.onload = function() {
			$(".summernote").summernote({
				placeholder : '내용을 입력해주세요.',
				height : "150",
				minHeight : "150",
				maxHeight : "150",
				disableResizeEditor : true,
				disableDragAndDrop : true,
				toolbar : false
			});
		}

		function registContent() {

			var fdisCode = $('input[name="fdisCode"]').val();
			var fdisCtContent = $('input[name="fdisCtContent"]').val();
			
			swal({
				title : '등록',
				text : '글을 등록하시겠습니까?',
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
					if (fdisCtContent == "") {
						swal({
							title : '경고',
							text : '내용은 필수 입력란입니다.',
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
						});
						return;
					}
					
					var form = {
							"fdisCtContent" : fdisCtContent,
							"fdisCode" : fdisCode
						}
					
					$.ajax({
						url : "<%=request.getContextPath()%>/cop/detail/discussion/registDiscussionContent.do",
						type : "POST",
						data : form,
						success : function(data) {
							swal({
								title : '등록 성공',
								text : '글 등록에 성공하였습니다.',
								icon : 'success', // primary success warning danger
								buttons : {
									confirm : {
										text : '확인',
										value : true,
										visible : true,
										className : 'btn btn-success',
										closeModal : true
									}
								}
							}).then(function(val) {
								history.go(0);
							})
						},
						error : function() {
							swal({
								title : '오류',
								text : '오류가 발생했습니다. 관리자에게 문의 바랍니다.',
								icon : 'error', // primary success warning danger
								buttons : {
									confirm : {
										text : '확인',
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
		
		function modifyFdis(){
			
			var fdisCode = $('input[name="fdisCode"]').val();
			var fdisName = $('input[name="fdisName"]').val();
			var fdisSubject = $('input[name="fdisSubject"]').val();
			
			swal({
				title : '토론방 정보 수정',
				text : '입력하신 정보로 수정하시겠습니까?',
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
					if (fdisName == "" || fdisSubject == "") {
						swal({
							title : '경고',
							text : '제목, 주제는 필수 입력란입니다.',
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
						});
						return;
					}
				var form = {
					"fdisName" : fdisName,
					"fdisSubject" : fdisSubject,
					"fdisCode" : fdisCode
				}
	
				$.ajax({
					url : "<%=request.getContextPath()%>/cop/detail/discussion/modifyDiscussionInfo.do",
					type : "POST",
					data : form,
					success : function(data) {
						swal({
							title : '수정 성공',
							text : '수정에 성공하였습니다.',
							icon : 'success', // primary success warning danger
							buttons : {
								confirm : {
									text : '확인',
									value : true,
									visible : true,
									className : 'btn btn-primary',
									closeModal : true
								}
							}
						}).then(function(val) {
							location.href="<%=request.getContextPath()%>/cop/detail/discussion/" + data
						});
					},
					error : function() {
						swal({
							title : '오류',
							text : '오류가 발생했습니다.',
							icon : 'error', // primary success warning danger
							buttons : {
								confirm : {
									text : '확인',
									value : true,
									visible : true,
									className : 'btn btn-danger',
									closeModal : true
								}
							}
						});
					}
				});
				}
			});
		}
		
		function deleteFdis(){
			
			var fdisCode = $('input[name="fdisCode"]').val();
			
			var form = {
					"fdisCode" : fdisCode
				}
			
			var inputVal = $('input[name="deleteConfirmInput"]').val();
			
			if(inputVal == "${fdisInfo.fdisName}/삭제"){
				swal({
					title : '토론방 삭제',
					text : '토론방을 삭제하시겠습니까?',
					icon : 'warning', // primary success warning danger
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
							className : 'btn btn-danger',
							closeModal : true
						}
					}
				}).then(function(val) {
					if (val == true) {
						$.ajax({
							url : "<%=request.getContextPath()%>/cop/detail/discussion/deleteDiscussion.do",
							type : "POST",
							data : form,
							success : function(data) {
								swal({
									title : '성공',
									text : '토론방이 성공적으로 삭제 되었습니다.',
									icon : 'success', // primary success warning danger
									buttons : {
										confirm : {
											text : '확인',
											value : true,
											visible : true,
											className : 'btn btn-primary',
											closeModal : true
										}
									}
								}).then(function(val){
									location.href="<%=request.getContextPath()%>/cop/detail/discussion/" + data
								});
							},
							error : function() {
								swal({
									title : '오류',
									text : '오류가 발생했습니다. 관리자에게 문의 바랍니다..',
									icon : 'error', // primary success warning danger
									buttons : {
										confirm : {
											text : '확인',
											value : true,
											visible : true,
											className : 'btn btn-danger',
											closeModal : true
										}
									}
								});
							}
						});
					}
				});
			} else{				
				swal({
					title : '오류',
					text : '입력하신 내용이 일치하지 않습니다.',
					icon : 'error', // primary success warning danger
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-danger',
							closeModal : true
						}
					}
				});
			}
		}
	</script>
</body>