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
					<div class="mb-1">공지사항</div>
				</div>
				<div class="register-content">
					<form action="signUp" role="form" method="post">
						<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
					</form>
					<div class="mb-3">
						<label class="mb-2">공지사항 제목</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="" value="${notice.noticeTitle }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label class="mb-2">공지사항 내용</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<textarea class="form-control fs-13px"
									style="height: 140px; resize: none;" readonly="readonly">${notice.noticeContent}</textarea>
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label class="mb-2">공지일</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="" value="${notice.noticeRegdate  }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label class="mb-2">조회수</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="" value="${notice.noticeViewcnt  }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3 app-content">
						<div class="row">
							<div class="col-4">
								<button type="button" onclick="deleteNotice('${notice.noticeNo}');"
									class="btn btn-primary d-block w-100 btn-lg h-45px fs-13px">삭제</button>
							</div>
							<div class="col-4">
								<button type="button" onclick="location.href='<%=request.getContextPath() %>/admin/noticeModifyForm/${notice.noticeNo }'" 
									class="btn btn-primary d-block w-100 btn-lg h-45px fs-13px">수정</button>
							</div>
							<div class="col-4">
								<button type="button" onclick="location.href='<%=request.getContextPath() %>/admin/noticeManage'"
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
	function deleteNotice(noticeNo){
		<%-- if(confirm("공지사항을 삭제 하시겠습니까?")){
			
			location.href = "<%=request.getContextPath() %>/admin/noticeDelete?noticeNo="+noticeNo;
			
			
			}else{
				return;
			} --%>
		
		
		   swal({
               title: '공지사항 삭제',
               text: '공지사항을 삭제 하시겠습니까?',
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
                	location.href = "<%=request.getContextPath() %>/admin/noticeDelete?noticeNo="+noticeNo;
        			
                } else {
                	return;
                }
             });
		
	}
	
	
	</script>
	
	
	
</body>
