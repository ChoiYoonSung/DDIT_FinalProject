<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
					<div class="mb-1">QNA</div>
				</div>
				<div class="register-content row">
					<div class="mb-3 col-8">
						<label class="mb-2">QNA 제목</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="hidden" name="qnaNo" value="${qnaInfo.qnaNo}">
								<input type="text" class="form-control fs-13px" placeholder="" name="qnaTitle" value="${qnaInfo.qnaTitle}">
							</div>
						</div>
					</div>
					<div class="mb-3 col-2">
					</div>
					<div class="mb-3 col-2">
					</div>
					<div class="mb-3 col-12">
						<label class="mb-2">QNA 내용</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<textarea class="form-control fs-13px" name="qnaContent" style="height: 140px; resize: none;">${qnaInfo.qnaContent}</textarea>
							</div>
						</div>
					</div>
				</div>
			<div class="mb-3 app-content col-12">
				<div class="row">
					<div class="col-6">
						<a type="button" onclick="modifyGO();"
							class="btn btn-primary d-block w-100 btn-lg h-45px fs-13px">수정</a>
					</div>
					<div class="col-6">
						<a type="button" onclick="javascript:CloseWindow();"
							id="cancelButton"
							class="btn btn-secondary d-block w-100 btn-lg h-45px fs-13px">뒤로가기</a>
					</div>
				</div>
			</div>
		</div>
		</div>

	</div>
	<script>
		function modifyGO(){
			var qnaNo = $('input[name="qnaNo"]').val();
			var qnaTitle = $('input[name="qnaTitle"]').val();
			var qnaContent = $('textarea[name="qnaContent"]').val();

			if(!(qnaTitle && qnaContent)){
    			swal({
					title : '경고',
					text : '작성자 혹은 내용은 필수입니다.',
					icon : 'warning', // primary success warning danger
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning',
							closeModal : true
						}
					}
				});
				return;
			}
			
			var param = {
					qnaNo : qnaNo,
					qnaTitle : qnaTitle,
					qnaContent : qnaContent	
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/center/qna/qnaModify.do",
				type:"POST",
				data:param,
				success:function(data){
		    		swal({
						title : '수정 완료',
						text : '질문글이 수정이 완료되었습니다.',
						icon : 'success', // primary success warning danger
						buttons : {
							confirm : {
								text : '확인',
								value : true,
								visible : true,
								className : 'btn btn-primary',
								closeModal : true
							}
						}
					}).then(function(val) {
						if (val == true) {
							window.location.href = "<%=request.getContextPath()%>/center/qna/" + data;
						}
					});
				},
				error:function(error){
		    		swal({
						title : '수정 실패',
						text : '수정에 실패하였습니다. 관리자에게 문의하세요',
						icon : 'error', // primary success warning danger
						buttons : {
							confirm : {
								text : '확인',
								value : true,
								visible : true,
								className : 'btn btn-danger',
								closeModal : true
							}
						}
					})
				}
			});
		}
	</script>
</body>
