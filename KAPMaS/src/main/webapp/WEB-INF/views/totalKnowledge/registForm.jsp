<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/totalKnowledge/js/tkRegist.jsp" %>


<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/css/vendor.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/css/default/app.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/tag-it/css/jquery.tagit.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/summernote/dist/summernote-lite.css" rel="stylesheet" />
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/0.6.5/js/min/perfect-scrollbar.jquery.min.js"></script>

<script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js" data-cf-settings="bb927df14e4b0356ad5b69fe-|49" defer=""></script><script defer src="https://static.cloudflareinsights.com/beacon.min.js" data-cf-beacon='{"rayId":"66f2ccb658aadd8f","version":"2021.6.0","r":1,"token":"4db8c6ef997743fda032d4f73cfeff63","si":10}'></script>

<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/vendor.min.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/app.min.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/theme/default.min.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>


<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/jquery-migrate/dist/jquery-migrate.min.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/tag-it/js/tag-it.min.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/summernote/dist/summernote-lite.min.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/demo/email-compose.demo.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>

<script type="bb927df14e4b0356ad5b69fe-text/javascript">
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-53034621-1', 'auto');
		ga('send', 'pageview');

</script>

<body style="padding: 40px; background: white;">
	<form enctype="multipart/form-data" method="post" action="regist.do"
		name="registForm">
		<fieldset>
			<input type="hidden" value="<%=session.getAttribute("tkCode")%>"
				name="tkCode"> <input type="hidden" id="empId" readonly
				name="empId" class="form-control" value="${loginUser.empId }">

			<legend class="mb-3" style="text-align: center;">기타 자료 게시판 글등록</legend>
			<hr>
			<div class="mb-3">
				<label class="form-label" for="tkTitle">제목</label> <input
					class="form-control" type="text" id="tkTitle" name="tkTitle"
					placeholder="제목을 입력하세요" maxlength="200">
			</div>

			<div class="mb-3">
				<label class="form-label" for="tkContent">내용</label>
				
				<textarea class="summernote" style="display: none;" name="tkContent" maxlength="2000"></textarea>
			
			</div>
			<div class="app-content" style="margin-left: 0px;">
				<div class="row">
					<div class="col-md-6">
						<div class="card card-outline card-success">
							<div class="card-header">
								<h5 style="display: inline; line-height: 40px;">첨부파일 :</h5>
								&nbsp;&nbsp;
								<button class="btn btn-xs btn-primary" onclick="addFile_go();"
									type="button" id="addFileBtn">Add File</button>
							</div>
							<div class="card-footer fileInput"></div>
						</div>
					</div>
					<div class="col-md-6">
						<div >
							<div class="input-group">
								<input type="text" class="form-control form-control-lg" id="addKW"
									placeholder="검색할 키워드를 입력하고 추가버튼을 클릭하세요">
								<button type="button" class="btn btn-lg" onclick="addKeyword()">
									<i class="fas fa-lg fa-fw  fa-plus-circle"></i>
								</button>
							</div>
						</div>
						<ul class="popular-tags" id="KWList" style="margin-top:10px;">
			
						</ul>
					</div>
				</div>
			</div>
			<input type="hidden" id="tkKeyword" name="tkKeyword">
			<div style="width: 210px; margin: 0 auto; margin-top: 30px;">
				<button type="button" class="btn btn-primary w-100px me-5px"
					id="registBtn" onclick="regist_go();">등록</button>
				<button type="button" class="btn btn-default w-100px" id="cancelBtn"
					onclick="CloseWindow();">취소</button>
			</div>
		</fieldset>
	</form>
<!-- ㅁㅁ -->
	<!-- script -->
</body>

<script>
// window.onload=function(){
// 	Summernote_start($('#content')); 
// }
window.onload = function() {
		$(".summernote").summernote({
		    placeholder: '내용을 입력해주세요.',
		    height: "300",
		    minHeight: "300",              
		    maxHeight: "300",
		    disableDragAndDrop:true,
		    disableResizeEditor: true,
		       toolbar: [
		           ['style', ['bold', 'italic', 'underline', 'clear']],
		           ['font', ['strikethrough', 'superscript', 'subscript']],
		           ['fontsize', ['fontsize']],
		           ['color', ['color']],
		           ['para', ['ul', 'ol', 'paragraph']],
		           ['height', ['height']]
		         ]
		   });
		
		$('.summernote').summernote('enable');
  		
	
		$('.fileInput').on('change','input[type="file"]',function(event){
			if(this.files[0].size>1024*1024*200){
				swal({
					title : '알림',
					text : '200MB를 초과하는 파일은 첨부할 수 없습니다.',
					icon : 'warning',
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning me-1',
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
}
  </script>

<ul id="ui-id-1" tabindex="0" class="ui-menu ui-widget ui-widget-content ui-autocomplete ui-front tagit-autocomplete" style="display: none;"></ul>
<div role="status" aria-live="assertive" aria-relevant="additions" class="ui-helper-hidden-accessible"></div>
<div class="note-modal-backdrop" style="display: none;"></div>


<script type="text/javascript">

window.setTimeout(function(){
	
	$(".note-insert").hide();
	
},100);


</script>




