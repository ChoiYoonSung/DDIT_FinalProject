<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body style="padding: 40px; background: white;">


<form enctype="multipart/form-data" method="post" role="form" action="paModify.do" name="modifyForm">
	<fieldset>
		<input type="hidden" value="<%= session.getAttribute("pCode") %>" name="pCode">
		<input type="hidden" value="${pa.paCode }" name="paCode">
		<input type="hidden" id="writer" readonly	name="empId" class="form-control" value="${loginUser.empId }">
		<legend class="mb-3" style="text-align:center;">자료실 글 수정</legend><hr>
		<div class="mb-3">
		<label class="form-label" for="paTitle">제목</label>
		<input class="form-control" type="text" id="paTitle" name="paTitle" placeholder="제목을 입력하세요" maxlength="20" value="${pa.paTitle }">
		</div>
		<div class="mb-3">
		<label class="form-label" for="paContent">내용</label>
		<textarea class="form-control" rows="15" name="paContent">${pa.paContent }</textarea>
		</div>
		<div class="form-group">								
			<div class="card card-outline card-success">
				<div class="card-header">
					<h5 style="display:inline;line-height:40px;">첨부파일 : </h5>
					&nbsp;&nbsp;<button class="btn btn-xs btn-primary"
					onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
				</div>									
				<div class="card-footer fileInput">
				<ul class="mailbox-attachments align-items-stretch clearfix">
					<c:forEach items="${pa.attachList }" var="attach" >
					<li class="attach-item">																			
						<div class="mailbox-attachment-info">
							<a class="mailbox-attachment-name" name="attachedFile"  style="text-decoration: none;color:black;"
								attach-fileName="${attach.paAtName }" attach-no="${attach.paAtNo }" 
								href="<%=request.getContextPath()%>/project/getPAFile.do?paatno=${attach.paAtNo }"  >													
								<i class="fas fa-paperclip"></i>
								${attach.paAtName }&nbsp;&nbsp;
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
			<button type="button" class="btn btn-primary w-100px me-5px" id="modifyBtn" onclick="modify_submit();">수정</button>
			<button type="button" class="btn btn-default w-100px" id="cancelBtn" onclick="CloseWindow();">취소</button>
		</div>
	</fieldset>
</form>
<script>
window.onload=function(){
	
	//첨부파일===================================
	$('a[name="attachedFile"] > button').click(function(event){
		
		var parent = $(this).parent('a[name="attachedFile"]');
		alert(parent.attr("attach-fileName")+"파일을 삭제합니다.");
		
		var paAtNo = parent.attr("attach-no");
		
		$(this).parents('li.attach-item').remove();
		
		var input=$('<input>').attr({"type":"hidden",
		     						 "name":"deleteFile",
		     						 "value":paAtNo
			 						}); 
		$('form[role="form"]').prepend(input);
		event.stopImmediatePropagation();
		return false;
	});
	
	
	
	$('div.fileInput').on('click','div.inputRow > button',function(event){  		
		//alert("X btn click;");
		$(this).parent('div.inputRow').remove();	
	});
	
	$('.fileInput').on('change','input[type="file"]',function(event){
		if(this.files[0].size>1024*1024*40){
			alert("파일 용량이 40MB를 초과하였습니다.");
			this.value="";
			$(this).focus();
			return false;
		} 
	});		
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
	
	var input=$('<input>').attr({"type":"file","name":"uploadFile"})
	  					  .css("display","inline"); 
	var div=$('<div>').addClass("inputRow");
	div.append(input).append("<button style='border:0;outline:0;' class='badge bg-red' type='button'>X</button");
	div.appendTo('.fileInput');
}

//submit =============================================
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





















