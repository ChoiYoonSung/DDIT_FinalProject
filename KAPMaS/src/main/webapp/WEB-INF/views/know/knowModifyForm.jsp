<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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

<form enctype="multipart/form-data" method="post" role="form" action="knowModify.do" name="modifyForm">
	<fieldset>
		<input type="hidden" value="${know.khCode }" name="tkCode">
		<input type="hidden" id="empId" readonly	name="empId" class="form-control" value="${loginUser.empId }">
		<input type="hidden" id="tkKeyword" name="tkKeyword">
		
		<legend class="mb-3" style="text-align:center;">노하우 요청글 수정</legend><hr>
		<div class="row">
			<div class="col-md-3" style="padding-left:5px;">
				<div class="col-md-6">
				<label class="form-label" for="emp">카테고리</label>
				<br>
				<select style="width: 150px; float: left;" name="emp" id="emp"
					class="form-select">
					<option value="${know.khCategory }">${know.khCategory }</option>
						<option value="연구">연구</option>
						<option value="기술">기술</option>
						<option value="법률">법률</option>
						<option value="기타">기타</option>

				</select>
				</div>
			</div>
			<div class="col-md-9" style="padding-right:5px;">
				<div class="mb-3">
					<label class="form-label" for="tkTitle">제목</label>
					<input class="form-control" type="text" id="tkTitle" name="tkTitle" maxlength="20" value="${know.khTitle}">
				</div>
			</div>
		
		</div>
		<br>
		<div class="mb-3">
		<label class="form-label" for="tkContent">내용</label>
		<textarea class="summernote" rows="15" name="tkContent">${know.khContent}</textarea>
		</div>
		<div class="form-group">	
			<div class="row">
				<div class="col-md-12 ui-sortable">
						<div >
							<div class="input-group">
								<input type="text" class="form-control form-control-lg" id="addKW" onkeyup="enterkey()"
									placeholder="검색할 키워드를 입력하고 추가버튼을 클릭하세요">
								<button type="button" class="btn btn-lg" onclick="addKeyword()">
									<i class="fas fa-lg fa-fw  fa-plus-circle"></i>
								</button>
							</div>
						</div>
						<ul class="popular-tags" id="KWList" style="list-style:none; margin-top:5px;">
						</ul>
					</div>
			</div>							
		</div>
		<div style="width:210px;  margin:0 auto; margin-top: 30px;">
			<button type="button" class="btn btn-primary w-100px me-5px" id="modifyBtn" onclick="modify_submit();">수정</button>
			<button type="button" class="btn btn-default w-100px" id="cancelBtn" onclick="CloseWindow();">취소</button>
		</div>
	</fieldset>
</form>
<input type=hidden value="${know.khKeyword}" id="keywordAlert">

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

<script> 
function enterkey() {
	if (window.event.keyCode == 13) {
		addKeyword();
		} 
	}
window.addEventListener("load",function() {
	var KWVal = $('#keywordAlert').val(); 
	if(KWVal == "" || KWVal == null){
		return;
	}
	var ele = document.getElementById('KWList');
	var eleCount = ele.childElementCount;
	if(eleCount>0){
		return;
	}
	var KWValArr = KWVal.split(",");
	if(KWValArr.length > 0){
		for(var i = 0; i < KWValArr.length; i++){
			var KWList = $('<li class="cate A"style="float:left;"><div class="d-flex align-items-center"><span class="key" style="color:black;"><h5>' + KWValArr[i] +'</h5></span><i class="fas fa-lg fa-fw me-10px fa-times-circle" onclick="delKW(this)"></i></div></li>');
			$('#KWList').append(KWList);
		}
		
	}
}, false);

window.onload=function(){
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
}
function addKeyword(){
	var KW = $.trim($('#addKW').val());
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
	
	var KWList = $('<li style="float:left;"><div class="d-flex align-items-center"><span class="key" style="color:black;"><h5>' + KW +'</h5></span><i class="fas fa-lg fa-fw me-10px fa-times-circle" onclick="delKW(this)"></i></div></li>');
	$('#KWList').append(KWList);
	$('#addKW').val("");
}

function delKW(e){
	var KW = $(e);
	KW.closest("li").remove();
} 	


function modify_submit(){
	//alert("click modify btn");
	
	var form=document.modifyForm;
	
	if($("input[name='title']").val()==""){
		swal({
			title : '키워드 추가',
			text : input.name+"은 필수입니다.",
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
		$("input[name='title']").focus();
		return;
	}
	
	var len = $(".key").length;
	var arr = [];
	for(var i = 0; i < len; i++){
		arr.push($(".key")[i].innerText);
	}
	
	var KWString = arr.toString();
	$('#tkKeyword').val(KWString);
	
	form.submit();
}


</script>



































