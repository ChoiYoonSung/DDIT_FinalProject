<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<head>
<style>
</style>
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
<script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js" data-cf-settings="bb927df14e4b0356ad5b69fe-|49" defer=""></script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js"	data-cf-beacon='{"rayId":"66f2ccb658aadd8f","version":"2021.6.0","r":1,"token":"4db8c6ef997743fda032d4f73cfeff63","si":10}'></script>
<link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">
</head>
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
					<h4 class="panel-title">COP 초대</h4>
				</div>
				<div class="panel-body">
					<div class="">
						<div class="mailbox-content">
							<div class="mailbox-content-header">
								<div class="btn-toolbar align-items-center">
									<div class="btn-group me-2" onclick="send();">
										<a href="#" class="btn btn-white btn-sm"><i
											class="fa fa-fw fa-envelope"></i> <span class="hidden-xs">Send</span></a>
									</div>
									<div>
										<select style="width: 120px; float: left;" name="dep" id="dep"
											class="form-select">
											<option value="">-부서 선택-</option>
											<c:forEach items="${depList }" var="dep">
												<option value="${dep.depCode }">${dep.depName }</option>
											</c:forEach>

										</select>
									</div>
									&nbsp;&nbsp;
									<div>
										<button type="button" class="btn btn-white me-1 mb-1"
											onclick="getList();">찾기</button>
									</div>
									<!-- <div class="ms-auto">
						<a href="email_inbox.html" class="btn btn-white btn-sm"><i
							class="fa fa-fw fa-times"></i> <span class="hidden-xs">Discard</span></a>
					</div> -->
								</div>

							</div>
							<div class="mailbox-content-body">

								<div data-scrollbar="true" data-height="100%"
									data-skip-mobile="true" class="ps" data-init="true"
									style="height: 100%;">

									<form
										action="<%=request.getContextPath()%>/mypage/projecterRegist.do"
										method="post" enctype="multipart/form-data" name="sendForm">
										<input type="hidden" value="${cop.copCode}" name="path">

										<div class="mailbox-to">
											<table class="table">
												<thead>
													<tr>
														<th>직급</th>
														<th>이름</th>
														<th>선택</th>
													</tr>
												</thead>
												<tbody id="depList"></tbody>
											</table>
										</div>
										<div class="mailbox-to">
											<label class="control-label">To: </label>
											&nbsp;&nbsp;&nbsp;&nbsp; <u id="addList"></u>
										</div>

										<div data-id="extra-cc"></div>

										<div class="mailbox-subject">
											<input type="text" hidden="" class="form-control"
												id="paTitle" name="title" placeholder=""
												value="${cop.copName}의 COP 초대">
										</div>

										<textarea class="form-control" hidden="" rows="15"
											name="content">
						
						<div style="margin: 0 auto; width: 30%;">
							<button type="button" class="btn btn-gray me-1 mb-1"
													style="float: left;" onclick="Close();">&nbsp;&nbsp;&nbsp;거 &nbsp;&nbsp;절&nbsp;&nbsp;&nbsp;</button>
							<button type="button" class="btn btn-yellow me-1 mb-1"
													style="float: left;" onclick="acceptCopInvite('${cop.copCode}');">&nbsp;&nbsp;&nbsp;승&nbsp;&nbsp;인&nbsp;&nbsp;&nbsp;</button>
						</div>
						
						
						</textarea>
										<input hidden="" value="" id="empList" name="empList">
									</form>

									<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
										<div class="ps__thumb-x" tabindex="0"
											style="left: 0px; width: 0px;"></div>
									</div>
									<div class="ps__rail-y" style="top: 0px; right: 0px;">
										<div class="ps__thumb-y" tabindex="0"
											style="top: 0px; height: 0px;"></div>
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
			$(".summernote").summernote({
				placeholder : '내용을 입력해주세요.',
				height : "300",
				minHeight : "300",
				maxHeight : "300",
				disableResizeEditor : true,
				toolbar : false
			});

			var copCode = "${copCode}";

			$('input[name="copCode"]').val(copCode);
		}

		function sendMail_go() {
			if ($("input[name='mailTitle']").val() == "") { //form.title.value
    			swal({
					title : '경고',
					text : '제목은 필수입니다.',
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
				});
				$("input[name='mailTitle']").focus();
				return;
			}
			
    		swal({
				title : '알림',
				text : '쪽지를 전송하시겠습니까?',
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
					document.registForm.submit();
				}
			});
		}
		
		function getList(){
			
			var depCode = $("#dep option:selected").val();
			
			var data = {
					"depCode":depCode
			}
				
			$.ajax({
				url : "<%=request.getContextPath()%>/mypage/getList",
						type : "post",
						data : JSON.stringify(data),
						contentType : "application/json;charset=utf-8",
						success : function(data) {

							var html = "";

							for (var i = 0; i < data.depEmpList.length; i++) {
								html += '<tr>';
								html += '<td>' + data.depEmpList[i].rnkName
										+ '</td>';
								html += '<td>' + data.depEmpList[i].empName
										+ '</td>';
								html += '<td><a href="javascript:addEmp(&#39;'
										+ data.depEmpList[i].empId
										+ '&#39;&#44;&#39;'
										+ data.depEmpList[i].empName
										+ '&#39;);" class="btn btn-info btn-icon btn-circle btn-sm"><i class="fab fa-twitter"></i></a></td>';
								html += '</tr>';

							}

							$("#depList").empty();
							$("#depList").append(html);

						},

						error : function(error) {
			    			swal({
								title : '에러',
								text : '에러가 발생했습니다. 관리자에게 문의바랍니다.',
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

		function addEmp(empId, empName) {

			if ($("#" + empId).val() == undefined) {

				var html = "";
				html += '<span id='+empId+' class="empId" value='+empId+'>';
				html += '' + empName + '';
				html += '<a href="javascript:remove(&#39;'
						+ empId
						+ '&#39;);" class="btn btn-danger btn-icon btn-circle btn-sm"><i class="fa fa-times"></i></a>'
				html += '</span>';
				$("#addList").append(html);

				return;
			}
			
			swal({
				title : '경고',
				text : '이미 추가한 사원입니다.',
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
			});
		}

		function remove(empId) {

			$("#" + empId).remove();

		}

		function send() {
			var html = '';
			var len = $(".empId").length;
			if (len == 0) {
				swal({
					title : '경고',
					text : '사원을 선택하여 주십시오.',
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
				});
				return;
			}

			for (var i = 0; i < len; i++) {
				$(".empId")[i].innerHTML = '';
			}

			if (len == 1) {
				var id = $(".empId");
				html += '' + id.attr('id') + '';
				$('#empList').val(html);
			} else {

				for (var i = 0; i < len; i++) {

					var id = $(".empId").eq(i);
					if (i == 0) {
						html += '' + id.attr('id') + '';
						continue;
					}

					html += ',';
					html += '' + id.attr('id') + '';

					$('#empList').val(html);
				}

			}
			document.sendForm.submit();
		}
	</script>
</body>