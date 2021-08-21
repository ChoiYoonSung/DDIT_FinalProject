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
			<br> <a onclick="javascript:location.href='<%=request.getContextPath()%>/cop/detail/coppds/${copCode}'" style="cursor: pointer;"> <i
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
								<form enctype="multipart/form-data" method="post" action="/KAPMaS/cop/detail/pdsRegist.do" name="registForm">
									<input type="hidden" name="copCode" value="">
									<input type="text" class="form-control" id="pdsTitle" name="caTitle" placeholder="제목을 입력해주세요." />
									<hr>
									<textarea class="summernote" name="caContent"></textarea>
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
											<div class="card-footer fileInput"></div>
										</div>
									</div>
									<div style="width:210px;  margin:0 auto; margin-top: 30px;">
										<button type="button" class="btn btn-primary w-100px me-5px" id="registBtn" onclick="regist_go();">등록</button>
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
			    disableResizeEditor: true,
			    disableDragAndDrop:true,
    	 		toolbar: [
		    	    ['style', ['bold', 'italic', 'underline', 'clear']],
		    	    ['font', ['strikethrough', 'superscript', 'subscript']],
		    	    ['fontsize', ['fontsize']],
		    	    ['color', ['color']],
		    	    ['para', ['ul', 'ol', 'paragraph']],
		    	    ['height', ['height']]
		    	  ]
		    });
			
			
		 	$('.fileInput').on('change','input[type="file"]',function(event){
		 		if(this.files[0].size>1024*1024*40){
		 			swal({
						title : '경고',
						text : '파일 용량이 40MB를 초과하였습니다.',
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
		 			this.value="";
		 			$(this).click();		 			
		 			return false;
		 		} 
	    	});
		 	
		 	$('div.fileInput').on('click','div.inputRow > button',function(event){
		 		$(this).parent('div.inputRow').remove();
		 	});
		 	
		 	var copCode = "${copCode}";
		 	
		 	$('input[name="copCode"]').val(copCode);
		}
    	function addFile_go(){
    		//alert("click addFile btn");
    		if($('input[name="uploadFile"]').length >=5){
    			swal({
					title : '경고',
					text : '파일추가는 5개까지만 가능합니다.',
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
    		
    		var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline"); 
    		var div=$('<div>').addClass("inputRow");
    		div.append(input).append("<button style='border:0;outline:0;' class='badge bg-red' type='button'>삭제</button");
    		$('.fileInput').append(div);
    	}
    	
    	function regist_go(){
    		var files = $('input[name="uploadFile"]');
    		for(var file of files){
    			if(file.value==""){
        			swal({
    					title : '경고',
    					text : '파일을 선택하세요.',
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
    				file.focus();
    				file.click();
    				return;
    			}
    		}	

    		if($("input[name='caTitle']").val()==""){ //form.title.value
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
    			$("input[name='pdsTitle']").focus();
    			return;
    		}
    		if($("textarea[name='caContent']").val()==""){ //form.title.value
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
    			$("input[name='pdsTitle']").focus();
    			return;
    		}
    	
    		swal({
				title : '자료실 글 작성',
				text : '글 작성을 완료하시겠습니까?',
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
    </script>
</body>