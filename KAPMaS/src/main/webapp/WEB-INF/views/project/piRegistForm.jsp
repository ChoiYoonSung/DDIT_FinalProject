<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>


<head></head>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>
<body style="padding: 40px; background: white;">

		<form method="post" role="form" action="piRegist.do" name="registForm">
		<section class="content container">
		<h2 style="text-align: center" onclick="fillForm();">이슈 & 리스크 등록</h2>
			<input type="hidden" id="empId" name="empId" value="${loginUser.empId }">
			<input type="hidden" id="pCode" name="pCode" value="${pCode }">
			<hr>
			<br>
			<div class="app-content" style="padding: 0px; margin-left: 0px;">
			</div>
				<fieldset>
					<div class="row mb-3">
						<label class="form-label col-form-label col-3">이슈 제목</label>
						<div class="col-md-9 row">
							<div class="col-6">
								<input type="text" name="piTitle" class="form-control" placeholder="이슈 제목을 입력하십시오." value="">
							</div> 
						</div>
					</div>
					<div class="row mb-3">
						<label class="form-label col-form-label col-md-3">이슈 내용</label>
						<div class="col-md-9">
							<textarea name="piContent" class="form-control" rows="3" style="min-height: 300px; font-size: 15px; resize: none;" placeholder="이슈 내용을 입력하십시오."></textarea>
						</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">마일스톤</label>
						<div class="col-9 row">
							<div class="col-6">
								<select id="milestoneSelect" class="form-select" onchange="milestoneSelectFn();">
									<option class="milestone" value="direct" selected="selected">직접 입력</option>
									<c:forEach var="piMileStone" items="${piMileStoneList }">
										<option class="milestone">${piMileStone }</option>
									</c:forEach>
								</select>
								<input type="text" id="piMileStone" name="piMileStone" value=""/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12" style="text-align: center;">
							<button type="button" id="registBtn" class="btn btn-primary w-100px" onclick="registIssue();">등록</button>
							<button type="button" id="closeBtn" class="btn btn-gray w-100px" onclick="CloseWindow();">닫기</button>
						</div>
					</div>
				</fieldset>
		</section>
	</form>
<script type="text/javascript">

function fillForm(){
	$('input[name="piTitle"]').val("파일 다운로드 이슈");
	$('textarea[name="piContent"]').val("파일 다운로드 경로가 충돌되었습니다. 해결방안을 모색해야 할 것 같습니다.");
	$('input[name="piMileStone"]').val("파일 다운로드");
}
	
function milestoneSelectFn(){
	var selectedMileStone = $('select#milestoneSelect option:selected').val();
	$('input[name="piMileStone"]').val(selectedMileStone);
	
	$('input#piMileStone').hide();
	if(selectedMileStone == 'direct'){
		$('input#piMileStone').val('');
		$('input#piMileStone').show();
	}else{
		$('input#piMileStone').hide();
	}
}

function registIssue(){
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
         title: '이슈&리스크 등록',
         text: '이슈를 등록하시겠습니까?',
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

</script>
</body>