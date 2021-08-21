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
<script
	src="https://ajax.cloudflare.com/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js"
	data-cf-settings="bb927df14e4b0356ad5b69fe-|49" defer=""></script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js"
	data-cf-beacon='{"rayId":"66f2ccb658aadd8f","version":"2021.6.0","r":1,"token":"4db8c6ef997743fda032d4f73cfeff63","si":10}'></script>
<link href="<%=request.getContextPath()%>/resources/css/css.css"
	rel="stylesheet">
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
					<h4 class="panel-title">쪽지</h4>
				</div>
				<div class="panel-body">
					<div class="col-xl-12 ui-sortable">
						<div class="panel panel-inverse">
							<div class="panel-body">
								<form method="post" action="sendMail.do" name="registForm">
									<input type="hidden" name="copCode" value="${copCode }">
									<div class="row">
										<div class="col-3" style="text-align: right;">
											<h3>보내는 사람</h3>
											<br>
											<h3>받는 사람</h3>
											<br>
											<h3>제목</h3>
										</div>
										<div class="col-6">
											<input type="text" class="form-control" id="sender" name="sender" value="${loginUser }" readonly="readonly"/>
											<br>
											<input type="text" class="form-control" id="receiver" name="receiver" value="${empId}" readonly="readonly"/>
											<br>
											<input type="text" class="form-control" id="mailTitle" name="title" placeholder="제목을 입력해주세요." />
										</div>
										<div class="col3"></div>
									</div>
									<hr>
									<textarea class="summernote" name="content"></textarea>
									<hr>
									<div style="width:210px;  margin:0 auto; margin-top: 30px;">
										<button type="button" class="btn btn-primary w-100px me-5px" id="registBtn" onclick="sendMail_go();">전송</button>
										<button type="button" class="btn btn-default w-100px" id="cancelBtn" onclick="javascript:history.go(-1)">취소</button>
									</div>
								</form>
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
			
			if ($('textarea[name="content"]').val() == ""){
    			swal({
					title : '경고',
					text : '내용은 필수입니다.',
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
				$("textarea[name='content']").focus();
				return;
			}

    		swal({
				title : '쪽지 전송',
				text : '쪽지를 전송하시겠습니까?',
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
						className : 'btn btn-warning',
						closeModal : true
					}
				}
			}).then(function(val) {
				if (val == true) {
					document.registForm.submit();
				}
			});
		}
	</script>
</body>