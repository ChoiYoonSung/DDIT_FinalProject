<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>


<head></head>
<body style="padding: 40px; background: white;">

		<form method="post" role="form" action="piModify.do" name="modifyForm">
		<section class="content container">
		<h2 style="text-align: center">리스크 & 이슈  수정 (${pi.piTitle })</h2>
			<input type="hidden" id="piCode" name="piCode" value="${pi.piCode }">
			<input type="hidden" id="empId" name="empId" value="${pi.empId }">
			<input type="hidden" id="piMileStone" name="piMileStone" value="${pi.piMileStone }">
			<hr>
			<br>
			<div class="app-content" style="padding: 0px; margin-left: 0px;">
			<div class="row">
				<div class="col-12" style="text-align: right;">
				<c:if test="${loginUser.empId eq pi.empId }">
					<button type="button" id="modifyBtn" class="btn btn-yellow w-80px" onclick="modifyPi('${pi.piCode}');">수정</button>
					<button type="button" id="goBackBtn" class="btn btn-white w-80px" onclick="history.go(-1);">돌아가기</button>
				</c:if>
					<button type="button" id="closeBtn" class="btn btn-gray w-80px" onclick="CloseWindow();">닫기</button>
				</div>
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
				</fieldset>
		</section>
	</form>
<script type="text/javascript">
function milestoneSelect(){
	var selectedMileStone = $('select#milestoneSelect option:selected').val();
	$('input[name="piMileStone"]').val(selectedMileStone);
}

function modifyPi(code){
	if($('input[name="piTitle"]').val() == ""){
		swal({
			title: '이슈&리스크',
			text: '제목을 입력하세요.',
			icon: 'warning', // info success warning danger
			buttons: {
		        	confirm: {
				text: '확인',
		                value: true,
		                visible: true,
		                className: 'btn btn-warning', // primary success warning danger
		                closeModal: true
		              }
		        }
		});
		return;
	}
	if($('textarea[name="piContent"]').val() == ""){
		swal({
			title: '이슈&리스크',
			text: '내용을 입력하세요.',
			icon: 'warning', // info success warning danger
			buttons: {
		        	confirm: {
				text: '확인',
		                value: true,
		                visible: true,
		                className: 'btn btn-warning', // primary success warning danger
		                closeModal: true
		              }
		        }
		});
		return;
	}
	if($('input[name="piMileStone"]').val() == ""){
		swal({
			title: '이슈&리스크',
			text: '마일스톤을 선택 혹은 입력하세요.',
			icon: 'warning', // info success warning danger
			buttons: {
		        	confirm: {
				text: '확인',
		                value: true,
		                visible: true,
		                className: 'btn btn-warning', // primary success warning danger
		                closeModal: true
		              }
		        }
		});
		return;
	}
	 swal({
         title: '이슈&리스크 수정',
         text: '이슈코드 '+ code + '번을 수정하시겠습니까?',
         icon: 'info', // info success warning danger
         buttons: {
             cancel: {
                 text: '취소',
                 value: false,
                 visible: true,
                 className: 'btn btn-default', // primary success warning danger
                 closeModal: true,
               },
               confirm: {
                 text: '확인',
                 value: true,
                 visible: true,
                 className: 'btn btn-primary', // primary success warning danger
                 closeModal: true
               }
         }
       }).then(function(val){
	         if(val == true){
					$('form[role="form"]').submit();
                } else {
                	return;
                }
       });
}
window.addEventListener('load',function(){
	if('${loginUser.empId}' != '${pi.empId}'){
		alert('권한이 없습니다.');
		$('form[role="form"]').remove();
	}
})
</script>
</body>