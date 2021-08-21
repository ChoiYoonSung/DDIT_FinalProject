<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
input.form-control{
	width:200px;
}
</style>
</head>
<body>
<div id="content" class="app-content">
<div class="panel" style="margin: 0; padding: 0; height: 650px;">
	<div class="panel-body">
			<!-- BEGIN profile -->
			<div class="profile">
				<div class="profile-header">
					<!-- BEGIN profile-header-cover -->
					<div class="profile-header-cover" style="background-image: none;"></div>
					<!-- END profile-header-cover -->
					<!-- BEGIN profile-header-content -->
					<div class="profile-header-content">
						<!-- BEGIN profile-header-img -->
						<div class="profile-header-img" id="imgView" data-id="${emp.empId }" style="height: 144px; width: 144px; margin: 0;"></div>
						<!-- END profile-header-img -->
						<!-- BEGIN profile-header-info -->
						<div class="profile-header-info">
							<h4 class="mt-0 mb-1">${emp.empName }(${emp.empId })</h4>
							<br>
							<div style="display: inline-block;">
							<label for="inputFile" class=" btn btn-primary btn-sm btn-flat input-group-addon" onchange="changePicture_go();">사진변경</label>
							<input id="inputFileName" class="form-control" type="text" name="tempImg" disabled value="${emp.empImg.split('\\$\\$')[1] }" style="opacity: 0.8;"/>
							</div>
						</div>
						<!-- END profile-header-info -->
					</div>
					<!-- END profile-header-content -->
					
				</div>
			</div>
			<!-- END profile -->
			<form role="form" class="form-horizontal" action="<%=request.getContextPath() %>/emp/modify.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="empId" value="${emp.empId }"/>
			<input type="hidden" name="empName" value="${emp.empName }"/>
			<input type="hidden" name="oldImg" value="${emp.empImg }"/>
			<input type="file" id="inputFile" onchange="changePicture_go();" name="empImg" style="display:none" />
			<input type="hidden" name="uploadImg" id="img" class="form-control"/>
			<!-- BEGIN profile-content -->
			<div class="profile-content">
				<!-- BEGIN tab-content -->
				<div class="tab-content p-0">
					<!-- BEGIN #profile-about tab -->
					<div class="tab-pane fade active show" id="profile-about">
						<!-- BEGIN table -->
						<div class="table-responsive form-inline">
							<table class="table table-profile align-middle">
								<thead>
									<tr>
										<th></th>
										<th>
											<h4>${emp.empName}(${emp.empId })</h4>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr class="divider">
										<td colspan="2"></td>
									</tr>
									<tr class="highlight">
										<td class="field">부서 | 직급</td>
										<td id="deprnk" class="row" style="margin: 0;">
											<div class="col-4">
											<select class="form-select" name="depCode">
											<c:forEach items="${depList }" var="dep" >
												<option value="${dep.depCode }" ${dep.depCode eq emp.depCode ? 'selected' : ''}>${dep.depName }</option>
											</c:forEach>
											</select>
											</div>
											<div class="col-4">
											<select class="form-select" name="rnkCode" >
											<c:forEach items="${rankList }" var="rnk" >
												<option value="${rnk.rnkCode }" ${rnk.rnkCode eq emp.rnkCode ? 'selected' : ''}>${rnk.rnkName }</option>
											</c:forEach>
											</select>
											</div>
										</td>
									</tr>
									<tr class="divider">
										<td colspan="2"></td>
									</tr>
									<tr>
										<td class="field">Password <i class="fa fa-key fa-lg"></i></td>
										<td><input type="password" class="form-control" id="modifyPwd" name="empPwd" placeholder="비밀번호를 입력하세요." value="" style="width: 235px;"></td>
									</tr>
									<tr>
										<td class="field">Mobile <i class="fa fa-mobile fa-lg"></i></td>
										<td><input type="text" class="form-control" id="modifyPhone" name="empPhone" placeholder="ex)010-0000-0000(숫자만 입력하시오.)" value="${emp.empPhone }" onkeyup="phoneTest();" style="width: 235px;"></td>
									</tr>
									<tr>
										<td class="field">Email <i class="fa fa-envelope fa-lg"></i></td>
										<td><input type="text" class="form-control" id="modifyEmail" name="empEmail" placeholder="ex)mail@KAPMaS.co.kr" value="${emp.empEmail }"  style="width: 235px;"></td>
									</tr>
<!-- 									<tr> -->
<!-- 										<td class="field">Address <i class="fa fa-address-book fa-lg"></i></td> -->
<%-- 										<td><input type="text" class="form-control" id="modifyAddress" name="empAdd" placeholder="ex)대전광역시 중구 대흥동..." value="${emp.empAdd }"  style="width: 235px;"></td> --%>
<!-- 									</tr> -->
									<tr class="divider">
										<td colspan="2"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- END table -->
						<div class="row">
							<div class="col-12 text-center">
								<button type="button" class="btn btn-primary border-0 w-150px ms-5px" onclick="modify_go();">수정</button>
								<button type="button" class="btn btn-gray border-0 w-150px ms-5px" onclick="CloseWindow();">닫기</button>
							</div>
						</div>
					</div>
					<!-- END #profile-about tab -->
					
				</div>
				<!-- END tab-content -->
			</div>
			<!-- END profile-content -->
			</form>
		</div>
	</div>
</div>
</body>


<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/emp.js"></script>
<script type="text/javascript">
window.addEventListener('load',function (){
	MemberPictureThumb(document.querySelector('[data-id="${emp.empId}"]'),'${emp.empImg}');
	var empPhoneNum = $('#modifyPhone').val();
	if(empPhoneNum.length == 11){
		empPhoneNum = empPhoneNum.substr(0,3) + '-'+ empPhoneNum.substr(3,4) + '-'+ empPhoneNum.substr(7,4)
	}else if(empPhoneNum.length == 10){
		empPhoneNum = empPhoneNum.substr(0,3) + '-'+ empPhoneNum.substr(3,3) + '-'+ empPhoneNum.substr(6,4)
	}
	$('#modifyPhone').val(empPhoneNum)
});

function phoneTest(){
	var inputVal = $('#modifyPhone').val();
	if((!(event.keyCode > 47 && 58 > event.keyCode) && (event.keyCode != 220))){
		inputVal = inputVal.substr(0, inputVal.length -1);
		$('input[name="empPhone"]').val(inputVal);
		return;
	}else if((!(event.keyCode > 47 && 58 > event.keyCode) && (event.keyCode != 220))){
		inputVal = inputVal.substr(0, inputVal.length -1);
		$('input[name="empPhone"]').val(inputVal);
		return;
	}else if(inputVal.length > 13){
		inputVal = inputVal.substr(0, 13);
		$('input[name="empPhone"]').val(inputVal);
		return;
	}else if(inputVal.length == 3 || inputVal.length == 8){
		inputVal = inputVal + "-";
		$('input[name="empPhone"]').val(inputVal);
		return;
	}
}



function changePicture_go(){
	var picture = $('input#inputFile')[0];
	
	var fileFormat = picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
	
	//이미지 확장자 jpg 확인
	if(!(fileFormat=="JPG" || fileFormat=="JPEG" || fileFormat=="PNG")){
// 		alert("이미지는 jpg 형식만 가능합니다.");
		swal({
		    title: '회원정보',
		    text: '이미지는 jpg 형식만 가능합니다.',
		    icon: 'warning', // primary success warning danger
		    buttons: {
		          confirm: {
		            text: '확인',
		            value: true,
		            visible: true,
		            className: 'btn btn-warning',
		            closeModal: true
		          }
		    }
		  });
		return;
	} 
	//이미지 파일 용량 체크
	if(picture.files[0].size>1024*1024*3){
// 		alert("사진 용량은 3MB 이하만 가능합니다.");
		swal({
		    title: '회원정보',
		    text: '사진 용량은 3MB 이하만 가능합니다.',
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
	if($('input[name="empImg"]').val().trim() == null){
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
	swal({
        title: '회원정보 수정',
        text: '회원정보를 수정하시겠습니까?',
        icon: 'info', // primary success warning danger
        buttons: {
            cancel: {
                text: '취소',
                value: false,
                visible: true,
                className: 'btn btn-default',
                closeModal: true,
              },
              confirm: {
                text: '확인',
                value: true,
                visible: true,
                className: 'btn btn-primary',
                closeModal: true
              }
        }
      }).then(function(val){
	         if(val == true){
				var form=$('form[role="form"]');	
				form.submit();
               } else {
            	   return;
               }
      });
}


</script>




</html>