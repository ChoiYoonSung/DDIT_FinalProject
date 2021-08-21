<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- empId : ${report.empId}<br> --%>
<%-- bdCode ${report.bdCode}<br> --%>
<%-- rpBd ${report.rpBd}<br> --%>
<%-- rpTitle ${report.rpTitle}<br> --%>
<%-- rpCount ${report.rpCount}<br> --%>
<%-- rpBdName ${report.rpBdName}<br> --%>
<%-- <a href="<%=request.getContextPath() %>/admin/reportReset/${report.bdCode}">초기화</a> --%>
<%-- <a href="<%=request.getContextPath() %>/admin/reportDelete/${report.bdCode}">삭제</a> --%>
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
					<div class="mb-1">신고 글 - ${report.bdCode }</div>
				</div>
				<div class="register-content row">
					<div class="mb-3 col-5">
						<label class="mb-2">신고 게시글 이름</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="" value="${report.rpTitle }"
									readonly="readonly">
							</div>
						</div>
					</div>
										<div class="mb-3 col-5">
						<label class="mb-2">게시판 위치</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="" value="${report.rpBdName  }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3 col-2">
						<label class="mb-2">신고수</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="" value="${report.rpCount  }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3 col-12">
						<label class="mb-2">공지사항 내용</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<textarea class="form-control fs-13px"
									style="height: 140px; resize: none;" readonly="readonly">${report.rpCount}</textarea>
							</div>
						</div>
					</div>
					<div class="mb-3 app-content col-12">
						<div class="row">
							<div class="col-4">
								<a type="button" href="<%=request.getContextPath() %>/admin/reportReset/${report.bdCode}"
									class="btn btn-primary d-block w-100 btn-lg h-45px fs-13px">초기화</a>
							</div>
							<div class="col-4">
								<a type="button" href="<%=request.getContextPath() %>/admin/reportDelete/${report.bdCode}"
									class="btn btn-danger d-block w-100 btn-lg h-45px fs-13px">삭제</a>
							</div>
							<div class="col-4">
								<a type="button" href="<%=request.getContextPath() %>/admin/reportManage"
									id="cancelButton"
									class="btn btn-secondary d-block w-100 btn-lg h-45px fs-13px">돌아가기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script>
	</script>
</body>