<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>  

  
<!DOCTYPE html>

<html>
<head>

<link href="<%=request.getContextPath()%>/resources/bootstrap/color_admin/template/assets/plugins/nvd3/build/nv.d3.css"	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/css/forum/vendor.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/css/forum/app.min.css" rel="stylesheet">
<script	src="<%=request.getContextPath()%>/resources/bootstrap/color_admin/template/assets/js/forum/vendor.min.js" type="text/javascript"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/color_admin/template/assets/js/forum/app.min.js"	type="text/javascript"></script>

<script>   
  	window.onload=function(){
  		
//   		Summernote_start($('#tkContent')); 
	
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
  </script>
<script>
 	function addFile_go(){
 		//alert("click addFile btn");
 		if($('input[name="uploadFile"]').length >=5){
 			alert("파일추가는 5개까지만 가능합니다.");
 			return;
 		}
 		
 		var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline"); 
 		var div=$('<div>').addClass("inputRow");
 		div.append(input).append("<button style='border:0;outline:0;' class='badge bg-red' type='button'>삭제</button");    		   		
 		$('.fileInput').append(div);
 	}
 	
	function addKeyword(){
		var KW = $('#addKW').val();
		var len = $(".key").length;
		var keyArr = $(".key").val();
		
		if(KW == null || KW == ""){
			alert("키워드를 입력해주세요");
			return;
		}
		if(len > 4){
			alert("키워드는 최대 5개까지 입력 가능합니다.");
			$('#addKW').val("");
			return;
		}
		if(len > 0){
			for(var i = 0; i < len; i++){
				if(KW == $(".key")[i].innerText){
					alert("이미 등록한 키워드입니다.");
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
 		var files = $('input[name="uploadFile"]');
 		for(var file of files){
 			console.log(file.name+" : "+file.value);
 			if(file.value==""){
 				alert("파일을 선택하세요.");
 				file.focus();
 				file.click();
 				return;
 			}
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

<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>