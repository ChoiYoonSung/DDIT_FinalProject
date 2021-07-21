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
			<br> <a onclick="javascript:history.go(-1)"> <i
				class="ion ion-md-arrow-round-back fa-2x fa-fw float-start me-10px text-black-lighter"></i>
			</a>
			<h1 class="page-header">뒤로가기</h1>
			<div class="panel panel-inverse" data-sortable-id="ui-media-object-1"
				data-init="true">
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">자료 등록</h4>
				</div>
				<div class="panel-body">
					<div class="col-xl-12 ui-sortable">
						<div class="panel panel-inverse">
							<div class="panel-body">
								<form enctype="multipart/form-data" method="post" action="/KAPMaS/cop/detail/pdsModify.do" name="modifyForm" role="form">
									<input type="hidden" name="caCode" value="${ca.caCode }">
									<input type="text" class="form-control" id="pdsTitle" name="caTitle" placeholder="제목을 입력해주세요." value="${ca.caTitle }"/>
									<hr>
									<textarea class="summernote" name="caContent">${ca.caContent }</textarea>
									<hr>
									<div class="form-group">
										<div class="card card-outline card-success">
											<div class="card-header">
												<h5 style="display: inline; line-height: 40px;">첨부파일 :
												</h5>
												&nbsp;&nbsp;
												<button class="btn btn-xs btn-primary"
													onclick="addFile_go();" type="button" id="addFileBtn">Add
													File</button>
											</div>
											<div class="card-footer fileInput">
												<ul class="mailbox-attachments align-items-stretch clearfix">
													<c:forEach items="${ca.attachList }" var="attach" >
														<li class="attach-item">																			
															<div class="mailbox-attachment-info">
																<a class="mailbox-attachment-name" name="attachedFile"  style="text-decoration: none;color:black;" 
																	attach-fileName="${attach.caAtName }" attach-no="${attach.caAtNo }">													
																	<i class="fas fa-paperclip"></i>
																	${attach.caAtName }&nbsp;&nbsp;
																	<button type="button" style="border:0;outline:0;" class="badge bg-red">삭제</button>																									
																</a>													
															</div>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
									<div style="width:210px;  margin:0 auto; margin-top: 30px;">
										<button type="button" class="btn btn-primary w-100px me-5px" id="registBtn" onclick="modify_submit();">등록</button>
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
			    placeholder: '내용을 입력해주세요.',
			    height: "300",
			    minHeight: "300",              
			    maxHeight: "300",
			    disableResizeEditor: true
		    });
			
			//첨부파일===================================
			$('a[name="attachedFile"] > button').click(function(event){
				
				var parent = $(this).parent('a[name="attachedFile"]');
				alert(parent.attr("attach-fileName")+"파일을 삭제합니다.");
				
				var caAtNo = parent.attr("attach-no");
				
				$(this).parents('li.attach-item').remove();
				
				var input=$('<input>').attr({"type":"hidden",
				     						 "name":"deleteFile",
				     						 "value":caAtNo
					 						}); 
				$('form[role="form"]').prepend(input);
				event.stopImmediatePropagation();
				return false;
			});
		 	
		 	$('div.fileInput').on('click','div.inputRow > button',function(event){
		 		$(this).parent('div.inputRow').remove();
		 	});
		 	
		 	$('.fileInput').on('change','input[type="file"]',function(event){
		 		if(this.files[0].size>1024*1024*40){
		 			alert("파일 용량이 40MB를 초과하였습니다.");
		 			this.value="";
		 			$(this).click();		 			
		 			return false;
		 		} 
	    	});
		 	
		 	var copCode = location.href.substr(-5,5);
		 	
		 	$('input[name="copCode"]').val(copCode);
		 	
		}
		function addFile_go(){
			//alert("click add btn");
			var attachedFile=$('a[name="attachedFile"]').length;
			var inputFile=$('input[name="uploadFile"]').length;	
			var attachCount=attachedFile+inputFile;
			
			if(attachCount >=5){
				alert("파일추가는 5개까지만 가능합니다.");
				return;
			}
			
			var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline"); 
			var div=$('<div>').addClass("inputRow");
			div.append(input).append("<button style='border:0;outline:0;' class='badge bg-red' type='button'>X</button");
			div.appendTo('.fileInput');
		}

    	
		function modify_submit(){
			//alert("click modify btn");
			
			var form=document.modifyForm;
			
			if($("input[name='title']").val()==""){
				alert(input.name+"은 필수입니다.");
				$("input[name='title']").focus();
				return;
			}
			
			var files = $('input[name="uploadFile"]');
			for(var file of files){
				console.log(file.name+" : "+file.value);
				if(file.value==""){
					alert("파일을 선택하세요.");
					file.focus();
					return false;
				}
			}	
			
			form.submit();
		}
    </script>
</body>