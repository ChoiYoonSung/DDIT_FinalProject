<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body style="padding: 40px; background: white;">


<form enctype="multipart/form-data" method="post" action="paRegist.do" name="registForm">
	<fieldset>
		<input type="hidden" value="<%= session.getAttribute("pCode") %>" name="pCode">
		<input type="hidden" id="writer" readonly	name="empId" class="form-control" value="${loginUser.empId }">
		<legend class="mb-3" style="text-align:center;">자료실 글 등록</legend><hr>
		<div class="mb-3">
		<label class="form-label" for="paTitle">제목</label>
		<input class="form-control" type="text" id="paTitle" name="paTitle" placeholder="제목을 입력하세요">
		</div>
		<div class="mb-3">
		<label class="form-label" for="paContent">내용</label>
		<textarea class="form-control" rows="15" name="paContent"></textarea>
		</div>
		<div class="form-group">								
			<div class="card card-outline card-success">
				<div class="card-header">
					<h5 style="display:inline;line-height:40px;">첨부파일 : </h5>
					&nbsp;&nbsp;<button class="btn btn-xs btn-primary"
					onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
				</div>									
				<div class="card-footer fileInput">
				</div>
			</div>
		</div>
		<div style="width:210px;  margin:0 auto; margin-top: 30px;">
			<button type="button" class="btn btn-primary w-100px me-5px" id="registBtn" onclick="regist_go();">등록</button>
			<button type="button" class="btn btn-gray w-100px" id="cancelBtn" onclick="CloseWindow();">취소</button>
		</div>
	</fieldset>
</form>
	<script>   
    	window.onload=function(){
		 	$('.fileInput').on('change','input[type="file"]',function(event){
		 		if(this.files[0].size>1024*1024*40){
		 			swal({
		   			    title: '자료실',
		   			    text: '파일 용량이 40MB를 초과하였습니다.',
		   			    icon: 'warning', // primary success warning danger
		   			    buttons: {
		   			          confirm: {
		   			            text: '확인',
		   			            value: true,
		   			            visible: true,
		   			            className: 'btn btn-primary',
		   			            closeModal: true
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
	 <script>
    	function addFile_go(){
    		//alert("click addFile btn");
    		if($('input[name="uploadFile"]').length >=5){
    			swal({
   			    title: '자료실',
   			    text: '파일추가는 5개까지만 가능합니다.',
   			    icon: 'warning', // primary success warning danger
   			    buttons: {
   			          confirm: {
   			            text: '확인',
   			            value: true,
   			            visible: true,
   			            className: 'btn btn-primary',
   			            closeModal: true
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
    		if($('input[name="uploadFile"]').length == 0){
    			swal({
       			    title: '자료실',
       			    text: '파일첨부는 필수입니다.',
       			    icon: 'warning', // primary success warning danger
       			    buttons: {
       			          confirm: {
       			            text: '확인',
       			            value: true,
       			            visible: true,
       			            className: 'btn btn-primary',
       			            closeModal: true
       			          }
       			    }
       			  });
    			return;
    		}
    		
    		var files = $('input[name="uploadFile"]');
    		for(var file of files){
    			console.log(file.name+" : "+file.value);
    			if(file.value==""){
    				swal({
    	   			    title: '자료실',
    	   			    text: '파일을 선택하세요.',
    	   			    icon: 'warning', // primary success warning danger
    	   			    buttons: {
    	   			          confirm: {
    	   			            text: '확인',
    	   			            value: true,
    	   			            visible: true,
    	   			            className: 'btn btn-primary',
    	   			            closeModal: true
    	   			          }
    	   			    }
    	   			  });
    				file.focus();
    				file.click();
    				return;
    			}
    		}	
    		
    		if($("input[name='paTitle']").val()==""){ //form.title.value
    			swal({
       			    title: '자료실',
       			    text: '제목은 필수입니다.',
       			    icon: 'warning', // primary success warning danger
       			    buttons: {
       			          confirm: {
       			            text: '확인',
       			            value: true,
       			            visible: true,
       			            className: 'btn btn-primary',
       			            closeModal: true
       			          }
       			    }
       			  });
    			$("input[name='paTitle']").focus();
    			return;
    		}
    	
    		document.registForm.submit();	
    	}
   
    </script>

</body>





















