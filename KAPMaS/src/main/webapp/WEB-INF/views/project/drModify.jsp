<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>
<body style="padding: 10px; ">
<form method="post" role="form" action="drModify.do" name="modifyForm">

<input type="hidden" name="pCode" value="${pCode }" />
<input type="hidden" name="empId" value="${loginUser.empId }" />
<input type="hidden" name="drCode" value="${dr.drCode }" />

	<div class="project-wrapper">
		<div class="panel panel-inverse" data-sortable-id="index-6" style="height: 400px;">
			
			<div class="table-responsive">
				<hr>
				<h2 style="text-align: center">"${pName }" 일일 업무 보고서 수정</h2>
				<hr>
				<br>
				<div style="padding-left: 100px; padding-top: 25px; padding-right: 100px;">
					<div class="row mb-15px">
					<span class="badge text-black" style="width: 100px; height: 30px;">
					<h6 style="line-height: 25px;">업무 종류</h6>
					</span>
						<div class="col-9">
							<select style="width: 200px; float: left;" name="jobCode" id="jobCode" class="form-select">
								<option value="">-업무 선택-</option>
								<c:forEach items="${jobList }" var="job" varStatus="status">
									<c:if test="${job.jobCode eq dr.jobCode }">
										<option value="${job.jobCode }" selected="selected">${job.jobName }</option>
									</c:if>
									<c:if test="${job.jobCode ne dr.jobCode }">
										<option value="${job.jobCode }" >${job.jobName }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row mb-15px">
					<span class="badge text-black" style="width: 100px; height: 30px;">
					<h6 style="line-height: 25px;">보고서 제목</h6>
					</span>
						<div class="col-md-9">
							<input type="text"  name="drTitle" id="drTitle" class="form-control mb-5px"  placeholder="제목을 입력하세요." value="${dr.drTitle }">
						</div>
					</div>
				
					<div class="row mb-15px">
						<span class="badge text-black" style="width: 100px; height: 30px;">
						<h6 style="line-height: 25px;">보고서 내용</h6>
						</span>
						<div class="col-md-9">
							<textarea class="form-control"  rows="3" name="drContent" id="drContent" placeholder="내용을 입력하세요.">${dr.drContent }</textarea>
						</div>
					</div>
					
				</div>

				<div class="btn-wrapper" style="padding-left: 210px;">
				<c:if test="${loginUser.empId eq dr.empId}">
					<input type="button" id="registBtn" class="btn btn-yellow w-100px"  onclick="modifyReport();" value="수정">
				</c:if>
					<button type="button" id="listBtn" class="btn btn-gray w-100px" onclick="CloseWindow();">닫기</button>
				</div>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript">
function modifyReport(){
	if($('select[name="jobCode"]').val() == ""){
		swal({
			title: '일일 보고서',
			text: '업무를 선택하십시오.',
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
	if($('input[name="drTitle"]').val() == ""){
		swal({
			title: '일일 보고서',
			text: '제목을 입력하십시오.',
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
	if($('textarea[name="drContent"]').val() == ""){
		swal({
			title: '일일 보고서',
			text: '내용을 입력하십시오.',
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
        title: '일일보고서 수정',
        text: '일일보고서를 수정하시겠습니까?',
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
	if('${loginUser.empId}' != '${dr.empId}'){
		swal({
			title: '권한 제어',
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
		});
		$('form[role="form"]').remove();
	}
})
</script>
</body>