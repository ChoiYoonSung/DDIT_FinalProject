<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>  

  
<!DOCTYPE html>

<html>
<head>
<style>
#KWList > li > div > i:hover {color: red;}
</style>

<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/sweetalert/dist/sweetalert.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/nvd3/build/nv.d3.css"	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/css/forum/vendor.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/css/forum/app.min.css" rel="stylesheet">
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/js/forum/vendor.min.js" type="text/javascript"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/js/forum/app.min.js"	type="text/javascript"></script>


<script>
 	function addFile_go(){
 		//alert("click addFile btn");
 		if($('input[name="uploadFile"]').length >=5){
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
 		
 		var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline"); 
 		var div=$('<div>').addClass("inputRow");
 		div.append(input).append("<button style='border:0;outline:0;' class='badge bg-red' type='button'>삭제</button");    		   		
 		$('.fileInput').append(div);
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
		var KWList = $('<li><div class="d-flex align-items-center"><span class="key" style="color:black;"><b>' + KW +'</b></span><i name="delIcon"class="fas fa-lg fa-fw me-10px fa-times-circle" onclick="delKW(this)"></i></div></li>');
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
				swal({
					title : '알림',
					text : '파일을 선택하세요.',
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
 				file.click();
 				return;
 			}
 		}	
 		
 		if($("input[name='tkTitle']").val()==""){ //form.title.value
			swal({
				title : '알림',
				text : '제목을 입력해주세요',
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