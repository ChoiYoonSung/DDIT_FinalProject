<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


<body class="pace-done pace-top">
	<div class="pace pace-inactive">
		<div class="pace-progress" data-progress-text="100%"
			data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
			<div class="pace-progress-inner"></div>
		</div>
		<div class="pace-activity"></div>
	</div>

	<div id="loader" class="app-loader loaded">
		<span class="spinner"></span>
	</div>

	<div id="app" class="app">
		<div class="register register-with-news-feed">
			<div class="register-container" style="margin: 0px;width: 100%;">
				<div class="register-header mb-25px h1">
					<div class="mb-1">이용가이드</div>
				</div>
				<div class="register-content">
					<form action="signUp" role="form" method="post">
						<input type="hidden" name="noticeNo" value="${system.sgCode}">
					</form>
					<div class="mb-3">
						<label class="mb-2">이용가이드 제목</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="" value="${system.sgTitle }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label class="mb-2">이용가이드 내용</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<textarea class="form-control fs-13px" style="height: 140px; resize: none;" readonly="readonly">${system.sgContent}</textarea>
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label class="mb-2">등록일</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="" value="${system.sgRegdate  }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label class="mb-2">카테고리</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="" value="${system.sgType  }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label class="mb-2">조회수</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="" value="${system.sgViewcnt  }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3 app-content">
						<div class="row">
							<div class="col-4">
								<button type="button" onclick="deleteSystem('${system.sgCode}');"
									class="btn btn-primary d-block w-100 btn-lg h-45px fs-13px">삭제</button>
							</div>
							<div class="col-4">
								<button type="button" onclick="location.href='<%=request.getContextPath() %>/admin/systemModifyForm/${system.sgCode }'" 
									class="btn btn-primary d-block w-100 btn-lg h-45px fs-13px">수정</button>
							</div>
							<div class="col-4">
								<button type="button" onclick="location.href='<%=request.getContextPath() %>/admin/guideManage'"
									id="cancelButton"
									class="btn btn-secondary d-block w-100 btn-lg h-45px fs-13px">돌아가기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script>
	function deleteSystem(sgCode){
		<%-- if(confirm("이용가이드를 삭제 하시겠습니까?")){
			
			location.href = "<%=request.getContextPath() %>/admin/systemDelete?sgCode="+sgCode;
			
			
			}else{
				return;
			} --%>
		
		
		   swal({
               title: '이용가이드 삭제',
               text: '이용가이드를 삭제 하시겠습니까?',
               icon: 'warning', // primary success warning danger
               buttons: {
                   cancel: {
                       text: '취소',
                       value: false,
                       visible: true,
                       className: 'btn btn-default',
                       closeModal: true,
                     },
                     confirm: {
                       text: '확인',
                       value: true,
                       visible: true,
                       className: 'btn btn-primary',
                       closeModal: true
                     }
               }
             }).then(function(val){
                if(val == true){
                	location.href = "<%=request.getContextPath() %>/admin/systemDelete?sgCode="+sgCode;
                } else {
                	return;
                }
             });
		
		
	}
	
	
	</script>
	
	
	
</body>
