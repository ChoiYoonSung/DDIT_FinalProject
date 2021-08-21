<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
				<div class="profile-header-img" id="pictureView" data-id="${emp.empId }"
					style="height: 144px; width: 144px; margin: 0;"></div>
				<!-- END profile-header-img -->
				<!-- BEGIN profile-header-info -->
				<div class="profile-header-info">
					<h4 class="mt-0 mb-1">${emp.empName }(${emp.empId })</h4>
					<br>
					<c:if test="${emp.empId eq loginUser.empId }">
					<a href="<%=request.getContextPath() %>/emp/modify/${loginUser.empId}" class="btn btn-xs btn-primary">
					수정하기
					</a>
					</c:if>
				</div>
				<!-- END profile-header-info -->
			</div>
			<!-- END profile-header-content -->

		</div>
	</div>
	<!-- END profile -->
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
								<th id="dep" hidden>${emp.depCode }</th>
								<th id="rnk" hidden>${emp.rnkCode }</th>
								<th>
									<h4>${emp.empName }</h4>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr class="divider">
								<td colspan="2"></td>
							</tr>
							<tr class="highlight">
								<td class="field">부서 | 직급</td>
								<td id="deprnk"></td>
							</tr>
							<tr class="divider">
								<td colspan="2"></td>
							</tr>
							<tr>
								<td class="field">Mobile
								<i class="fa fa-mobile fa-lg me-5px"></i>
								</td>
								<td id="empPhone">${emp.empPhone }</td>
							</tr>
							<tr>
								<td class="field">Email
								<i class="fa fa-envelope fa-lg me-5px"></i>
								</td>
								<td>${emp.empEmail }</td>
							</tr>
<!-- 							<tr> -->
<!-- 								<td class="field">Address -->
<!-- 								<i class="fa fa-address-book fa-lg me-5px"></i> -->
<!-- 								</td> -->
<%-- 								<td>${emp.empAdd }</td> --%>
<!-- 							</tr> -->
							<tr class="divider">
								<td colspan="2"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- END table -->
				<div class="row">
					<div class="col-12 text-center">
						<button type="button"
							class="btn btn-gray border-0 w-150px ms-5px"
							onclick="CloseWindow();">닫기</button>
					</div>
				</div>
			</div>
			<!-- END #profile-about tab -->

		</div>
		<!-- END tab-content -->
	</div>
	<!-- END profile-content -->
</div>
	</div>
</div>
<script>
window.onload=function(){
	MemberPictureThumb(document.querySelector('[data-id="${emp.empId}"]'),'${emp.empImg}');
	deprnk();
	var empPhoneNum = $('#empPhone').html();
	if(empPhoneNum.length == 11){
		empPhoneNum = empPhoneNum.substr(0,3) + '-'+ empPhoneNum.substr(3,4) + '-'+ empPhoneNum.substr(7,4)
	}else if(empPhoneNum.length == 10){
		empPhoneNum = empPhoneNum.substr(0,3) + '-'+ empPhoneNum.substr(3,3) + '-'+ empPhoneNum.substr(6,4)
	}
	$('#empPhone').html(empPhoneNum);
};
	
function deprnk(){
	var depCode = document.getElementById('dep').innerHTML;
	var rnkCode = document.getElementById('rnk').innerHTML;
	var data={
			"depCode":depCode,
			"rnkCode":rnkCode
	}
	
	$.ajax({
		url : "<%=request.getContextPath()%>/project/getMemberInfo",
		type : "post",
		data : JSON.stringify(data),
		contentType : "application/json",
		success : function(data) {
			var result = data.split(',');
			document.getElementById('deprnk').innerHTML = result[0] + ' - ' + result[1];
		},
		error : function(error) {
// 			alert("시스템오류로입니다.관리자에게 문의해주세요.");
			swal({
			    title: 'Error',
			    text: '시스템오류로입니다.관리자에게 문의해주세요.',
			    icon: 'danger',
			    buttons: {
			      alert: {
			        text: '확인',
			        value: true,
			        visible: true,
			        className: 'btn btn-danger',
			        closeModal: true
			      }
			    }
			  });
		}

	});
}
</script>

</body>