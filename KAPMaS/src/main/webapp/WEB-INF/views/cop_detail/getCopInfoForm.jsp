<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/switchery/dist/switchery.min.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/switchery/dist/switchery.min.js"></script>
<!DOCTYPE html>
<body>
	<div class="row" style="margin: 0px;">
		<div class="col-xl-12 ui-sortable">
			<br> <a onclick="javascript:history.go(-1)" style="cursor: pointer;"> <i
				class="ion ion-md-arrow-round-back fa-2x fa-fw float-start me-10px text-black-lighter"></i>
			</a>
			<h1 class="page-header">뒤로가기</h1>
			<div class="panel panel-inverse" data-sortable-id="ui-media-object-1"
				data-init="true">
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">COP 정보 조회</h4>
				</div>
				<div class="panel-body">
					<div class="col-xl-12 ui-sortable">
						<div class="panel panel-inverse">
							<div class="panel-body">
								<form method="post" action="exileFamily.do" name="registForm">
									<div class="row">
										<div class="col-6">
											<!-- BEGIN register-content -->
											<div class="register-content">
												<div class="mb-3">
													<h3>
														CoP 프로필 사진<span class="text-danger"></span>
													</h3>
													<div class="mailbox-attachment-icon has-img" id="copProfile"
														style="border: 1px solid green; height: 150px; width: 150px; margin: 0 auto; text-align: center; background-size: cover; background-repeat: no-repeat; background-image: url('<%=request.getContextPath() %>/cop/getPictureByCode/${copInfo.copCode}');"></div>
													<br>
												</div>
												<br>
												<div class="mb-3">
													<h3>
														CoP 배너<span class="text-danger"></span>
													</h3>
													<div class="mailbox-attachment-icon has-img" id="copBanner"
														style="border: 1px solid green; height: 100px; margin: 0 auto; background-size: cover; background-repeat: no-repeat; background-image: url('<%=request.getContextPath() %>/cop/getBannerByCode/${copInfo.copCode}');"></div>
													<br>
												</div>
											</div>
										</div>
										<div class="col-6">
											<div class="register-content">
												<div class="mb-3">
													<h3>
														CoP 이름<span class="text-danger"></span>
													</h3>
													<div class="row gx-3">
														<div class="col-md-12 mb-2 mb-md-0">
															<input type="text" class="form-control fs-13px"
																placeholder="CoP Name" id="copName" name="copName" readonly="readonly" value="${copInfo.copName }">
														</div>
													</div>
												</div>
												<br>
												<div class="mb-3">
													<h3>
														CoP 주제<span class="text-danger"></span>
													</h3>
													<input type="text" class="form-control fs-13px"
														placeholder="CoP Subject" id="copSubject"
														name="copSubject" readonly="readonly" value="${copInfo.copSubject}"/>
												</div>
												<br>
												<div class="mb-3">
													<h3>
														CoP 설명<span class="text-danger"></span>
													</h3>
													<textarea rows="" cols="" class="form-control fs-13px"
														style="margin-top: 0px; margin-bottom: 0px; height: 102px; resize: none;"
														placeholder="CoP Description" id="copDetail"
														name="copDetail" readonly="readonly">${copInfo.copDetail}</textarea>
												</div>
												<br>
												<div class="mb-3">
													<h3>
														CoP 공개 여부<span class="text-danger"></span>
													</h3>
													<div class="mb-4" style="text-align: center;" id="clickDiv">
														비공개 <input type="checkbox" id="switchery-default" role="openCheck" ${copInfo.copType eq '1' ? 'checked' : '' }/>공개 
														<input type="hidden" value="1" name="copType" id="copType">
													</div>
												</div>
												<div style="display: none;">
													<input id="profileImg" name="copProfileimg" value="">
													<input id="bannerImg" name="copBannerimg" value="">
												</div>
											</div>
										</div>
										<hr>
										<div class="row">
											<div class="col-3"></div>
											<div class="col-4">
												<button type="button" class="btn btn-primary w-100px" onclick="infoModify_go();">수정</button>
											</div>
											<div class="col-4">
												<a href="#modal-delete" class="btn btn-danger w-100px me-5px" data-bs-toggle="modal">COP 삭제</a>
											</div>
											<div class="col-3"></div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-delete">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">COP 삭제</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
				</div>
				<div class="modal-body">
					<form action="createFdis.do" role="form" method="post">
						<h5>삭제 확인</h5>
						<input type="text" class="form-control" id="deleteConfirmInput" name="deleteConfirmInput" placeholder="삭제하시려면&nbsp;'${copInfo.copName}/삭제'를 입력해주세요.">
					</form>
				</div>
				<div class="modal-footer">
					<a href="javascript:;" class="btn btn-white" data-bs-dismiss="modal">취소</a>
					<a href="javascript:;" class="btn btn-success" onclick="deleteCop();">삭제</a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	var copCode = location.href.split('=')[1];
	
	var elm = document.getElementById('switchery-default');
	var switchery = new Switchery(elm, {
		color : '#00acac'
	});

	switchery.disable(); // enable
	/* switchery.disable(); // disable
	switchery.destroy(); // destroy */
	
	function infoModify_go(){
		location.href="<%=request.getContextPath()%>/cop/detail/copManage/infoModifyForm.do?copCode=" + copCode;
	}
	
	function deleteCop(){
		
		var form = {
				"copCode" : copCode
			}
		
		var inputVal = $('input[name="deleteConfirmInput"]').val();
		if(inputVal == "${copInfo.copName}/삭제"){
				swal({
					title : 'COP 삭제',
					text : '정말로 삭제하시겠습니까?',
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
						$.ajax({
							url : "<%=request.getContextPath()%>/cop/deleteCop.do",
							type : "POST",
							data : form,
							success : function(data) {
								swal({
									title : 'COP 삭제 성공',
									text : 'COP가 성공적으로 삭제 되었습니다.',
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
									if (val == true) {
										window.parent.close();
										window.parent.opener.location.reload(true);
									}
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
			} else{
				swal({
					title : '경고',
					text : '입력하신 내용과 일치하지 않습니다.',
					icon : 'warning', // primary success warning danger
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
			}
		}
	</script>
</body>