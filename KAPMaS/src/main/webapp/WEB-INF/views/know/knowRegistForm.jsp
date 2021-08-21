<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/css/vendor.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/css/default/app.min.css" rel="stylesheet" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/0.6.5/js/min/perfect-scrollbar.jquery.min.js"></script>


<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/tag-it/css/jquery.tagit.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/summernote/dist/summernote-lite.css" rel="stylesheet" />

<body style="padding: 40px; background: white;">
	<form enctype="multipart/form-data" method="post" action="knowRegist.do" name="registForm">
		<fieldset>
			<input type="hidden" id="empId" readonly name="empId" class="form-control" value="${loginUser.empId }">

			<legend class="mb-3" style="text-align: center;" onclick="fillForm();">노하우 등록</legend>
			<hr>
			<div class="row">
			<div class="col-8 mb-3">
				<label class="form-label" for="tkTitle">제목</label><input class="form-control" type="text" id="tkTitle" name="tkTitle" placeholder="제목을 입력하세요" maxlength="20">
			</div>
			<div class="col-4 mb-3">
				<label class="form-label">카테고리</label>
						<select style="width: 150px;" name="emp" id="emp"
							class="form-select">
							<option value="">-카테고리 선택-</option>
								<option value="연구">연구</option>
								<option value="기술">기술</option>
								<option value="법률">법률</option>
								<option value="기타">기타</option>

						</select>
				</div>
			</div>
			<div class="mb-3">
				<label class="form-label" for="tkContent">내용</label>
				
				<textarea class="summernote" style="display: none;" name="tkContent"></textarea>
			
			</div>
			
			<div class="app-content">
				<div class="row">
					<div class="col-md-12 ui-sortable">
						<div >
							<div class="input-group">
								<input type="text" class="form-control form-control-lg" id="addKW"
									placeholder="검색할 키워드를 입력하고 추가버튼을 클릭하세요">
								<button type="button" class="btn btn-lg" onclick="addKeyword()">
									<i class="fas fa-lg fa-fw  fa-plus-circle"></i>
								</button>
							</div>
						</div>
						<ul class="popular-tags" id="KWList">
			
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

	<!-- script -->
</body>

<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/vendor.min.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
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
<script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js" data-cf-settings="bb927df14e4b0356ad5b69fe-|49" defer=""></script><script defer src="https://static.cloudflareinsights.com/beacon.min.js" data-cf-beacon='{"rayId":"66f2ccb658aadd8f","version":"2021.6.0","r":1,"token":"4db8c6ef997743fda032d4f73cfeff63","si":10}'></script>

<ul id="ui-id-1" tabindex="0" class="ui-menu ui-widget ui-widget-content ui-autocomplete ui-front tagit-autocomplete" style="display: none;"></ul>
<div role="status" aria-live="assertive" aria-relevant="additions" class="ui-helper-hidden-accessible"></div>
<div class="note-modal-backdrop" style="display: none;"></div>


<script type="text/javascript">

window.setTimeout(function(){
	
	$(".note-insert").hide();
	
},100);

window.onload = function() {
    $(".summernote").summernote({
        placeholder: '내용을 입력해주세요.',
        height: "200",
        minHeight: "200",              
        maxHeight: "200",
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
 }


function fillForm(){
	$('input[name="tkTitle"]').val("스프링 Security 에 대하여");
}

function addKeyword(){
	var KW = $('#addKW').val();
	var len = $(".key").length;
	var keyArr = $(".key").val();
	
	if(KW == null || KW == ""){
		swal({
			title : '키워드 추가',
			text : '키워드가 입력되지 않았습니다.',
			icon : 'error',
			buttons : {
				confirm : {
					text : '확인',
					value : true,
					visible : true,
					className : 'btn btn-danger me-1',
					closeModal : true
				}
			}
		});
		return;
	}
	if(KW.length > 10){
		swal({
			title : '키워드 추가',
			text : '키워드는 최대 10글자까지 가능합니다.',
			icon : 'error',
			buttons : {
				confirm : {
					text : '확인',
					value : true,
					visible : true,
					className : 'btn btn-success me-1',
					closeModal : true
				}
			}
		});
		return;
	}		
	if(len > 4){
		swal({
			title : '키워드 추가',
			text : '키워드는 최대 5개까지 추가할 수 있습니다.',
			icon : 'error',
			buttons : {
				confirm : {
					text : '확인',
					value : true,
					visible : true,
					className : 'btn btn-success me-1',
					closeModal : true
				}
			}
		});
		$('#addKW').val("");
		return;
	}
	if(len > 0){
		for(var i = 0; i < len; i++){
			if(KW == $(".key")[i].innerText){
				swal({
					title : '키워드 추가',
					text : '이미 추가된 키워드 입니다.',
					icon : 'error',
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-success me-1',
							closeModal : true
						}
					}
				});
				return;
			}
		}
	}
	var KWList = $('<li><div class="d-flex align-items-center"><span class="key" style="color:black;"><h5>' + KW +'</h5></span><i class="fas fa-lg fa-fw me-10px fa-times-circle" onclick="delKW(this)"></i></div></li>');
	$('#KWList').append(KWList);
	$('#addKW').val("");
}


function delKW(e){
	var KW = $(e);
	KW.closest("li").remove();
} 	


function regist_go(){
		
	if($("#emp").val()==""){ //form.title.value
		alert("카테고리는 필수입니다.");
		$("#emp").focus();
		return;
	}
	
		if($("input[name='tkTitle']").val()==""){ //form.title.value
			alert("제목은 필수입니다.");
			$("input[name='tkTitle']").focus();
			return;
		}
		
	var len = $(".key").length;
	var arr = [];
	for(var i = 0; i < len; i++){
		arr.push($(".key")[i].innerText);
	}
	
	var KWString = arr.toString();
	$('#tkKeyword').val(KWString);
	
	
		document.registForm.submit();	
	}



</script>









