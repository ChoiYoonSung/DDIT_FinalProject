<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
				<div class="profile-header-img" id="pictureView" data-id="${emp.empId }"
					style="height: 144px; width: 144px; margin: 0;"></div>
				<!-- END profile-header-img -->
				<!-- BEGIN profile-header-info -->
				<div class="profile-header-info">
					<h4 class="mt-0 mb-1">${emp.empName }(${emp.empId })</h4>
					<p class="mb-2">${emp.empAuth }</p>
					<a
						href="<%=request.getContextPath() %>/emp/modify/${loginUser.empId}"
						class="btn btn-xs btn-yellow">수정하기</a>
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
								<th>부서 / 직급</th>
								<th id="dep" hidden>${emp.depCode }</th>
								<th id="rnk" hidden>${emp.rnkCode }</th>
								<th id="deprnk"></th>
							</tr>
						</thead>
						<tbody>
							<tr class="divider">
								<td colspan="2"></td>
							</tr>
							<tr>
								<td class="field">Mobile <i
									class="fa fa-mobile fa-lg me-5px"></i></td>
								<td>0${emp.empPhone }</td>
							</tr>
							<tr>
								<td class="field">Email</td>
								<td>${emp.empEmail }</td>
							</tr>
							<tr>
								<td class="field">Address</td>
								<td>${emp.empAdd }</td>
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
						<button type="button"
							class="btn btn-white border-0 w-150px ms-5px"
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

<script>
window.onload=function(){
	MemberPictureThumb(document.querySelector('[data-id="${emp.empId}"]'),'${emp.empImg}');
	deprnk();
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
			document.getElementById('deprnk').innerHTML = result[0];
			document.getElementById('deprnk').innerHTML += " / "
					+ result[1];

		},
		error : function(error) {

			alert("시스템오류로입니다.관리자에게 문의해주세요.");
		}

	});
}
</script>

</body>