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
<script defer src="https://static.cloudflareinsights.com/beacon.min.js"
	data-cf-beacon='{"rayId":"66f2ccb658aadd8f","version":"2021.6.0","r":1,"token":"4db8c6ef997743fda032d4f73cfeff63","si":10}'></script>
<link href="<%=request.getContextPath()%>/resources/css/css.css"
	rel="stylesheet">
</head>
<body>
	<div class="row" style="margin: 0px;">
		<div class="col-xl-12 ui-sortable">
			<br> <a onclick="javascript:location.href='<%=request.getContextPath()%>/cop/detail/coppds/${copCode}'" style="cursor: pointer;"> <i
				class="ion ion-md-arrow-round-back fa-2x fa-fw float-start me-10px text-black-lighter"></i>
			</a>
			<h1 class="page-header">뒤로가기</h1>
			<div class="panel panel-inverse" data-sortable-id="ui-media-object-1"
				data-init="true">
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">자료 상세정보</h4>
				</div>
				<div class="panel-body">
					<div class="col-xl-12 ui-sortable">
						<div class="panel panel-inverse">
							<div class="panel-body">
								<form enctype="multipart/form-data" method="post" action="/KAPMaS/cop/detail/pdsRegist.do" name="registForm">
									<input type="hidden" name="copCode" value="${copCode}">
									<h1>제목 : ${ca.caTitle }</h1>
									<h3>작성자 : ${ca.empName }</h3>
									<hr>
									<textarea class="summernote" name="caContent">${ca.caContent }</textarea>
									<hr>
									<c:if test="${loginUser == ca.empId || loginUser eq copOwnerId}">
										<div style="margin-left: auto; width: 210px;">
											<button type="button" class="btn btn-warning w-100px me-5px" id="registBtn" onclick="location.href='pdsModifyForm/${ca.caCode}'">수정</button>
											<button type="button" class="btn btn-danger w-100px" id="cancelBtn" onclick="pdsRemoveConfirm();">삭제</button>
										</div>
									</c:if>
									<br>
									<div class="form-group">
										<div class="card card-outline card-success">
											<div class="card-header">
												<h5 style="display: inline; line-height: 40px;">첨부파일</h5>
											</div>
											<div class="card-footer fileInput">
												<c:forEach var="attach" items="${ca.attachList }">
													<div class="info-box" style="cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/cop/detail/getCAFile.do?caatno=${attach.caAtNo }';">	
														<i class="far fa-lg fa-fw me-10px fa-file"></i><span class="badge bg-yellow">${attach.caAtName }</span>
													</div>
													&nbsp;
												</c:forEach>		
											</div>
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
	<script type="text/javascript">
	
		window.onload = function() {
			$(".summernote").summernote({
			    placeholder: '내용을 입력해주세요.',
			    height: "300",
			    minHeight: "300",              
			    maxHeight: "300",
			    disableResizeEditor: true,
			    toolbar : false
		    });
			
			$('.summernote').summernote('disable');
			
		 	$('.fileInput').on('change','input[type="file"]',function(event){
		 		if(this.files[0].size>1024*1024*40){
		 			alert("파일 용량이 40MB를 초과하였습니다.");
		 			this.value="";
		 			$(this).click();		 			
		 			return false;
		 		} 
	    	});
		 	
		 	$('div.fileInput').on('click','div.inputRow > button',function(event){
		 		$(this).parent('div.inputRow').remove();
		 	});
		 	
		 	
		}
		
		function pdsRemoveConfirm(){
    		swal({
				title : '자료실 글 삭제',
				text : '선택한 글을 삭제하시겠습니까?',
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
					location.href='pdsRemove/${ca.caCode}'
				}
			});
		};
    </script>
</body>