<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>


<head></head>
<body style="padding: 40px; background: white;">

		<form method="post" role="form" action="piModify.do" name="modifyForm">
		<section class="content container">
		<h2 style="text-align: center">이슈 수정 (${pi.piTitle })</h2>
			<input type="hidden" id="piCode" name="piCode" value="${pi.piCode }">
			<input type="hidden" id="empId" name="empId" value="${pi.empId }">
			<input type="hidden" id="piMileStone" name="piMileStone" value="${pi.piMileStone }">
			<hr>
			<br>
			<div class="app-content" style="padding: 0px; margin-left: 0px;">
			<div class="row">
				<div class="col-12">
					<p style="float: right">작성자 : <b>${pi.empId }</b> &nbsp; &nbsp; &nbsp; &nbsp;작성일 : <b>${pi.piRegDate }</b></p>
				</div>
			</div>
			</div>
				<fieldset>
					<div class="row mb-3">
						<label class="form-label col-form-label col-3">이슈 제목</label>
						<div class="col-md-9 row">
							<div class="col-6">
								<input type="text" name="piTitle" class="form-control" placeholder="이슈 제목을 입력하십시오." value="${pi.piTitle }">
							</div> 
						</div>
					</div>
					<div class="row mb-3">
						<label class="form-label col-form-label col-md-3">이슈 내용</label>
						<div class="col-md-9">
							<textarea name="piContent" class="form-control" rows="3" style="min-height: 300px; font-size: 15px;" placeholder="이슈 내용을 입력하십시오.">${pi.piContent }</textarea>
						</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">마일스톤</label>
						<div class="col-9 row">
							<div class="col-6">
								<select id="milestoneSelect" class="form-select" onchange="milestoneSelect();">
									<c:forEach var="piMileStone" items="${piMileStone }">
										<c:choose>
											<c:when test="${pi.piMileStone ne piMileStone}">
												<option class="milestone">${piMileStone }</option>
											</c:when>
											<c:when test="${pi.piMileStone eq piMileStone}">
												<option class="milestone" selected="selected">${piMileStone }</option>
											</c:when>
										</c:choose>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-7 offset-md-3">
							<button type="submit" id="modifyBtn" class="btn btn-warning w-100px" onclick="modifyPi(${pi.piTitle});">수정</button>
							<button type="button" id="goBackBtn" class="btn btn-white w-100px" onclick="history.go(-1);">돌아가기</button>
							<button type="button" id="closeBtn" class="btn btn-gray w-100px" onclick="CloseWindow();">닫기</button>
						</div>
					</div>
				</fieldset>
		</section>
	</form>
<script type="text/javascript">
function milestoneSelect(){
	var selectedMileStone = $('select#milestoneSelect option:selected').val();
	$('input[name="piMileStone"]').val(selectedMileStone);
}
function modifyPi(title){
	if(!confirm('이슈코드 '+ title + '번을 수정하시겠습니까?')){
		return;
	}
}
</script>
</body>