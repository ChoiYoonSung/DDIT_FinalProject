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
			<div class="register-container" style="margin: 0px;width: 100%; padding-top: 0px;">
				<div class="register-header mb-25px h1">
					<div class="mb-1" onclick="fillForm();">공지사항 등록</div>
				</div>
				<div class="register-content">
					<form action="<%=request.getContextPath() %>/admin/noticeRegist" role="form" method="post">
					<div class="mb-3">
						<label class="mb-2">공지사항 제목</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px" name="noticeTitle" placeholder="제목을 입력하시오" value="">
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label class="mb-2">공지사항 내용</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<textarea class="form-control fs-13px" name="noticeContent" style="height: 140px; resize: none;"></textarea>
							</div>
						</div>
					</div>
					</form>
					<div class="mb-3 app-content">
						<div class="row">
							<div class="col-6">
								<button type="button" onclick="signUpToCop();"
									class="btn btn-primary d-block w-100 btn-lg h-45px fs-13px">등록</button>
							</div>
							<div class="col-6">
								<button type="button" onclick="location.href='<%=request.getContextPath() %>/admin/noticeManage'"
									id="cancelButton"
									class="btn btn-secondary d-block w-100 btn-lg h-45px fs-13px">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	
		function fillForm(){
			$('input[name="noticeTitle"]').val("서비스 점검 안내 (8월 13일 14:00~21:00)");
			$('textarea[name="noticeContent"]').val("안녕하세요. 카프마스입니다. \n\n항상 카프마스 서비스를 이용해 주시는 고객님께 깊은 감사를 드립니다. \n\n더욱 안정적인 서비스를 제공해 드리기 위해 계정 시스템 점검이 진행될 예정입니다. \n\n점검 시간 동안 카프마스 서비스가 중단되오니 양해 부탁드립니다. \n\n1. 점검 일시 : 2021년 8월 13일 새벽 2시 ~ 6시 (GMT+09:00) (예상치 못한 문제로 작업이 지연될 경우 시간이 연장될 수 있습니다.) \n\n2. 점검 영향 : 점검 시간 동안 아래 서비스 이용 불가 - 카프마스 계정 가입 - 카프마스 서비스 전체 서비스 이용에 불편을 드린 점 다시 한번 사과드리며,  보다 편하고 안정적인 서비스로 보답하겠습니다.  \n\n감사합니다.");
		}
		
		function signUpToCop() {
			var form = $('form[role="form"]');
			form.submit();
		}
	</script>
	
</body>




