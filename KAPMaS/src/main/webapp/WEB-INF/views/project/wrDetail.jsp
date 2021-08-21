<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>
<body style="padding: 10px; ">
	<div class="project-wrapper">
		<div class="panel panel-inverse" data-sortable-id="index-6">
			<div class="table-responsive">
				<hr>
				<h2 style="text-align: center">"${pName } - ${wr.wrTitle }" 주간 업무 보고서</h2>
				<hr>
				<div style="margin-left: 50px; margin-top: 10px; margin-right: 50px;">
					<div class="row mb-15px">
						<div class="col-12" style="text-align: right;">
						<c:if test="${loginUser.empId eq wr.empId }">
							<input type="button" id="modifyBtn" class="btn btn-yellow w-100px"  onclick="modifyWr();" value="수정">
							<input type="button" id="deleteBtn" class="btn btn-danger w-100px" onclick="deleteWr();" value="삭제">
						</c:if>
						<button type="button" id="listBtn" class="btn btn-gray w-100px" onclick="CloseWindow();">닫기</button>
						</div>
					</div>
					<div class="row mb-15px">
						<div class="col-12" style="text-align: right;">
							<p>작성자 : ${emp.empName } &nbsp; &nbsp; &nbsp; &nbsp;작성일 : ${wr.wrRegDate }</p>
						</div>
					</div>
					
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
					<h6 style="line-height: 25px;">보고서 제목</h6>
					</span>
						<div class="col-9">
							<input type="text" readonly="readonly" name="name" id="name" class="form-control mb-5px" value="${wr.wrTitle }">
						</div>
					</div>
				
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
						<h6 style="line-height: 25px;">주간 계획</h6>
						</span>
						<div class="col-9">
							<textarea class="form-control" readonly="readonly" rows="3" name="content" id="content"  style="resize: none;">${wr.wrPlan }</textarea>
						</div>
					</div>
					
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
						<h6 style="line-height: 25px;">진행현황</h6>
						</span>
						<div class="col-9">
							<textarea class="form-control" readonly="readonly" rows="3" name="content" id="content" style="resize: none;" >${wr.wrProg }</textarea>
						</div>
					</div>
					
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
						<h6 style="line-height: 25px;">주간 이슈</h6>
						</span>
						<div class="col-9">
							<textarea class="form-control" readonly="readonly" rows="3" name="content" id="content"  style="resize: none;">${wr.wrIssue }</textarea>
						</div>
					</div>
					
					<div class="row mb-15px">
					<span class="badge  text-black col-3" style="height: 30px;">
						<h6 style="line-height: 25px;">이슈 해결방안</h6>
						</span>
						<div class="col-9">
							<textarea class="form-control" readonly="readonly" rows="3" name="content" id="content" style="resize: none;" >${wr.wrIssueMeasures}</textarea>
						</div>
					</div>
					
					<div class="row mb-15px">
					<span class="badge text-black col-3" style="height: 30px;">
					<h6 style="line-height: 25px;">비고</h6>
					</span>
						<div class="col-9">
							<input type="text" readonly="readonly" name="name" id="name" class="form-control mb-5px" value="${wr.wrRemark }">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
function modifyWr(){
	window.location.href="<%=request.getContextPath() %>/project/wrModifyForm?wrCode=${wr.wrCode}";
}

function deleteWr(){
	swal({
        title: '삭제 확인',
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
	        	 window.location.href="<%=request.getContextPath() %>/project/wrRemove?wrCode=${wr.wrCode}";
               } else {
            	   return;
               }
      });
	
}
</script>
</body>

























