<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>
<body style="">
<form method="post" role="form" action="wrRegist.do" name="registForm">

<input type="hidden" name="pCode" value="${pCode }" />
<input type="hidden" name="empId" value="${loginUser.empId }" />

	<div class="project-wrapper">
		<div class="panel panel-inverse" data-sortable-id="index-6">
			<div class="table-responsive">
				<hr>
				<h2 style="text-align: center" onclick="fillForm();">${pName } - 주간 업무 보고서 작성</h2>
				<hr>
				<br>
				<div style="margin-left: 50px; margin-top: 10px; margin-right: 50px;">
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
					<h6 style="line-height: 25px;">보고서 제목</h6>
					</span>
						<div class="col-9">
							<input type="text"  name="wrTitle" id="wrTitle" class="form-control mb-5px"  placeholder="제목을 입력하세요." value="">
						</div>
					</div>
				
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
						<h6 style="line-height: 25px;">주간 계획</h6>
						</span>
						<div class="col-9">
							<textarea class="form-control"  rows="3" name="wrPlan" id="wrPlan"  placeholder="주간계획을 입력하세요." style="resize: none;"></textarea>
						</div>
					</div>
					
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
						<h6 style="line-height: 25px;">진행현황</h6>
						</span>
						<div class="col-9">
							<textarea class="form-control"  rows="3" name="wrProg" id="wrProg"  placeholder="진행현황을 입력하세요." style="resize: none;"></textarea>
						</div>
					</div>
					
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
						<h6 style="line-height: 25px;">주간 이슈</h6>
						</span>
						<div class="col-9">
							<textarea class="form-control"  rows="3" name="wrIssue" id="wrIssue"  placeholder="주간 이슈를 입력하세요." style="resize: none;"></textarea>
						</div>
					</div>
					
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
						<h6 style="line-height: 25px;">이슈 해결방안</h6>
						</span>
						<div class="col-9">
							<textarea class="form-control"  rows="3" name="wrIssueMeasures" id="wrIssueMeasures"  placeholder="이슈 해결방안을 입력하세요." style="resize: none;"></textarea>
						</div>
					</div>
					
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
					<h6 style="line-height: 25px;">비고</h6>
					</span>
						<div class="col-9">
							<input type="text"  name="wrRemark" id="wrRemark" class="form-control mb-5px" placeholder="비고를 입력하세요." value="">
						</div>
					</div>
				</div>

				<div class="btn-wrapper" style="padding-left: 292px; margin-bottom: 10px;">
					<input type="button" id="modifyBtn" class="btn btn-primary w-100px"  onclick="registReport();" value="등록">
					<button type="button" id="listBtn" class="btn btn-gray w-100px" onclick="CloseWindow();">닫기</button>
				</div>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript">

function fillForm(){
	$('input[name="wrTitle"]').val("21.08.13_주간 업무 보고");
	$('textarea[name="wrPlan"]').val("프로젝트 테스트, 예제 데이터 삽입, 발표 준비");
	$('textarea[name="wrProg"]').val("테스트 결과 이상 없음, 예제 데이터 삽입 완료, 발표 준비 완료");
	$('textarea[name="wrIssue"]').val("없음");
	$('textarea[name="wrIssueMeasures"]').val("없음");
	$('input[name="wrRemark"]').val("없음");
};

function registReport(){
	if($('input[name="wrTitle"]').val() == ""){
		swal({
			title: '주간 보고서',
			text: '보고서 제목을 입력하십시오.',
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
	if($('textarea[name="wrPlan"]').val() == ""){
		swal({
			title: '주간 보고서',
			text: '주간 계획을 입력하십시오.',
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
	if($('textarea[name="wrProg"]').val() == ""){
		swal({
			title: '주간 보고서',
			text: '진행현황을 입력하십시오.',
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
	if($('textarea[name="wrIssue"]').val() == ""){
		swal({
			title: '주간 보고서',
			text: '주간 이슈를 입력하십시오.',
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
	if($('textarea[name="wrIssueMeasures"]').val() == ""){
		swal({
			title: '주간 보고서',
			text: '이슈 해결방안을 입력하십시오.',
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
	if($('input[name="wrRemark"]').val() == ""){
		swal({
			title: '주간 보고서',
			text: '비고를 입력하십시오.',
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
        title: '주간 보고서 등록',
        text: '등록하시겠습니까?',
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