<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/totalKnowledge/js/tkModify.jsp" %>
<style>
#KWList > li > div > i:hover {color: red;}
</style>
<body style="padding: 40px; background: white;">

<form enctype="multipart/form-data" method="post" role="form" action="modify.do" name="modifyForm">
	<fieldset>
		<input type="hidden" value="${tk.tkCode }" name="tkCode">
		<input type="hidden" id="empId" readonly	name="empId" class="form-control" value="${loginUser.empId }">
		<input type="hidden" id="tkKeyword" name="tkKeyword">
		<legend class="mb-3" style="text-align:center;">기타 자료실 글 수정</legend><hr>
		<div class="mb-3">
		<label class="form-label" for="tkTitle">제목</label>
		<input class="form-control" type="text" id="tkTitle" name="tkTitle" maxlength="20" value="${tk.tkTitle}">
		</div>
		<div class="mb-3">
		<label class="form-label" for="tkContent">내용</label>
		<textarea class="form-control summernote" rows="15" name="tkContent">${tk.tkContent}</textarea>
		</div>
		<div class="form-group">	
			<div class="row">
			
				<div class="col-md-6 ui-sortable ">
				<div class="card card-outline card-success">
					<div class="card-header">
						<h5 style="display:inline;line-height:40px;">첨부파일 : </h5>
						&nbsp;&nbsp;<button class="btn btn-xs btn-primary"
						onclick="addFile_go();"	type="button" id="addFileBtn">첨부파일 추가</button>
					</div>									
					<div class="card-footer fileInput">
					<ul class="mailbox-attachments align-items-stretch clearfix">
						<c:forEach items="${tk.attachList }" var="attach" >
						<li class="attach-item">																			
							<div class="mailbox-attachment-info">
								<a class="mailbox-attachment-name" name="attachedFile"  style="text-decoration: none;color:black;"
									attach-fileName="${attach.tkAtName }" attach-no="${attach.tkAtNo }" 
									href="<%=request.getContextPath()%>/kms/getTkFile.do?tkAtNo=${attach.tkAtNo }"  >													
									<i class="fas fa-paperclip"></i>
									${attach.tkAtName }&nbsp;&nbsp;
									<button type="button" style="border:0;outline:0;" class="badge bg-red">삭제</button>																									
								</a>													
							</div>
						</li>
						</c:forEach>
					</ul>
					</div>
				</div>
				</div>
				<div class="col-md-6 ui-sortable">
						<div >
							<div class="input-group">
								<input type="text" class="form-control form-control-lg" id="addKW" onkeyup="enterkey()"
									placeholder="검색할 키워드를 입력하고 추가버튼을 클릭하세요">
								<button type="button" class="btn btn-lg" onclick="addKeyword()">
									<i class="fas fa-lg fa-fw  fa-plus-circle"></i>
								</button>
							</div>
						</div>
						<ul class="popular-tags" id="KWList" style="list-style:none;margin-top:10px;">
			
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
<input type=hidden value="${tk.tkKeyword}" id="keywordAlert">

</body>
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
			var KWList = $('<li style="float:left;"><div class="d-flex align-items-center"><span class="key" style="color:black;"><h5>' + KWValArr[i] +'</h5></span><i class="fas fa-lg fa-fw me-10px fa-times-circle" onclick="delKW(this)"></i></div></li>');
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
	
	$('a[name="attachedFile"] > button').click(function(event){
		
		var parent = $(this).parent('a[name="attachedFile"]');
		swal({
			title : '알림',
			text : parent.attr("attach-fileName")+"파일을 삭제합니다.",
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
		
		var tkAtNo = parent.attr("attach-no");
		
		$(this).parents('li.attach-item').remove();
		
		var input=$('<input>').attr({"type":"hidden",
		     						 "name":"deleteFile",
		     						 "value":tkAtNo
			 						}); 
		$('form[role="form"]').prepend(input);
		event.stopImmediatePropagation();
		return false;
	});
	
	
	
	$('div.fileInput').on('click','div.inputRow > button',function(event){  		
		$(this).parent('div.inputRow').remove();	
	});
	
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
			$(this).focus();
			return false;
		} 
	});
}

function addKeyword(){
	var KW = $.trim($('#addKW').val());
	var len = $(".key").length;
	var keyArr = $(".key").val();
	
	if(KW == null || KW == ""){
		swal({
			title : '알림',
			text : '키워드를 입력해주세요',
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
		return;
	}
	if(KW.length > 10){
		swal({
			title : '알림',
			text : '키워드는 최대 10글자까지 입력 가능합니다.',
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
		return;
	}	
	if(len > 4){
		swal({
			title : '알림',
			text : '키워드는 최대 5개까지 입력 가능합니다.',
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
		$('#addKW').val("");
		return;
	}
	if(len > 0){
		for(var i = 0; i < len; i++){
			if(KW == $(".key")[i].innerText){
				swal({
					title : '알림',
					text : '이미 등록한 키워드입니다.',
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


function addFile_go(){
	var attachedFile=$('a[name="attachedFile"]').length;
	var inputFile=$('input[name="uploadFile"]').length;	
	var attachCount=attachedFile+inputFile;
	
	if(attachCount >=5){
		swal({
			title : '알림',
			text : '파일첨부는 5개까지 가능합니다.',
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
		return;
	}
	
	var input=$('<input>').attr({"type":"file","name":"uploadFile"})
	  					  .css("display","inline"); 
	var div=$('<div>').addClass("inputRow");
	div.append(input).append("<button style='border:0;outline:0;' class='badge bg-red' type='button'>X</button");
	div.appendTo('.fileInput');
}

function modify_submit(){
	//alert("click modify btn");
	
	var form=document.modifyForm;
	
	if($("input[name='title']").val()==""){
		swal({
			title : '알림',
			text : input.name+"은 필수입니다.",
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
		$("input[name='title']").focus();
		return;
	}
	
	var files = $('input[name="uploadFile"]');
	for(var file of files){
		if(file.value==""){
			swal({
				title : '알림',
				text : "파일을 선택하세요.",
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
			file.focus();
			return false;
		}
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



















