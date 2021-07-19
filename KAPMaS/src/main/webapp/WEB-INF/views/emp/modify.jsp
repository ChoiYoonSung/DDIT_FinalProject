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
			<!-- BEGIN profile -->
			<div class="profile">
				<div class="profile-header">
					<!-- BEGIN profile-header-cover -->
					<div class="profile-header-cover"></div>
					<!-- END profile-header-cover -->
					<!-- BEGIN profile-header-content -->
					<div class="profile-header-content">
						<!-- BEGIN profile-header-img -->
						<div class="profile-header-img" id="imgView" data-id="${emp.empId }" style="height: 144px; width: 144px; margin: 0;"></div>
						<!-- END profile-header-img -->
						<!-- BEGIN profile-header-info -->
						<div class="profile-header-info">
							<h4 class="mt-0 mb-1">${emp.empName }</h4>
							<p class="mb-2">${emp.empId }</p>
							<label for="inputFile" class=" btn btn-yellow btn-sm btn-flat input-group-addon" onchange="changePicture_go();">사진변경</label>
							<input id="inputFileName" class="form-control" type="text" name="tempImg" disabled value="${emp.empImg.split('\\$\\$')[1] }" style="opacity: 0.5;"/>
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
											<h4>${emp.empName}(${emp.empId }) <small>${emp.empAuth }</small></h4>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr class="divider">
										<td colspan="2"></td>
									</tr>
									<tr class="highlight">
										<td class="field">부서 / 직급</td>
										<td id="deprnk">
											<select class="form-select w-200px" name="depCode">
											<c:forEach items="${depList }" var="dep" >
												<option value="${dep.depCode }" ${dep.depCode eq emp.depCode ? 'selected' : ''}>${dep.depName }</option>
											</c:forEach>
											</select>
											<select class="form-select w-200px" name="rnkCode" >
											<c:forEach items="${rankList }" var="rnk" >
												<option value="${rnk.rnkCode }" ${rnk.rnkCode eq emp.rnkCode ? 'selected' : ''}>${rnk.rnkName }</option>
											</c:forEach>
											</select>
										</td>
									</tr>
									<tr class="divider">
										<td colspan="2"></td>
									</tr>
									<tr>
										<td class="field">Mobile <i class="fa fa-mobile fa-lg me-5px"></i></td>
										<td><input type="text" class="form-control" id="modifyPhone" name="empPhone" placeholder="ex)010-0000-0000(숫자만 입력하시오.)" value="${emp.empPhone }" onkeyup="phoneTest();"></td>
									</tr>
									<tr>
										<td class="field">Email</td>
										<td><input type="text" class="form-control" id="modifyEmail" name="empEmail" placeholder="ex)mail@KAPMaS.co.kr" value="${emp.empEmail }"></td>
									</tr>
									<tr>
										<td class="field">Address</td>
										<td><input type="text" class="form-control" id="modifyAddress" name="empAdd" placeholder="ex)대전광역시 중구 대흥동..." value="${emp.empAdd }"></td>
									</tr>
									<tr class="divider">
										<td colspan="2"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- END table -->
						<div class="row">
							<div class="col-12 text-center">
								<button type="submit" class="btn btn-yellow border-0 w-150px ms-5px">수정</button>
								<button type="button" class="btn btn-white border-0 w-150px ms-5px" onclick="CloseWindow();">닫기</button>
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

</body>


<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/emp.js"></script>
<script type="text/javascript">
window.onload=function (){
	MemberPictureThumb(document.querySelector('[data-id="${emp.empId}"]'),'${emp.empImg}');
};

function phoneTest(){
	var inputVal = $('#modifyPhone').val();
	if((!(event.keyCode > 47 && 58 > event.keyCode) && (event.keyCode != 220))){
		inputVal = inputVal.substr(0, inputVal.length -1);
		$('#modifyPhone').val(inputVal);
	}else if($('#modifyPhone').val().length > 13){
		inputVal = inputVal.substr(0, 13);
		$('#modifyPhone').val(inputVal);
	}else if(inputVal.length == 3 || inputVal.length == 8){
		inputVal = inputVal + "-";
		$('#modifyPhone').val(inputVal);
	}
}



function changePicture_go(){
	var picture = $('input#inputFile')[0];
	
	var fileFormat = picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
	
	//이미지 확장자 jpg 확인
	if(!(fileFormat=="JPG" || fileFormat=="JPEG" || fileFormat=="PNG")){
		alert("이미지는 jpg 형식만 가능합니다.");
		return;
	} 
	//이미지 파일 용량 체크
	if(picture.files[0].size>1024*1024*3){
		alert("사진 용량은 3MB 이하만 가능합니다.");
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
	if($('input[name="empImg"]') == null){
		alert('사진이 비어있으면 안됩니다.');
		return;
	}
	var form=$('form[role="form"]');	
	form.submit();
}



</script>




</html>