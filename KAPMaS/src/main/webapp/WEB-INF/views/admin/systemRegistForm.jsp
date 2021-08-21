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
					<div class="mb-1">이용가이드 등록</div>
				</div>
				<div class="register-content">
					<form action="<%=request.getContextPath() %>/admin/systemRegist" role="form" method="post">
					<div class="mb-3">
						<label class="mb-2">이용가이드 제목</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px" name="sgTitle" placeholder="제목을 입력하시오" value="">
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label class="mb-2">이용가이드 내용</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<textarea class="form-control fs-13px" name="sgContent" style="height: 140px; resize: none;"></textarea>
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label class="mb-2">이용가이드 카테고리</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<select name="sgType" class="form-select">
										<option value="공통">-선택하시오-</option>
										<option value="공통">공통</option>
										<option value="프로젝트">프로젝트 관리</option>
										<option value="지식 관리">지식 관리</option>
										<option value="FAQ">FAQ</option>
								</select>
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
								<button type="button" onclick="location.href='<%=request.getContextPath() %>/admin/guideManage'"
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
		function signUpToCop() {
			var form = $('form[role="form"]');
			form.submit();
		}
	</script>
	
</body>




