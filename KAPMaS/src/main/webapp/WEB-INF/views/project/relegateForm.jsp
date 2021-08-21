<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style>
.fileInput{
	padding:10px;
	width:100%;
 	height: 200px;
 	background: #eaeaea;
 	overflow: scroll;
}
</style>
</head>
<body style="padding: 40px; background: white;">


<form enctype="multipart/form-data" method="post" action="relegate.do" name="registForm">
	<fieldset>
		<input type="hidden" value="<%= session.getAttribute("pCode") %>" name="pCode">
		<input type="hidden" id="empId" name="empId" class="form-control" value="${loginUser.empId }">
		<legend class="mb-3" style="text-align:center;">프로젝트KMS 이관</legend><hr>
		<div class="mb-3">
		<label class="form-label" for="proName">프로젝트명</label>
		<input class="form-control" type="text" id="proName" name="pName" readonly value="${pro.pName}">
		</div>
		<div class="mb-3">
		<label class="form-label" for="proPeriod">제작 기간</label>
		<input class="form-control" type="text" id="proPeriod" name="proPeriod" readonly value="${pro.pStartdate.split(' ')[0]} ~ ${pro.pEnddate.split(' ')[0]}" >
		</div>
		<div class="mb-3">
		<label class="form-label" for="producer">대표자</label>
		<input class="form-control" type="text" id="producer" name="producer" readonly value="${loginUser.empName }" >
		</div>
		<div class="mb-3">
		<label class="form-label" for="content">프로젝트 개요</label>
		<input class="form-control" type="text" id="content" name="content" readonly value="${pro.pSummary}">
		</div>
		<div class="mb-3">
		<h5 style="display:inline;line-height:40px;">최종보고서 : </h5>
		&nbsp;&nbsp;<input type="file" name="finalFile" style="display: inline;">
		<div class="filebox"></div>
		</div>
		<label class="form-label" for="paTitle">이관할 첨부파일</label>
		<div class="fileInput" >								
			<c:forEach items="${attachList }" var="attach">
				<div><input type="checkbox" value="${attach.paAtNo}" name="relegateF"> ${attach.paAtName.split("\\$\\$")[1] }</div>
			</c:forEach>
		</div>
		<div style="width:210px;  margin:0 auto; margin-top: 30px;">
			<button type="button" class="btn btn-primary w-100px me-5px" id="registBtn" onclick="regist_go();">이관</button>
			<button type="button" class="btn btn-default w-100px" id="cancelBtn" onclick="CloseWindow();">취소</button>
		</div>
		<div class="relegateBox">
		
		</div>
	</fieldset>
</form>
	<script>   
		window.setTimeout(function(){	
		 	$('.fileInput').on('change','input[type="file"]',function(event){
		 		if(this.files[0].size>1024*1024*40){
		 			swal({
					    title: '알림',
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
		 }, 200);
    </script>
	 <script>
    	
    	function regist_go(){
    		var files = $('input[name="finalFile"]');
    		for(var file of files){
    			console.log(file.name+" : "+file.value);
    			if(file.value==""){
    				swal({
    				    title: '알림',
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
    		
    		
    		// 체크한 파일만
    		var obj_length = document.getElementsByName("relegateF").length;
  
	        for (var i=0; i<obj_length; i++) {
	            if (document.getElementsByName("relegateF")[i].checked == true) {
	            	var relegateF = document.getElementsByName("relegateF")[i].value;
	                var input=$('<input>').attr({"type":"hidden","name":"relegateFile","value":relegateF}).css("display","inline"); 
	        		var div=$('<div>').addClass("inputRow");
	        		div.append(input);
	        		$('.relegateBox').append(div);
	            }
	        }
    	
    		document.registForm.submit();	
    	}
   
    </script>

</body>





















