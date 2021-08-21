<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>
<body style="padding: 10px; ">
<form method="post" role="form" action="drRegist.do" name="registForm">

<input type="hidden" name="pCode" value="${pCode }" />
<input type="hidden" name="empId" value="${loginUser.empId }" />

	<div class="project-wrapper">
		<div class="panel panel-inverse" data-sortable-id="index-6">
			<div class="table-responsive">
				<hr>
				<h2 style="text-align: center">"${pName }" 일일 업무 보고서</h2>
				<hr>
				<div style="padding-left: 100px; padding-top: 25px; padding-right: 100px;">
					<div class="row mb-15px">
						<div class="col-12" style="text-align: right;">
						<c:if test="${loginUser.empId eq dr.empId}">
						<input type="button" id="modifyBtn" class="btn btn-yellow w-100px"  onclick="modifyDr();" value="수정">
						<input type="button" id="deleteBtn" class="btn btn-danger w-100px" onclick="deleteDr();" value="삭제">
						</c:if>
						<button type="button" id="listBtn" class="btn btn-gray w-100px" onclick="CloseWindow();">닫기</button>
						</div>
					</div>
					<div class="row mb-15px">
						<div class="col-12" style="text-align: right;">
							<p>작성자 : ${emp.empName } &nbsp; &nbsp; &nbsp; &nbsp;작성일 : ${dr.drRegDate }</p>
						</div>
					</div>
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
					<h6 style="line-height: 25px;">업무 종류</h6>
					</span>
						<div class="col-9">
							<input type="text"  name="job" id="job" class="form-control mb-5px" value="${jobName }" readonly="readonly">
						</div>
					</div>
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
					<h6 style="line-height: 25px;">보고서 제목</h6>
					</span>
						<div class="col-md-9">
							<input type="text"  name="drTitle" id="drTitle" class="form-control mb-5px"  value="${dr.drTitle }"  readonly="readonly">
						</div>
					</div>
				
					<div class="row mb-15px">
						<span class="badge  text-black col-3" style="height: 30px;">
						<h6 style="line-height: 25px;">보고서 내용</h6>
						</span>
						<div class="col-md-9">
							<textarea class="form-control"  rows="3" name="drContent" id="drContent" readonly="readonly" style="resize: none;">${dr.drContent }</textarea>
						</div>
					</div>
					
				</div>

			</div>
		</div>
	</div>
</form>
<script type="text/javascript">
function modifyDr(){
	window.location.href="<%=request.getContextPath() %>/project/drModifyForm?drCode=${dr.drCode}";
}

function deleteDr(){
	swal({
        title: '일일 보고서 삭제',
        text: '정말 삭제하시겠습니까?',
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
	        	 window.location.href="<%=request.getContextPath() %>/project/drRemove?drCode=${dr.drCode}";
               } else {
            	   return;
               }
      });
}
</script>
</body>