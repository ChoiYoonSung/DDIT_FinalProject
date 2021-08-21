<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>
<body style="padding: 10px; ">
<form method="post" role="form" action="wrModify.do" name="modifyForm">

<input type="hidden" name="wrCode" value="${wr.wrCode }" />
<input type="hidden" name="pCode" value="${wr.pCode }" />
<input type="hidden" name="empId" value="${wr.empId }" />

	<div class="project-wrapper">
		<div class="panel panel-inverse" data-sortable-id="index-6">
			<div class="table-responsive">
				<hr>
				<h2 style="text-align: center">${pName } - 주간 업무 보고서 수정</h2>
				<hr>
				<div style="margin-left: 50px; margin-top: 10px; margin-right: 50px;">
					<div class="row mb-15px">
						<div class="col-12" style="text-align: right;">
						<c:if test="${loginUser.empId eq wr.empId }">
						<input type="button" id="modifyBtn" class="btn btn-yellow w-100px"  onclick="modifyWr();" value="수정">
						</c:if>
						<button type="button" id="listBtn" class="btn btn-gray w-100px" onclick="CloseWindow();">닫기</button>
						</div>
					</div>
					
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
					<h6 style="line-height: 25px;">보고서 제목</h6>
					</span>
						<div class="col-9">
							<input type="text" name="wrTitle" id="wrTitle" class="form-control mb-5px"  value="${wr.wrTitle }">
						</div>
					</div>
				
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
						<h6 style="line-height: 25px;">주간 계획</h6>
						</span>
						<div class="col-9">
							<textarea class="form-control" rows="3" name="wrPlan" id="wrPlan"  style="resize: none;">${wr.wrPlan }</textarea>
						</div>
					</div>
					
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
						<h6 style="line-height: 25px;">진행현황</h6>
						</span>
						<div class="col-9">
							<textarea class="form-control" rows="3" name="wrProg" id="wrProg"  style="resize: none;">${wr.wrProg }</textarea>
						</div>
					</div>
					
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
						<h6 style="line-height: 25px;">주간 이슈</h6>
						</span>
						<div class="col-9">
							<textarea class="form-control" rows="3" name="wrIssue" id="wrIssue"  style="resize: none;">${wr.wrIssue }</textarea>
						</div>
					</div>
					
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
						<h6 style="line-height: 25px;">이슈 해결방안</h6>
						</span>
						<div class="col-9">
							<textarea class="form-control" rows="3" name="wrIssueMeasures" id="wrIssueMeasures" style="resize: none;">${wr.wrIssueMeasures}</textarea>
						</div>
					</div>
					
					<div class="row mb-15px">
					<span class="badge text-black col-3" style="height: 30px;">
					<h6 style="line-height: 25px;">비고</h6>
					</span>
						<div class="col-9">
							<input type="text" name="wrRemark" id="wrRemark" class="form-control mb-5px" value="${wr.wrRemark }">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript">
function modifyWr(){
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
        title: '주간 보고서 수정',
        text: '수정하시겠습니까?',
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
	if('${loginUser.empId}' != '${wr.empId}'){
		swal({
			title: '권한 확인',
			text: '권한이 없습니다.',
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
		}).then(function(e){
			$('form[role="form"]').remove();
		});
	}
})
</script>

</body>




























