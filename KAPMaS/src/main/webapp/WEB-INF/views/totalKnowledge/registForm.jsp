<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/totalKnowledge/js/tkRegist.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<body style="padding: 40px; background: white;">
	<form enctype="multipart/form-data" method="post" action="regist.do"
		name="registForm">
		<fieldset>
			<input type="hidden" value="<%=session.getAttribute("tkCode")%>"
				name="tkCode"> <input type="hidden" id="empId" readonly
				name="empId" class="form-control" value="${loginUser.empId }">

			<legend class="mb-3" style="text-align: center;">기타 자료 게시판 글등록</legend>
			<hr>
			<div class="mb-3">
				<label class="form-label" for="tkTitle">제목</label> <input
					class="form-control" type="text" id="tkTitle" name="tkTitle"
					placeholder="제목을 입력하세요" maxlength="20">
			</div>

			<div class="mb-3">
				<label class="form-label" for="tkContent">내용</label>
				<textarea class="form-control" rows="15" name="tkContent">
				</textarea>
												<textarea class="textarea" name="content" id="content" rows="20"
									placeholder="1000자 내외로 작성하세요." style="display: none;"></textarea>
			</div>
			<div class="app-content">
				<div class="row">
					<div class="col-md-8 ui-sortable">
						<div class="card card-outline card-success">
							<div class="card-header">
								<h5 style="display: inline; line-height: 40px;">첨부파일 :</h5>
								&nbsp;&nbsp;
								<button class="btn btn-xs btn-primary" onclick="addFile_go();"
									type="button" id="addFileBtn">Add File</button>
							</div>
							<div class="card-footer fileInput"></div>
						</div>
					</div>
					<div class="col-md-4 ui-sortable">
						<div >
							<div class="input-group">
								<input type="text" class="form-control form-control-lg" id="addKW"
									placeholder="검색할 키워드를 입력하고 추가버튼을 클릭하세요">
								<button type="button" class="btn btn-lg" onclick="addKeyword()">
									<i class="fas fa-lg fa-fw  fa-plus-circle"></i>
								</button>
							</div>
						</div>
						<ul class="popular-tags" id="KWList">
			
						</ul>
					</div>
				</div>
			</div>
			<input type="hidden" id="tkKeyword" name="tkKeyword">
			<div style="width: 210px; margin: 0 auto; margin-top: 30px;">
				<button type="button" class="btn btn-primary w-100px me-5px"
					id="registBtn" onclick="regist_go();">등록</button>
				<button type="button" class="btn btn-default w-100px" id="cancelBtn"
					onclick="CloseWindow();">취소</button>
			</div>
		</fieldset>
	</form>

	<!-- script -->
</body>

<script>
window.onload=function(){
	Summernote_start($('#content')); 
}

</script>

<%@ include file="/WEB-INF/views/common/summernote.jsp" %>



















