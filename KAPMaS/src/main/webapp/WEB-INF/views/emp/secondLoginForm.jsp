<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>KAPMaS | sign in</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	
	<!-- ================== BEGIN core-css ================== -->
	<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/css/vendor.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/css/default/app.min.css" rel="stylesheet" />
	<!-- ================== END core-css ================== -->
		<link href="<%=request.getContextPath() %>/resources/css/css.css" rel="stylesheet">
</head>
<body class='pace-top'>
	<div id="app" class="app">
		<!-- BEGIN register -->
		<div class="register register-with-news-feed">
			<!-- BEGIN news-feed -->
			<div class="news-feed">
				<div class="news-image" style="background-image: url(<%=request.getContextPath() %>/resources/images/wallpaper/login-wallpaper.jpg)"></div>
				<div class="news-caption">
					<h4 class="caption-title">
						<b>KAPMaS</b>
					</h4>
					<p>Knoledge And Project Management System</p>
					<p>프로젝트 지식 통합 관리 시스템
				</div>
			</div>
			<!-- END news-feed -->
			
			<!-- BEGIN register-container -->
			<div class="register-container">
				<div class="register-header mb-25px h1">
					<img src="<%=request.getContextPath() %>/resources/images/logo-remove.png" alt="" style="width: 300px">
					<div class="mb-1">첫 로그인 추가 정보 입력</div>
					<small class="d-block fs-15px lh-16">사원의 정보를 추가로 입력해주세요.</small>
				</div>
				<h1 onclick="fillArea();">${loginUser.empName }님의 정보 입력</h1>
				<div class="register-content">
					<div class="profile">
						<div class="profile-header">
							<!-- BEGIN profile-header-cover -->
							<div class="profile-header-content">
								<!-- BEGIN profile-header-img -->
								<div class="profile-header-info">
								<div class="profile-header-img" id="imgView"
									data-id="${loginUser.empId }"
									style="height: 144px; width: 144px; margin-bottom: 10px; border: 0.5px solid black;"></div>
									<div class="row" style="width: 100%">
									<label for="inputFile" class="btn btn-yellow btn-sm btn-flat input-group-addon col-4" onchange="changePicture_go();">사진변경</label>
									<input id="inputFileName" class="form-control col-8" type="text" name="tempImg" disabled value="${loginUser.empImg.split('\\$\\$')[1] }" style="opacity: 0.5; width: 60%" />
									</div>
								</div>
								<!-- END profile-header-info -->
							</div>
							<!-- END profile-header-content -->
						</div>
						
					</div>
					
				<form role="form" class="form-horizontal" action="<%=request.getContextPath() %>/emp/secondLogin.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="empId" value="${loginUser.empId }"/>
						<input type="hidden" name="empName" value="${loginUser.empName }"/>
						<input type="hidden" name="oldImg" value="${loginUser.empImg }"/>
						<input type="hidden" name="depCode" value="${loginUser.depCode }"/>
						<input type="hidden" name="rnkCode" value="${loginUser.rnkCode }"/>
						<input type="hidden" name="empEmail" value="${loginUser.empEmail }"/>
						
						<input type="file" id="inputFile" onchange="changePicture_go();" name="empImg" style="display:none" />
						<input type="hidden" name="uploadImg" id="img" class="form-control"/>
						
						<div class="mb-3">
							<label class="mb-2">비밀번호 입력<span class="text-danger">*</span></label>
							<input type="password" class="form-control fs-13px" name="empPwd" id="empPwd" value="" placeholder="" />
						</div>
						<div class="mb-3">
							<label class="mb-2">전화번호 <span class="text-danger">*</span></label>
							<input type="text" onkeyup="phoneTest();" class="form-control fs-13px" name="empPhone" id="empPhone"placeholder="ex)010-0000-0000(숫자만 입력하세요.)" value=""/>
						</div>
<!-- 						<div class="mb-3"> -->
<!-- 							<label class="mb-2">주소<span class="text-danger">*</span></label> -->
<!-- 							<input type="text" class="form-control fs-13px" name="empAdd" id="empAdd" placeholder="ex)대전광역시 중구 대흥동..." value=""/> -->
<!-- 						</div> -->
						<div class="mb-4">
							<button type="button" onclick="modify_go();" class="btn btn-inverse d-block w-100 btn-lg h-45px fs-13px">정보 입력 완료</button>
						</div>
						<hr class="bg-gray-600 opacity-2" />
						<p class="text-center text-gray-600">
							&copy; Color Admin All Right Reserved 2021
						</p>
					</form>
				</div>
			</div>
			<!-- END register-container -->
		</div>
		<!-- END register -->
		
		<!-- END scroll-top-btn -->
	</div>
	<!-- END #app -->

	
	<!-- ================== BEGIN core-js ================== -->
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/vendor.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/app.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/theme/transparent.min.js"></script>
	<!-- ================== END core-js ================== -->
</body>


<script type="text/javascript">
function fillArea(){
	$('input[name="empPwd"]').val("enen1590");
	$('input[name="empPhone"]').val("010-9404-6762");
}

function phoneTest(){
	var inputVal = $('#empPhone').val();
	if((!(event.keyCode > 47 && 58 > event.keyCode) && (event.keyCode != 220))){
		inputVal = inputVal.substr(0, inputVal.length -1);
		$('#empPhone').val(inputVal);
		return;
	}else if((!(event.keyCode > 47 && 58 > event.keyCode) && (event.keyCode != 220))){
		inputVal = inputVal.substr(0, inputVal.length -1);
		$('#empPhone').val(inputVal);
		return;
	}else if($('#empPhone').val().length > 13){
		inputVal = inputVal.substr(0, 13);
		$('#empPhone').val(inputVal);
		return;
	}else if(inputVal.length == 3 || inputVal.length == 8){
		inputVal = inputVal + "-";
		$('#empPhone').val(inputVal);
		return;
	}
}



function changePicture_go(){
	var picture = $('input#inputFile')[0];
	
	var fileFormat = picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
	
	//이미지 확장자 jpg 확인
	if(!(fileFormat=="JPG" || fileFormat=="JPEG" || fileFormat=="PNG")){
	/* 	alert("이미지는 jpg 형식만 가능합니다.");
		return; */
		
		swal({
			title: '실패',
			text: '이미지는 jpg 형식만 가능합니다.',
			icon: 'danger', // primary success warning danger
			buttons: {
		        	confirm: {
				text: '확인',
		                value: true,
		                visible: true,
		                className: 'btn btn-danger',
		                closeModal: true
		              }
		        }
		});
		return;
	} 
	//이미지 파일 용량 체크
	if(picture.files[0].size>1024*1024*3){
	/* 	alert("사진 용량은 3MB 이하만 가능합니다.");
		return; */
		
		swal({
			title: '실패',
			text: '사진 용량은 3MB 이하만 가능합니다.',
			icon: 'danger', // primary success warning danger
			buttons: {
		        	confirm: {
				text: '확인',
		                value: true,
		                visible: true,
		                className: 'btn btn-danger',
		                closeModal: true
		              }
		        }
		});
		return;
	};

	document.getElementById('inputFileName').value=picture.files[0].name;
	
	if (picture.files && picture.files[0]) {
		 var reader = new FileReader();
		 
		 reader.onload = function (e) {
	        	//이미지 미리보기	        	
	        	$('div#imgView')
	        	.css({'background-image':'url('+e.target.result+')',
					  'background-position':'center',
					  'background-size':'cover',
					  'background-repeat':'no-repeat'
	        		});
	        }
	        
	        reader.readAsDataURL(picture.files[0]);
	}
	
	// 이미지 변경 확인
	$('input[name="uploadImg"]').val(picture.files[0].name);
}

//회원 수정 submit
function modify_go(){
	if($('input[name="empImg"]').val() == null){
		swal({
		    title: '회원정보',
		    text: '사진은 필수항목입니다.',
		    icon: 'warning',
		    buttons: {
		      alert: {
		        text: '확인',
		        value: true,
		        visible: true,
		        className: 'btn btn-warning',
		        closeModal: true
		      }
		    }
		  });
		return;
	};
	if($('input[name="empPwd"]').val().trim() == ""){
		swal({
		    title: '회원정보',
		    text: '비밀번호가 비어있습니다.',
		    icon: 'warning',
		    buttons: {
		      alert: {
		        text: '확인',
		        value: true,
		        visible: true,
		        className: 'btn btn-warning',
		        closeModal: true
		      }
		    }
		  });
		return;
	};
	if($('input[name="empPhone"]').val().trim() == ""){
		swal({
		    title: '회원정보',
		    text: '전화번호가 비어있습니다.',
		    icon: 'warning',
		    buttons: {
		      alert: {
		        text: '확인',
		        value: true,
		        visible: true,
		        className: 'btn btn-warning',
		        closeModal: true
		      }
		    }
		  });
		return;
	};
	if($('input[name="empMail"]').val() == ""){
		swal({
		    title: '회원정보',
		    text: '이메일이 비어있습니다.',
		    icon: 'warning',
		    buttons: {
		      alert: {
		        text: '확인',
		        value: true,
		        visible: true,
		        className: 'btn btn-warning',
		        closeModal: true
		      }
		    }
		  });
		return;
	};
// 	if($('input[name="empAdd"]').val().trim() == ""){
// 		swal({
// 		    title: '회원정보',
// 		    text: '주소가 비어있습니다.',
// 		    icon: 'warning',
// 		    buttons: {
// 		      alert: {
// 		        text: '확인',
// 		        value: true,
// 		        visible: true,
// 		        className: 'btn btn-warning',
// 		        closeModal: true
// 		      }
// 		    }
// 		  });
// 		return;
// 	};
	var form=$('form[role="form"]');	
	form.submit();
}

</script>

</html>

